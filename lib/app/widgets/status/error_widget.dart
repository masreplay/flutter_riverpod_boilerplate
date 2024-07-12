import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_example/data/api/common/message_response.dart';

class AppErrorWidget extends StatelessWidget {
  const AppErrorWidget({super.key, this.error});

  final Object? error;

  @override
  Widget build(BuildContext context) {
    final error = this.error;

    if (error == null) {
      return const Center(
        child: Text('An error occurred'),
      );
    } else if (error is DioException) {
      // network error
      if (error.type == DioExceptionType.connectionError ||
          error.type == DioExceptionType.sendTimeout ||
          error.type == DioExceptionType.receiveTimeout) {
        return const Center(
          child: Text('Connection error'),
        );
      } else if (error.response?.statusCode == 500) {
        return const Center(
          child: Text('حدث خطأ في الخادم'),
        );
      } else if (error.response?.statusCode == 400) {
        final message = MessageResponse.fromJson(error.response!.data);
        return Center(
          child: Text(message.message),
        );
      } else {
        return const Center(
          child: Text('حدث خطا ما يرجى المحاولة مرة اخرى'),
        );
      }
    } else {
      return Center(
        child: Text(error.toString()),
      );
    }
  }
}
