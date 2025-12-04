import 'package:dio/dio.dart';

class ApiKeyInterceptor extends Interceptor {
  final String apiKey;
  final String apiHost;

  // Constructor now accepts both key and host
  ApiKeyInterceptor(this.apiKey, this.apiHost);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // FIX 1 (CRITICAL): Set the API key as the required HTTP Header.
    options.headers['X-RapidAPI-Key'] = apiKey;

    // FIX 2 (CRITICAL): Set the API host as the required HTTP Header.
    options.headers['X-RapidAPI-Host'] = apiHost;

    // Note: We deliberately removed the incorrect 'api_key' query parameter.

    super.onRequest(options, handler);
  }
}
