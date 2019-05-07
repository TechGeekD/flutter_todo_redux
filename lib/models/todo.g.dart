// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TodoList _$TodoListFromJson(Map<String, dynamic> json) {
  return TodoList(
      todos: (json['todos'] as List)
          ?.map((e) =>
              e == null ? null : Todo.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$TodoListToJson(TodoList instance) =>
    <String, dynamic>{'todos': instance.todos};

Todo _$TodoFromJson(Map<String, dynamic> json) {
  return Todo(
      id: json['id'] as int,
      userId: json['userId'] as int,
      title: json['title'] as String,
      completed: json['completed'] as bool);
}

Map<String, dynamic> _$TodoToJson(Todo instance) => <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'title': instance.title,
      'completed': instance.completed
    };
