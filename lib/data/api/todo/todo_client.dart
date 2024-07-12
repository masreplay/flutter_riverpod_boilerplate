import 'package:dio/dio.dart';
import 'package:flutter_application_example/data/api/dio_provider.dart';
import 'package:retrofit/retrofit.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'todo_response.dart';

part 'todo_client.g.dart';

@riverpod
TodoClient todoClient(TodoClientRef ref) {
  return TodoClient(ref.read(dioProvider));
}

@RestApi()
abstract class TodoClient {
  factory TodoClient(Dio dio, {String baseUrl}) = _TodoClient;

  @GET('/todos')
  Future<List<TodoResponse>> getTodos();
}
