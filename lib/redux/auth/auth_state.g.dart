// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthState _$AuthStateFromJson(Map<String, dynamic> json) {
  return AuthState(
      password: json['password'] as String,
      passwordError: json['passwordError'] as String,
      retypePassword: json['retypePassword'] as String,
      retypePasswordError: json['retypePasswordError'] as String,
      email: json['email'] as String,
      emailError: json['emailError'] as String,
      token: json['token'] as String,
      code: json['code'] as String,
      codeError: json['codeError'] as String,
      userList: (json['userList'] as List)
          ?.map((e) =>
              e == null ? null : User.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$AuthStateToJson(AuthState instance) => <String, dynamic>{
      'password': instance.password,
      'passwordError': instance.passwordError,
      'retypePassword': instance.retypePassword,
      'retypePasswordError': instance.retypePasswordError,
      'email': instance.email,
      'emailError': instance.emailError,
      'token': instance.token,
      'code': instance.code,
      'codeError': instance.codeError,
      'userList': instance.userList
    };
