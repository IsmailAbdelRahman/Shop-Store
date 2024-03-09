import 'package:dio/dio.dart';
import 'package:flutter/material.dart';


//api   application programming interface

class DioHelper{

  static Dio? dio  ;

 static Init(){

   dio= Dio( BaseOptions(baseUrl:   'https://student.valuxapps.com/api/' , receiveDataWhenStatusError:  true ,/*receiveTimeout: 500 ,*/
  // headers: {  'Content-Type' : 'application/json'}
       ));

 }

 static Future<Response> get ( { required String  url ,  Map<String,dynamic>  ? queryParameter, String lang ='ar' , String ? token  })  async{
   dio!.options.headers={
     'lang':lang, 'Authorization':token ?? '' ,   'Content-Type' : 'application/json'
   };

  return await dio!.get(url,queryParameters:queryParameter );
  }




  static Future<Response> PostData ( { required String  url ,  Map<String,dynamic>  ? queryParameter   , required Map Data   , String lang ='ar' , String ? token })  async{
                  dio!.options.headers={
                    'lang':lang, 'Authorization':token ?? ' ' ,  'Content-Type' : 'application/json'
                  };
    return await dio!.post( url  , queryParameters:  queryParameter , data:Data  );
  }


  static Future<Response> PutData ( { required String  url ,  Map<String,dynamic>  ? queryParameter   , required Map Data   , String lang ='ar' , String ? token })  async{
    dio!.options.headers={
      'lang':lang, 'Authorization':token ?? ' ' ,  'Content-Type' : 'application/json'
    };
    return await dio!.put( url  , queryParameters:  queryParameter , data:Data  );
  }

///post == put


}

class dioWeather {

  static  Dio?   dioWeatherC ;

  static FunInitaltionDio (){

    dioWeatherC =Dio(BaseOptions(baseUrl:  "http://api.weatherapi.com/v1/"       , receiveDataWhenStatusError: true ));
  }



 static Future <Response> getWeather ( {String ? Url , Map<String,dynamic>  ? queryParameter  }) async{

   return await dioWeatherC!.get("${Url}.json",  queryParameters: queryParameter );


  }


/*void getWeather1 ()  {

       dioWeatherC!.get("", ).then((value) => {


    });


  }*/


}



