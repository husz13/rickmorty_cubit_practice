import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:rickmorty_cubit_practice/constants/strings.dart';

class CharactersApi {
  late Dio dio;
  CharactersApi() {
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(seconds: 20),
      receiveTimeout: const Duration(seconds: 60),
    );
    dio = Dio(options);
  }
  Future<Map<String, dynamic>> getAllCharacters() async {
    try {
      Response response = await dio.get("character");
      debugPrint(response.data.toString());
      return response.data;
    } catch (e) {
      print(e.toString());
      return {};
    }
  }
}
