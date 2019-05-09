import 'package:flutter_todo_redux/models/index.dart';
import 'package:flutter_todo_redux/services/storage.dart';

class AppState {
  int count;
  bool isLoading;
  List<Todo> todos;
  List<User> userList;

  AppState({
    this.count = 0,
    this.isLoading = false,
    this.todos = const <Todo>[],
    this.userList = const <User>[],
  }) {
    this.reHydrate();
  }

  reHydrate() async {
    List users = await Storage().read('userList') ?? [];
    List todoList = await Storage().read('todoList') ?? [];

    userList = users.length > 0 ? UserList.fromJson(users).users : <User>[];
    todos = todoList.length > 0 ? TodoList.fromJson(todoList).todos : <Todo>[];
  }

  AppState copyWith({
    int count,
    bool isLoading,
    List<Todo> todos,
    List<User> userList,
  }) {
    return AppState(
      count: count ?? this.count,
      isLoading: isLoading ?? this.isLoading,
      todos: todos ?? this.todos,
      userList: userList ?? this.userList,
    );
  }

  @override
  String toString() {
    return 'AppState {isLoading: $isLoading, count: $count, todo: $todos, userList: $userList}';
  }
}
