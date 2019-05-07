import "package:json_annotation/json_annotation.dart";

part "todo.g.dart";

@JsonSerializable()
class TodoList {
  TodoList({this.todos});

  final List<Todo> todos;

  factory TodoList.fromJson(List<dynamic> json) =>
      _$TodoListFromJson({'todos': json});

  Map<String, dynamic> toJson() => _$TodoListToJson(this);
}

@JsonSerializable()
class Todo {
  Todo({
    this.id,
    this.userId,
    this.title,
    this.completed,
  });

  final int id, userId;
  final String title;
  final bool completed;

  factory Todo.fromJson(Map<String, dynamic> json) => _$TodoFromJson(json);

  Map<String, dynamic> toJson() => _$TodoToJson(this);

  Todo copyWith({bool complete, String id, String note, String task}) {
    return Todo(
      completed: complete ?? this.completed,
      id: id ?? this.id,
      userId: userId ?? this.userId,
      title: note ?? this.title,
    );
  }
}
