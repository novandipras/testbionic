import 'package:dio/dio.dart';
import 'package:novandi/core_module/networks/dio_network.dart';

abstract class CoreRemoteDataSource {
  Future<Map<String, dynamic>> getApiRemoteDataSource();
}

class CoreRemoteDataSourceImpl implements CoreRemoteDataSource {
  @override
  Future<Map<String, dynamic>> getApiRemoteDataSource() async {
    try {
      Response response =
          await DioNetwork.instance.get('https://api64.ipify.org?format=json');
      return response.data;
    } on DioException {
      rethrow;
    } catch (error) {
      throw error.toString();
    }
  }
}
