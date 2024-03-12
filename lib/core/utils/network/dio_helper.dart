import 'package:dio/dio.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

//api   application programming interface

class DioHelper {
  static Dio? dio;

  static init() {
    dio = Dio(BaseOptions(
      baseUrl: 'https://student.valuxapps.com/api/',
      receiveDataWhenStatusError: true, /*receiveTimeout: 500 ,*/
      // headers: {  'Content-Type' : 'application/json'}
    ))
      ..interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        compact: false,
      ));
  }

  static Future<Response> get(
      {required String url,
      Map<String, dynamic>? queryParameter,
      String lang = 'ar',
      String? token}) async {
    dio!.options.headers = {
      'lang': lang,
      'Authorization': token ?? '',
      'Content-Type': 'application/json'
    };

    return await dio!.get(url, queryParameters: queryParameter);
  }

  static Future<Response> postData(
      {required String url,
      Map<String, dynamic>? queryParameter,
      required Map data,
      String lang = 'ar',
      String? token}) async {
    dio!.options.headers = {
      'lang': lang,
      'Authorization': token ?? ' ',
      'Content-Type': 'application/json'
    };
    return await dio!.post(url, queryParameters: queryParameter, data: data);
  }

  static Future<Response> putData(
      {required String url,
      Map<String, dynamic>? queryParameter,
      required Map data,
      String lang = 'ar',
      String? token}) async {
    dio!.options.headers = {
      'lang': lang,
      'Authorization': token ?? ' ',
      'Content-Type': 'application/json'
    };
    return await dio!.put(url, queryParameters: queryParameter, data: data);
  }

  ///post == put
}




// class DioWeather {
//   static Dio? dioWeatherC;

//   static funInitaltionDio() {
//     dioWeatherC = Dio(BaseOptions(
//         baseUrl: "http://api.weatherapi.com/v1/",
//         receiveDataWhenStatusError: true));
//   }

//   static Future<Response> getWeather(
//       {String? url, Map<String, dynamic>? queryParameter}) async {
//     return await dioWeatherC!.get("$url.json", queryParameters: queryParameter);
//   }


  
// }
