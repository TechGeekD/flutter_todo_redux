import 'package:flutter_todo_redux/models/app_state.dart';
import 'package:flutter_todo_redux/reducers/counter_reducer.dart';

AppState appReducer(AppState state, action) {
  return AppState(
    isLoading: false,
    count: counterReducer(state.count, action),
  );
}
