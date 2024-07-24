import 'package:flutter_application_example/data/api/todo/todo_response.dart';
import 'package:flutter_application_example/data/supabase/todo_supabase_client.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'todo_remote_data_source.g.dart';

@riverpod
TodoRds todoRds(TodoRdsRef ref) {
  final todoSupabaseClient = ref.read(todoSupabaseClientProvider);
  return TodoSupabaseRds(todoSupabaseClient);
}

/// Abstract class representing a remote data source for todos.
abstract class TodoRds {
  /// Retrieves a list of todos.
  Future<List<TodoResponse>> getTodos();

  /// Retrieves a todo by its ID.
  Future<TodoResponse> getTodo(
    int id,
  );
}

/// Implementation of the [TodoRds] interface using an API client.
class TodoSupabaseRds implements TodoRds {
  final TodoSupabaseClient _supabaseClient;

  const TodoSupabaseRds(this._supabaseClient);

  @override
  Future<List<TodoResponse>> getTodos() {
    return _supabaseClient.getTodos();
  }

  @override
  Future<TodoResponse> getTodo(int id) {
    return _supabaseClient.getTodo(id);
  }
}
