import 'dart:convert';

import 'package:dio/dio.dart';

class ApiRequest {
  static const String _rootPath = "https://fastreport.cloud";

  static Future<Map<String, dynamic>> postApiHelper(
      Dio dio, dynamic data, String path) async {
    Map<String, dynamic> header = Map();
    Map body = Map();
    Map<String, dynamic> error = Map();
    const token =
        'YXBpa2V5OnR4ZnNxNG10cWl0N2M5c3pkeDdkZng0OG5rb3o4anNyMzdxdDYxb2djbTR3eXVqM2tja28=';
    error['message'] = "Неизвестная ошибка";
    header['Authorization'] = 'Basic $token';
    header['Content-Type'] = 'application/json';
    header['Accept'] = 'application/json';
    body = data;

    Response<dynamic>? response;
    try {
      response = await dio.post("$_rootPath$path",
          data: body, options: Options(headers: header));
    } catch (e) {
      return error;
    }
    if (response != null) {
      if (response.statusCode == 404) {
        ///Бронь не найдена
        error['message'] = "Бронь не найдена";
        return error;
      } else if (response.statusCode == 401) {
        ///Не авторизован
        error['message'] = "Не авторизован";
        return error;
      } else if (response.statusCode == 200) {
        ///Ок
        dynamic resultD = response.data;
        // Map<String, dynamic> resultM = resultD as Map<String, dynamic>;
        Map<String, dynamic> resultM = Map<String, dynamic>();
        return resultD;
      } else if (response.statusCode == 422) {
        ///Заезд невозможен
        error['message'] = "Заезд невозможен";
        return error;
      } else {
        return error;
      }
    } else {
      return error;
    }
  }

  static Future<Map<String, dynamic>> getApiHelper(
      Dio dio, Map<String, dynamic> data, String path) async {
    Map<String, dynamic> header = Map();
    Map<String, dynamic> error = Map();
    // YXBpa2V5OmZ5NDRta3M5aXR0OHI4aXF0ZDU0bzQxcWI0cWlqaDE4cm83YmJzNmk5eG91aHB4OXRmOHk=
    const token =
        'YXBpa2V5OnR4ZnNxNG10cWl0N2M5c3pkeDdkZng0OG5rb3o4anNyMzdxdDYxb2djbTR3eXVqM2tja28=';

    error['message'] = "Неизвестная ошибка";
    header['Authorization'] = 'Basic $token';
    header['Content-Type'] = 'application/json';
    header['Accept'] = 'application/json';

    Response<dynamic>? response;
    try {
      response = await dio.get("$_rootPath$path",
          options: Options(headers: header), queryParameters: data);
    } catch (e) {
      return error;
    }
    if (response != null) {
      if (response.statusCode == 404) {
        ///Бронь не найдена
        error['message'] = "Бронь не найдена";
        return error;
      } else if (response.statusCode == 401) {
        ///Не авторизован
        error['message'] = "Не авторизован";
        return error;
      } else if (response.statusCode == 200) {
        dynamic resultD = response.data;

        return resultD;
      } else if (response.statusCode == 422) {
        error['message'] = "Заезд невозможен";
        return error;
      } else {
        return error;
      }
    } else {
      return error;
    }
  }

  static Future<Map<String, dynamic>> putApiHelper(
      {Dio? dio, required Map<String, dynamic> data, String? path}) async {
    Map<String, dynamic> header = Map();
    Map<String, dynamic> error = Map();

    const token =
        'YXBpa2V5OnR4ZnNxNG10cWl0N2M5c3pkeDdkZng0OG5rb3o4anNyMzdxdDYxb2djbTR3eXVqM2tja28=';

    error['message'] = "Неизвестная ошибка";
    header['Authorization'] = 'Basic $token';
    header['Content-Type'] = 'application/json';
    header['Accept'] = 'application/json';
    Response<dynamic>? response;
    try {
      print(data);
      print(path);
      print(data);
      response = await dio?.put(
        "$_rootPath$path",
        data: data,
        options: Options(headers: header),
      );
    } catch (e) {
      return error;
    }
    if (response != null) {
      if (response.statusCode == 404) {
        ///Бронь не найдена
        error['message'] = "Бронь не найдена";
        return error;
      } else if (response.statusCode == 401) {
        ///Не авторизован
        error['message'] = "Не авторизован";
        return error;
      } else if (response.statusCode == 200) {
        dynamic resultD = response.data;
        return resultD;
      } else if (response.statusCode == 422) {
        ///Заезд невозможен
        error['message'] = "Заезд невозможен";
        return error;
      } else {
        return error;
      }
    } else {
      return error;
    }
  }

  static Future<Map<String, dynamic>> deleteApiHelper(
      {Dio? dio, String? path}) async {
    Map<String, dynamic> header = Map();
    Map<String, dynamic> error = Map();
    const token =
        'YXBpa2V5OnR4ZnNxNG10cWl0N2M5c3pkeDdkZng0OG5rb3o4anNyMzdxdDYxb2djbTR3eXVqM2tja28=';

    error['message'] = "Неизвестная ошибка";
    header['Authorization'] = 'Basic $token';
    header['Content-Type'] = 'application/json';
    header['Accept'] = 'application/json';

    Response<dynamic>? response;
    try {
      response = await dio?.delete("$_rootPath$path",
          options: Options(headers: header));
    } catch (e) {
      return error;
    }
    if (response != null) {
      if (response.statusCode == 404) {
        ///Бронь не найдена
        error['message'] = "Бронь не найдена";
        return error;
      } else if (response.statusCode == 401) {
        ///Не авторизован
        error['message'] = "Не авторизован";
        return error;
      } else if (response.statusCode == 200) {
        print(response);

        ///Ок
        dynamic resultD = response.data;
        // Map<String, dynamic> resultM = resultD as Map<String, dynamic>;
        // Map<String, dynamic> resultM = Map<String, dynamic>();
        // resultM['data'] = resultD;
        return resultD;
      } else if (response.statusCode == 422) {
        ///Заезд невозможен
        error['message'] = "Заезд невозможен";
        return error;
      } else {
        return error;
      }
    } else {
      return error;
    }
  }
}
