import 'package:flutter/widgets.dart';
import 'package:redux/redux.dart';
import 'package:flutter_todo_redux/redux/actions/index.dart';
import 'package:flutter_todo_redux/models/app_state.dart';

//void navigationMiddleware(
//  Store<AppState> store,
//  dynamic action,
//  NextDispatcher next,
//) {
//  next(action);
//
//  if (action is NavigateAction) {
//    navigatorKey.currentState.pushReplacementNamed(action.routeName);
//  }
//}

Middleware<AppState> createRouteMiddleware(
    {@required GlobalKey<NavigatorState> navigatorKey}) {
  final changeRoute = _createChangeRouteMiddleware(navigatorKey: navigatorKey);

  return TypedMiddleware<AppState, NavigateAction>(changeRoute);
}

Middleware<AppState> _createChangeRouteMiddleware({
  @required GlobalKey<NavigatorState> navigatorKey,
}) {
  print(navigatorKey.currentState);

  return (Store store, action, NextDispatcher next) async {
    navigatorKey.currentState.pushReplacementNamed(action.routeName);

    next(action);
  };
}
