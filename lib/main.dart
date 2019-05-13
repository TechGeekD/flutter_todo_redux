import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:flutter_todo_redux/config.dart';
import 'package:flutter_todo_redux/env/env.dart';

import 'package:flutter_todo_redux/redux/store.dart';
import 'package:flutter_todo_redux/redux/actions.dart';
import 'package:flutter_todo_redux/redux/app/app_state.dart';

import 'package:flutter_todo_redux/ui/index.dart';

import 'package:flutter_todo_redux/utils/keys.dart';

void main() async {
  final store = await createStore();

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
        navigatorKey: Keys.navigatorKey,
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
