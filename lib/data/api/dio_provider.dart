import 'package:dio/dio.dart';
import 'package:awesome_dio_interceptor/awesome_dio_interceptor.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'dio_provider.g.dart';

@riverpod
Dio dio(DioRef ref) {
  final dio = Dio();

  dio.options.baseUrl = 'https://jsonplaceholder.typicode.com';

  dio.interceptors.addAll([
    AwesomeDioInterceptor(),
  ]);

  return dio;
}
