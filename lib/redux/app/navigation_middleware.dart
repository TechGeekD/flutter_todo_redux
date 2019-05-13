import 'package:redux/redux.dart';

import 'package:flutter_todo_redux/redux/actions.dart' show NavigateAction;
import 'package:flutter_todo_redux/redux/app/app_state.dart';

import 'package:flutter_todo_redux/utils/keys.dart';

Middleware<AppState> createRouteMiddleware() {
  final changeRoute = _createChangeRouteMiddleware();

  return TypedMiddleware<AppState, NavigateAction>(changeRoute);
}

Middleware<AppState> _createChangeRouteMiddleware() {
  print(Keys.navigatorKey.currentState);

  return (Store store, action, NextDispatcher next) async {
    await Keys.navigatorKey.currentState.pushReplacementNamed(action.routeName);

    next(action);
  };
}
