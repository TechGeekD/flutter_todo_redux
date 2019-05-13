// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeState _$HomeStateFromJson(Map<String, dynamic> json) {
  return HomeState(
      todoList: (json['todoList'] as List)
          ?.map((e) =>
              e == null ? null : Todo.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$HomeStateToJson(HomeState instance) =>
    <String, dynamic>{'todoList': instance.todoList};
