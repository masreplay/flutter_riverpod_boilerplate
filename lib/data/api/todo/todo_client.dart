import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import 'todo_response.dart';

part 'todo_client.g.dart';

@RestApi()
abstract class TodoClient {
  factory TodoClient(Dio dio, {String baseUrl}) = _TodoClient;

  @GET('/todos')
  Future<List<TodoResponse>> getTodos();
}
