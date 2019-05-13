import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:flutter_todo_redux/models/todo.dart';
import 'package:flutter_todo_redux/models/loading_status.dart';

part 'home_state.g.dart';

@immutable
@JsonSerializable()
class HomeState extends Equatable {
  HomeState(
      {@required this.loadingStatus,
      @required this.count,
      @required this.todoList});

  @JsonKey(ignore: true)
  final LoadingStatus loadingStatus;
  @JsonKey(ignore: true)
  final int count;
  final List<Todo> todoList;

  factory HomeState.initial() {
    return HomeState(
        loadingStatus: LoadingStatus.success, count: 0, todoList: []);
  }

  HomeState copyWith(
      {LoadingStatus loadingStatus, int count, List<Todo> todoList}) {
    return HomeState(
        loadingStatus: loadingStatus ?? this.loadingStatus,
        count: count ?? this.count,
        todoList: todoList ?? this.todoList);
  }

  static HomeState fromJson(dynamic json) =>
      json != null ? _$HomeStateFromJson(json) : null;

  dynamic toJson() => _$HomeStateToJson(this);
}
