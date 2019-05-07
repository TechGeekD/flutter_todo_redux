import 'package:flutter_todo_redux/models/todo.dart';
import 'package:flutter_todo_redux/services/api.dart';
import 'package:flutter_todo_redux/services/storage.dart';

class TodosRepository {
  TodosRepository();

  final dynamic request = API().request;
  final Storage storage = Storage();

  Future loadTodos() async {
    List<Todo> todoList;

    final response = await request(method: 'GET', path: '/todos');
    todoList = TodoList.fromJson(response).todos;

    await storage.write(key: 'todoList', value: todoList);
    return todoList;
  }
}
