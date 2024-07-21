import 'package:flutter_application_example/app/features/main/data/entity/message_entity.dart';
import 'package:flutter_application_example/app/features/main/data/entity/todo_entity.dart';
import 'package:flutter_application_example/app/features/main/data/repository/todo_repository.dart';

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
  Future<TodoEntity> getDetails(int id) {
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
}
