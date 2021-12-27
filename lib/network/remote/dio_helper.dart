import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

//path:https://newsapi.org
//methode : v2/top-headlines?
// query: country=us&category=business&apiKey=89423196335a4d09b93fef14b515f1f7
class DioHelper
{
  static Dio dio;

  static init()
  {
    dio = Dio(
        BaseOptions(
            baseUrl: 'https://student.valuxapps.com/api/',
            receiveDataWhenStatusError: true
        )
    );
  }



  static Future<Response> getData ({
    @required String url,
     Map<String,dynamic> query,
     String token,
  })async
  {
    dio.options.headers = {
      'lang': "en",
      'Content-Type': 'application/json',
      'Authorization': token ?? '',
    };

    return await dio.get(
        url,
        queryParameters: query
    );
  }


  static Future<Response> postData ({
    @required String url,
    @required Map<String,dynamic> data,
    String token,

  })async
  {
    dio.options.headers = {
      'lang': "en",
      'Content-Type': 'application/json',
      'Authorization': token ?? '',
    };
    return await dio.post(
        url,
        data: data,
    );
  }





  static Future<Response> putData ({
    @required String url,
    @required Map<String,dynamic> data,
    String token,

  })async
  {
    dio.options.headers = {
      'lang': "en",
      'Content-Type': 'application/json',
      'Authorization': token ?? '',
    };
    return await dio.put(
      url,
      data: data,
    );
  }
}