import 'package:flutter_application_example/data/api/todo/todo_response.dart';
import 'package:flutter_application_example/data/supabase/db_constants.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'todo_supabase_client.g.dart';

@riverpod
TodoSupabaseClient todoSupabaseClient(TodoSupabaseClientRef ref) {
  return TodoSupabaseClient(Supabase.instance.client);
}

class TodoSupabaseClient {
  const TodoSupabaseClient(this.client);

  final SupabaseClient client;

  Future<List<TodoResponse>> getTodos() async {
    final response = await client
        .from(DBConstants.tableTodos)
        .select()
        .order(DBConstants.fieldCreatedAt);
    return response.map(TodoResponse.fromJson).toList();
  }

  Future<TodoResponse> getTodo(int id) async {
    final response = await client
        .from(DBConstants.tableTodos)
        .select()
        .eq(DBConstants.fieldId, id)
        .single();
    return TodoResponse.fromJson(response);
  }
}
