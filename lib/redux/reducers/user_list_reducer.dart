import 'package:flutter_todo_redux/models/user.dart';
import 'package:redux/redux.dart';
import 'package:flutter_todo_redux/redux/actions/index.dart';

final userListReducer = combineReducers<List<User>>([
  TypedReducer<List<User>, AuthenticationUserListAction>(_setUserList),
]);

List<User> _setUserList(
  List<User> userList,
  AuthenticationUserListAction action,
) {
  return action.userList;
}
