import 'package:flutter_todo_redux/models/index.dart';

class AppState {
  final int count;
  final bool isLoading;
  final List<Todo> todos;
  final List<User> userList;

  AppState({
    this.count = 0,
    this.isLoading = false,
    this.todos = const [],
    this.userList = const [],
  });

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
