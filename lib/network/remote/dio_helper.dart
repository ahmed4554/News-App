import 'package:dio/dio.dart';

class DioHelper {
  static late Dio dio;

  static dioGet() {
    dio = Dio(
      BaseOptions(
          baseUrl: 'https://student.valuxapps.com/api/',
          receiveDataWhenStatusError: true,
          headers: {
            'Content-Type': 'application/json',
          }),
    );
  }

  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
    String? token,
    String? lang,
  }) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      'lang':'en',
      'Authorization': token??''
    };
    return await dio.get(url, queryParameters: query);
  }

  static Future<Response> postData({
    required String url,
    required data,
    String? token,
    String? lang,
  }) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      'lang':'ar',
      'Authorization': token??''
    };
    return await dio.post(url, data: data);
  }
}
//https://newsapi.org/v2/everything?q=tesla&from=2022-02-25&sortBy=publishedAt&apiKey=8ca455dadafb4eb5b0d0c44c52514c24