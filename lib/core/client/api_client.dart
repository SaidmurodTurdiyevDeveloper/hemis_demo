import 'package:dio/dio.dart';

import '../errors/failure.dart';
import 'api_client_model.dart';

abstract class ClientApi {
  Future<ApiClientModel> post({required String path, required Map<String, dynamic> body});

  Future<ApiClientModel> postWithToken({required String path, required String token, required Map<String, dynamic> body});
  Future<ApiClientModel> get({required String path});

  Future<ApiClientModel> getWithToken({required String path, required String token, Map<String, dynamic>? query});
}

class ApiClient extends ClientApi {
  final Dio _dio = Dio(BaseOptions());

  @override
  Future<ApiClientModel> post({required String path, required Map<String, dynamic> body}) async {
    try {
      final request = await _dio.post(path, data: body);
      final int statusCode = request.statusCode ?? 500;
      if (statusCode >= 200 && statusCode < 300) {
        return ApiClientModel(result: request.data, success: true, code: statusCode, error: null);
      }
      return ApiClientModel(result: request.data, success: false, code: statusCode, error: FailureType.network);
    } on DioException catch (e) {
      return ApiClientModel(result: e.message, success: false, code: e.response?.statusCode, error: FailureType.server);
    }
  }

  @override
  Future<ApiClientModel> postWithToken({required String path, required String token, required Map<String, dynamic> body}) async {
    try {
      final headers = {'Authorization': "Bearer $token", 'accept': '*/*'};
      final request = await _dio.post(path, data: body, options: Options(headers: headers));
      final int statusCode = request.statusCode ?? 500;
      if (statusCode >= 200 && statusCode < 300) {
        return ApiClientModel(result: request.data, success: true, code: statusCode, error: null);
      }
      return ApiClientModel(result: request.data, success: false, code: statusCode, error: FailureType.network);
    } on DioException catch (e) {
      return ApiClientModel(result: e.message, success: false, code: e.response?.statusCode, error: FailureType.server);
    }
  }

  @override
  Future<ApiClientModel> get({required String path, Map<String, dynamic>? query}) async {
    try {

      final request = await _dio.get(path, queryParameters: query);

      final int statusCode = request.statusCode ?? 500;
      if (statusCode >= 200 && statusCode < 300) {
        return ApiClientModel(result: request.data, success: true, code: statusCode, error: null);
      }
      return ApiClientModel(result: request.data, success: false, code: statusCode, error: FailureType.network);
    } on DioException catch (e) {

      return ApiClientModel(result: e.message, success: false, code: e.response?.statusCode, error: FailureType.server);
    }
  }

  @override
  Future<ApiClientModel> getWithToken({required String path, required String token, Map<String, dynamic>? query}) async {
    try {
      final headers = {'Authorization': "Bearer $token", 'accept': '*/*'};

      final request = await _dio.get(path, queryParameters: query, options: Options(headers: headers));

      final int statusCode = request.statusCode ?? 500;
      if (statusCode >= 200 && statusCode < 300) {
        return ApiClientModel(result: request.data, success: true, code: statusCode, error: null);
      }
      return ApiClientModel(result: request.data, success: false, code: statusCode, error: FailureType.network);
    } on DioException catch (e) {
      return ApiClientModel(result: e.message, success: false, code: e.response?.statusCode, error: FailureType.server);
    }
  }
}
