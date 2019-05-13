// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppState _$AppStateFromJson(Map<String, dynamic> json) {
  return AppState(
      homeState: json['homeState'] == null
          ? null
          : HomeState.fromJson(json['homeState'] as Map<String, dynamic>),
      authState: json['authState'] == null
          ? null
          : AuthState.fromJson(json['authState'] as Map<String, dynamic>));
}

Map<String, dynamic> _$AppStateToJson(AppState instance) => <String, dynamic>{
      'homeState': instance.homeState,
      'authState': instance.authState
    };
