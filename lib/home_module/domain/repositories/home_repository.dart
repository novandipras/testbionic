import 'package:dartz/dartz.dart';
import 'package:novandi/home_module/data/model/photos_response_model.dart';

abstract class HomeRepository {
  Future<Either<String, List<PhotosResponseData>>> downloadListDataHomeRepository();
}
