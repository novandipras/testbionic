import 'package:dartz/dartz.dart';
import 'package:novandi/home_module/data/model/photos_response_model.dart';
import 'package:novandi/home_module/domain/repositories/home_repository.dart';

class HomeUsecase {
  HomeUsecase(this.repository);

  final HomeRepository repository;

  Future<Either<String, List<PhotosResponseData>>> downloadListDataHome() {
    return repository.downloadListDataHomeRepository();
  }
}
