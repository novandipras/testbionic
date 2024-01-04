import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:novandi/core_module/data/local/local_data_source_impl.dart';
import 'package:novandi/core_module/data/remote/core_remote_data_source.dart';
import 'package:novandi/core_module/domain/repositories/core_repository.dart';
import 'package:novandi/core_module/others/injection.dart';


class CoreRepositoryImpl implements CoreRepository {
  CoreRepositoryImpl(this.remoteDataSource);

  final LocalDataSource localDataSource = locator<LocalDataSource>();
  final CoreRemoteDataSource remoteDataSource;

  @override
  Future<Either<String, Map<String, dynamic>>> getApiRepository() async {
    try {
      final Map<String, dynamic> result =
          await remoteDataSource.getApiRemoteDataSource();
      return Right(result);
    } on DioException catch (dioError) {
      return Left(dioError.message ?? 'Error Network Exception');
    } catch (error) {
      return Left(error.toString());
    }
  }
}
