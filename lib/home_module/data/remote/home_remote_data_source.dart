import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:novandi/core_module/networks/dio_network.dart';
import 'package:novandi/home_module/data/model/photos_response_model.dart';

abstract class HomeRemoteDataSource {
  Future<List<PhotosResponseData>>downloadListDataHomeRemoteDataSource() ;
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {

  @override
  Future<List<PhotosResponseData>> downloadListDataHomeRemoteDataSource() async {
    try {
      Response response = await DioNetwork.instance.get(
        'https://jsonplaceholder.typicode.com/photos',
      );

      return photosResponseDataFromJson(jsonEncode(response.data));
    } on DioException {
      rethrow;
    } catch (error) {
      throw error.toString();
    }
  }
}
