import 'package:redux/redux.dart';
import 'package:flutter_todo_redux/redux/actions.dart'
    show AuthenticationUserListAction, AuthenticationLoadingStatusAction;
import 'package:flutter_todo_redux/redux/auth/auth_state.dart';

final authReducer = combineReducers<AuthState>([
  TypedReducer<AuthState, AuthenticationUserListAction>(_setUserList),
  TypedReducer<AuthState, AuthenticationLoadingStatusAction>(
      _setAuthenticationLoadingStatus)
]);

AuthState _setUserList(
  AuthState state,
  AuthenticationUserListAction action,
) {
  return state.copyWith(userList: action.userList);
}

AuthState _setAuthenticationLoadingStatus(
  AuthState state,
  AuthenticationLoadingStatusAction action,
) {
  return state.copyWith(loadingStatus: action.loadingStatus);
}
