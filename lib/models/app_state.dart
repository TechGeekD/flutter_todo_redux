import 'package:json_annotation/json_annotation.dart';

import 'package:flutter_todo_redux/models/index.dart';

part 'app_state.g.dart';

@JsonSerializable()
class AppState {
  @JsonKey(ignore: true)
  int count;
  @JsonKey(ignore: true)
  bool isLoading;
  List<Todo> todos;
  List<User> userList;

  AppState({
    this.count = 0,
    this.isLoading = false,
    this.todos = const <Todo>[],
    this.userList = const <User>[],
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

  static AppState fromJson(dynamic json) =>
      json != null ? _$AppStateFromJson(json) : null;

  dynamic toJson() => _$AppStateToJson(this);

  @override
  String toString() {
    return 'AppState {isLoading: $isLoading, count: $count, todo: $todos, userList: $userList}';
  }
}
