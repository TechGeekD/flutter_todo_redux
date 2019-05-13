import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:flutter_todo_redux/models/user.dart';
import 'package:flutter_todo_redux/models/loading_status.dart';

part 'auth_state.g.dart';

@immutable
@JsonSerializable()
class AuthState extends Equatable {
  AuthState(
      {@required this.loadingStatus,
      @required this.password,
      @required this.passwordError,
      @required this.retypePassword,
      @required this.retypePasswordError,
      @required this.email,
      @required this.emailError,
      @required this.token,
      @required this.code,
      @required this.codeError,
      @required this.userList});

  @JsonKey(ignore: true)
  final LoadingStatus loadingStatus;
  final String password;
  final String passwordError;
  final String retypePassword;
  final String retypePasswordError;
  final String email;
  final String emailError;
  final String token;
  final String code;
  final String codeError;
  final List<User> userList;

  factory AuthState.initial() {
    return AuthState(
        loadingStatus: LoadingStatus.success,
        password: "",
        passwordError: "",
        retypePassword: "",
        retypePasswordError: "",
        email: "",
        emailError: "",
        token: "",
        code: "",
        codeError: "",
        userList: []);
  }

  AuthState copyWith(
      {LoadingStatus loadingStatus,
      String password,
      String passwordError,
      String retypePassword,
      String retypePasswordError,
      String email,
      String emailError,
      String token,
      String code,
      String codeError,
      List<User> userList}) {
    return AuthState(
        loadingStatus: loadingStatus ?? this.loadingStatus,
        password: password ?? this.password,
        passwordError: passwordError ?? this.passwordError,
        retypePassword: retypePassword ?? this.retypePassword,
        retypePasswordError: retypePasswordError ?? this.retypePasswordError,
        email: email ?? this.email,
        emailError: emailError ?? this.emailError,
        token: token ?? this.token,
        code: code ?? this.code,
        codeError: codeError ?? this.codeError,
        userList: userList ?? this.userList);
  }

  static AuthState fromJson(dynamic json) =>
      json != null ? _$AuthStateFromJson(json) : null;

  dynamic toJson() => _$AuthStateToJson(this);
}
