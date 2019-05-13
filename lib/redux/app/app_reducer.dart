import 'package:flutter_todo_redux/redux/reducers.dart';
import 'package:flutter_todo_redux/redux/app/app_state.dart';

AppState appReducer(AppState state, action) {
  return AppState(
    authState: authReducer(state.authState, action),
    homeState: homeReducer(state.homeState, action),
  );
}
