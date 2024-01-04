import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:novandi/core_module/data/local/local_data_source_impl.dart';
import 'package:novandi/core_module/others/injection.dart';
import 'package:novandi/home_module/data/model/photos_response_model.dart';
import 'package:novandi/home_module/data/remote/home_remote_data_source.dart';
import 'package:novandi/home_module/domain/repositories/home_repository.dart';


class HomeRepositoryImpl implements HomeRepository {
  HomeRepositoryImpl(this.remoteDataSource);

  final LocalDataSource localDataSource = locator<LocalDataSource>();
  final HomeRemoteDataSource remoteDataSource;


  @override
  Future<Either<String,List<PhotosResponseData>>> downloadListDataHomeRepository() async {
    try {
      final List<PhotosResponseData> result =
          await remoteDataSource.downloadListDataHomeRemoteDataSource();
      return Right(result);
    } on DioException catch (dioError) {
      return Left(dioError.message ?? 'Error Network Exception');
    } catch (error) {
      return Left(error.toString());
    }
  }
}
