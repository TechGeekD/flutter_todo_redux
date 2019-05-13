import 'package:redux/redux.dart';

import 'package:flutter_todo_redux/redux/actions.dart' show LoaderAction;

final loaderReducer = combineReducers<bool>([
  TypedReducer<bool, LoaderAction>(_setLoader),
]);

bool _setLoader(bool state, LoaderAction action) {
  return action.isLoading;
}
