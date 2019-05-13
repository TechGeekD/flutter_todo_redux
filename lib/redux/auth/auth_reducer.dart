import 'package:redux/redux.dart';
import 'package:flutter_todo_redux/redux/actions.dart'
    show AuthenticationUserListAction;
import 'package:flutter_todo_redux/redux/auth/auth_state.dart';

final authReducer = combineReducers<AuthState>([
  TypedReducer<AuthState, AuthenticationUserListAction>(_setUserList),
]);

AuthState _setUserList(
  AuthState state,
  AuthenticationUserListAction action,
) {
  return state.copyWith(userList: action.userList);
}
