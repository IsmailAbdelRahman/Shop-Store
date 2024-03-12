import 'package:appstore/core/utils/networking/api_constants.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

//api   application programming interface

class DioHelper {
  DioHelper._(); // privade  no  onstractor
  static Dio? dio;
////////////////////////////////////////////? init ///////////
  static init() {
    if (dio == null) {
      dio = Dio(BaseOptions(
          baseUrl: ApiConstants.baseUrl,
          receiveDataWhenStatusError: true,
          receiveTimeout: const Duration(seconds: 30),
          connectTimeout: const Duration(seconds: 30)));
      addDioInterceptor();
    } else {
      return dio;
    }
  }

  static void addDioInterceptor() {
    dio?.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      compact: false,
    ));
  }

////////////////////////////////////////////// ? get /////////////
  static Future<Response> get(
      {required String url,
      Map<String, dynamic>? queryParameter,
      String? lang,
      String? token}) async {
    dio!.options.headers = {
      'lang': lang ?? ApiConstants.language,
      'Authorization': token ?? '',
      'Content-Type': 'application/json'
    };

    return await dio!.get(url, queryParameters: queryParameter);
  }

//////////////////////////////////////////////? pot /////////
  static Future<Response> postData(
      {required String url,
      Map<String, dynamic>? queryParameter,
      required Map data,
      String? lang,
      String? token}) async {
    dio!.options.headers = {
      'lang': lang ?? ApiConstants.language,
      'Authorization': token ?? ' ',
      'Content-Type': 'application/json'
    };
    return await dio!.post(url, queryParameters: queryParameter, data: data);
  }

//////////////////////////////////////////////////? put //////////
  static Future<Response> putData(
      {required String url,
      Map<String, dynamic>? queryParameter,
      required Map data,
      String? lang,
      String? token}) async {
    dio!.options.headers = {
      'lang': lang ?? ApiConstants.language,
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
