import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:flutter_todo_redux/redux/auth/auth_state.dart';
import 'package:flutter_todo_redux/redux/home/home_state.dart';

part 'app_state.g.dart';

@immutable
@JsonSerializable()
class AppState extends Equatable {
  final HomeState homeState;
  final AuthState authState;

  AppState({@required this.homeState, @required this.authState});

  factory AppState.initial() {
    return AppState(
        authState: AuthState.initial(), homeState: HomeState.initial());
  }

  AppState copyWith({HomeState homeState, AuthState authState}) {
    return AppState(
        homeState: homeState ?? this.homeState,
        authState: authState ?? this.authState);
  }

  static AppState fromJson(dynamic json) =>
      json != null ? _$AppStateFromJson(json) : null;

  dynamic toJson() => _$AppStateToJson(this);

  @override
  String toString() {
    return 'AppState {homeState: $homeState, authState: $authState}';
  }
}
