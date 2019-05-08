import 'package:flutter_todo_redux/models/user.dart';

class AuthenticateAction {
  AuthenticateAction({this.username, this.password});

  final String username, password;

  @override
  String toString() {
    return "AuthenticateAction {username: $username, password: $password}";
  }
}

class UnAuthenticateAction {}

class HasAuthenticatedAction {}

class AuthenticateSuccessAction {}

class AuthenticateFailedAction {}

class LoadAuthenticationUserListAction {}

class AuthenticationUserListAction {
  AuthenticationUserListAction({this.userList});

  final List<User> userList;

  @override
  String toString() {
    return "AuthenticationUserListAction {userList: $userList}";
  }
}
