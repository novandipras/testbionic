import 'package:dartz/dartz.dart';

abstract class CoreRepository {

  Future<Either<String, Map<String, dynamic>>> getApiRepository();

}
