import 'package:dio/dio.dart';
import 'package:royal_task/core/network/endpoints.dart';

class ApiClient {
  final Dio dio;

  ApiClient({required this.dio, String? token}) {
    dio.options = BaseOptions(baseUrl: Endpoints.baseApiUrl);
  }
  Future<Response> get(String path) async {
    try {
      final response = await dio.get(path);
      return response;
    } catch (error) {
      throw Exception('Failed to GET data: $error');
    }
  }
}
