import 'package:dartz/dartz.dart';
import 'package:novandi/core_module/domain/repositories/core_repository.dart';

class CoreUsecase {
  CoreUsecase(this.repository);

  final CoreRepository repository;

  Future<Either<String, Map<String, dynamic>>> getApiUsecase() {
    return repository.getApiRepository();
  }
}
