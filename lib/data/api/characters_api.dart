import 'package:dio/dio.dart';

import '../../constants/strings.dart';

class CharactersApi {
  late Dio dio;
  CharactersApi() {
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(seconds: 60),
      receiveTimeout: const Duration(seconds: 60),
    );
    dio = Dio(options);
    dio.interceptors.addAll([
      LogInterceptor(
        request: true,
        responseBody: true,
        requestBody: true,
        requestHeader: true,
        error: true,
        responseHeader: true,
      )
    ]);
  }
  Future<Map<String, dynamic>> getAllCharacters() async {
    try {
      Response response = await dio.get("character/?page=5");

      return response.data;
    } catch (e) {
      return {};
    }
  }
}
