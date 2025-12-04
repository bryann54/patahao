import 'package:patahao/core/api_client/client/api_key_interceptor.dart';
import 'package:patahao/core/api_client/client/loggin_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class DioClient {
  final Options open = Options(headers: {'Content-Type': 'application/json'});
  final Dio dio;
  final String _apiKey;
  final String
      _apiHost; // CRITICAL: Injecting the API Host is required by RapidAPI

  DioClient(
    this.dio,
    @Named('ApiKey') this._apiKey,
    @Named('ApiHost')
    this._apiHost, // Assuming API_HOST is injected via @Named('ApiHost')
  ) {
    // 1. Configure Dio options
    // Setting the Base URL and timeouts on the injected Dio instance.
    dio.options = dio.options.copyWith(
      baseUrl:
          'https://realtor.p.rapidapi.com', // Setting the required base URL
      connectTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 15),
      // We no longer need to set X-RapidAPI-Host here as the interceptor handles it.
      headers: {
        ...dio.options.headers,
        // Removed 'X-RapidAPI-Host': _apiHost to centralize header logic in the Interceptor
      },
    );

    // 2. Add Interceptors
    // LogInterceptor needs to be added before the ApiKeyInterceptor for proper request logging
    if (kDebugMode) {
      // Assuming DioLogInterceptors is a custom class wrapping LogInterceptor or similar
      dio.interceptors.add(DioLogInterceptors(printBody: kDebugMode));
    }

    // PASS BOTH KEY AND HOST: This ensures the interceptor can correctly set both RapidAPI headers.
    dio.interceptors.add(ApiKeyInterceptor(_apiKey, _apiHost));
  }

  // Removed getInstance() as it's redundant in an injectable @lazySingleton
}
