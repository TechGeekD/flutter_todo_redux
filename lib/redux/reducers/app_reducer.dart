import 'package:flutter_todo_redux/models/app_state.dart';
import 'package:flutter_todo_redux/redux/reducers/index.dart';

AppState appReducer(AppState state, action) {
  return AppState(
    isLoading: loadingReducer(state.isLoading, action),
    count: counterReducer(state.count, action),
    todos: todoReducer(state.todos, action),
    userList: userListReducer(state.userList, action),
  );
}
