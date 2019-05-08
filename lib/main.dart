import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux_logging/redux_logging.dart';


import 'package:flutter_todo_redux/config.dart';
import 'package:flutter_todo_redux/env/env.dart';

import 'package:flutter_todo_redux/redux/actions/index.dart';
import 'package:flutter_todo_redux/redux/reducers/app_reducer.dart';
import 'package:flutter_todo_redux/redux/middlewares/index.dart';

import 'package:flutter_todo_redux/models/app_state.dart';

import 'package:flutter_todo_redux/pages/splash_screen_page.dart';
import 'package:flutter_todo_redux/pages/login_page.dart';
import 'package:flutter_todo_redux/pages/home_page.dart';

final navigatorKey = GlobalKey<NavigatorState>();

void main() {
  final store = Store<AppState>(
    appReducer,
    initialState: AppState(),
    middleware: [
      ...createStoreTodosMiddleware(),
      ...createAuthMiddleware(),
      createRouteMiddleware(navigatorKey: navigatorKey),
      LoggingMiddleware.printer(),
    ],
  );

  runApp(ConfigWrapper(
    config: Config.fromJson(env),
    child: TodoApp(store: store),
  ));
}

class TodoApp extends StatelessWidget {
  TodoApp({this.store});

  final String title = 'Me Suite';
  final Store<AppState> store;

  @override
  Widget build(BuildContext context) {
    final Config config = ConfigWrapper.of(context);

    return StoreProvider(
      store: store,
      child: MaterialApp(
        title: title,
        navigatorKey: navigatorKey,
        debugShowCheckedModeBanner: !config.production,
        routes: <String, WidgetBuilder>{
          SplashScreenPage.routeName: (BuildContext context) {
            return SplashScreenPage(
              onInit: () {
                StoreProvider.of<AppState>(context)
                    .dispatch(HasAuthenticatedAction());
              },
            );
          },
          HomePage.routeName: (BuildContext context) {
            return HomePage(
              title: 'Home',
              onInit: () {
                StoreProvider.of<AppState>(context).dispatch(LoadTodosAction());
              },
            );
          },
          LoginPage.routeName: (BuildContext context) {
            return LoginPage(
              title: 'Login',
              onInit: () {
                StoreProvider.of<AppState>(context)
                    .dispatch(LoadAuthenticationUserListAction());
              },
            );
          }
        },
      ),
    );
  }
}
