import 'package:flutter/material.dart';
import 'package:flutter_todo_redux/middlewares/index.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux_logging/redux_logging.dart';

import 'package:flutter_todo_redux/actions/index.dart';
import 'package:flutter_todo_redux/reducers/app_reducer.dart';

import 'package:flutter_todo_redux/models/app_state.dart';

import 'package:flutter_todo_redux/pages/splash_screen_page.dart';
import 'package:flutter_todo_redux/pages/login_page.dart';
import 'package:flutter_todo_redux/pages/home_page.dart';

final navigatorKey = GlobalKey<NavigatorState>();

void main() {
  final store = Store<AppState>(
    appReducer,
    initialState: AppState(),
    middleware: createStoreTodosMiddleware()
      ..addAll([
        createRouteMiddleware(navigatorKey: navigatorKey),
        LoggingMiddleware.printer()
      ]),
  );

  runApp(TodoApp(store: store));
}

class TodoApp extends StatelessWidget {
  TodoApp({this.store});

  final String title = 'Me Suite';
  final Store<AppState> store;

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: MaterialApp(
        title: title,
        navigatorKey: navigatorKey,
        routes: <String, WidgetBuilder>{
          SplashScreenPage.routeName: (BuildContext context) {
            return SplashScreenPage(
              onInit: () {
                StoreProvider.of<AppState>(context).dispatch(LoadTodosAction());
              },
            );
          },
          HomePage.routeName: (BuildContext context) {
            return HomePage(
              title: 'home',
            );
          },
          LoginPage.routeName: (BuildContext context) {
            return LoginPage();
          }
        },
      ),
    );
  }
}
