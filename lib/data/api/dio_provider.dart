import 'package:dio/dio.dart';
import 'package:awesome_dio_interceptor/awesome_dio_interceptor.dart';
import 'package:flutter_application_example/app/features/authentication/authentication_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'dio_provider.g.dart';

@riverpod
Dio dio(DioRef ref) {
  final dio = Dio();

  dio.options.baseUrl = 'https://jsonplaceholder.typicode.com';

  dio.interceptors.addAll([
    AwesomeDioInterceptor(),
  ]);

  final token = ref.read(authenticationProvider);

  // final language = ref.read(languageProvider);

  dio.options.headers = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    if (token != null) 'Authorization': 'Bearer $token',
    // if (language != null) 'Accept-Language': language ?? 'en',
  };

  return dio;
}
