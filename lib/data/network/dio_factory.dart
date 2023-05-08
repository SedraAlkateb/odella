import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:odella_master/app/app_preferences.dart';
import 'package:odella_master/app/constants.dart';
import 'package:odella_master/app/di.dart';
const String APPLICATION_JSON="application/json";

const String MULTIPART="multipart/form-data";
const String CONTENT_TYPE="contentType";
const String ACCEPT="accept";
const String AUTHORIZATION="authorization";
const String DEFAULT_LANGUAGE="lang";

class DioFactory{
  final AppPreferences _appPreferences;
  DioFactory(this._appPreferences);

  Future<Dio> getDio() async {
    Dio dio= Dio();
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };
    String token ="Bearer " + await _appPreferences.getToken();
    String language =await _appPreferences.getAppLanguage();

    Map<String,String> headers={
      CONTENT_TYPE:MULTIPART,
      ACCEPT:APPLICATION_JSON,
      "X-Requested-With":"XMLHttpRequest",
      AUTHORIZATION:token,
      DEFAULT_LANGUAGE:language,
    "Access-Control-Allow-Headers": "*",
    "Access-Control-Allow-Methods": "POST, GET, OPTIONS, PUT, DELETE, HEAD",

  };
    dio.options=BaseOptions(
        baseUrl: Constants.baseUrl,
        headers: headers,
        receiveTimeout: Constants.apiTimeOut,
        sendTimeout: Constants.apiTimeOut
    );
    dio.interceptors.add( MyApiInterceptor());
    if(!kReleaseMode){
      //its debuge  mode so print app logs
      dio.interceptors.add(PrettyDioLogger(
        requestHeader : true,
        requestBody : true,
        responseHeader : true,
      ));

    }
    return dio;
  }
}

class MyApiInterceptor extends Interceptor {
  final AppPreferences _appPreferences =instance<AppPreferences>();
  @override
  Future<void> onRequest(
      RequestOptions options,
      RequestInterceptorHandler handler,
      ) async {
    // Add the token to the request headers

    String authToken =await _appPreferences.getToken();
    if (authToken != null) {
      options.headers['Authorization'] ="Bearer ${authToken}" ;
      print(authToken);
    }
    return handler.next(options);
  }
}