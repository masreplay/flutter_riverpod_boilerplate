import 'package:flutter_application_example/app/features/main/data/entity/message_entity.dart';
import 'package:flutter_application_example/app/features/main/data/entity/todo_entity.dart';
import 'package:flutter_application_example/app/features/main/data/repository/todo_repository.dart';
import 'package:flutter_application_example/data/api/todo/todo_update.dart';

class FakeTodoRepository implements TodoRepository {
  final _todos = [
    const TodoEntity(id: 1, title: 'Todo 1', completed: false),
    const TodoEntity(id: 2, title: 'Todo 2', completed: true),
    const TodoEntity(id: 3, title: 'Todo 3', completed: false),
  ];

  @override
  Future<List<TodoEntity>> get() async {
    return Future.delayed(const Duration(seconds: 1), () => _todos);
  }

  @override
  Future<TodoEntity> getDetail(int id) {
    return Future.delayed(
      const Duration(seconds: 1),
      () => _todos.firstWhere((element) => element.id == id),
    );
  }

  @override
  Future<MessageEntity> delete(int id) async {
    _todos.removeWhere((element) => element.id == id);
    return const MessageEntity(message: 'Deleted');
  }

  @override
  Future<bool> toggle(int id) {
    final index = _todos.indexWhere((element) => element.id == id);
    if (index == -1) {
      return Future.value(false);
    }
    _todos[index] = _todos[index].copyWith(completed: !_todos[index].completed);
    return Future.delayed(const Duration(seconds: 1), () => true);
  }

  @override
  Future<TodoEntity> update(
    int id,
    TodoUpdate todo,
  ) {
    final index = _todos.indexWhere((element) => element.id == id);
    if (index == -1) {
      throw Exception('Not found');
    }
    _todos[index] =
        _todos[index].copyWith(title: todo.title, completed: todo.completed);
    return Future.delayed(const Duration(seconds: 1), () => _todos[index]);
  }
}
