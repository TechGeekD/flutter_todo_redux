import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux_logging/redux_logging.dart';

import 'package:flutter_todo_redux/reducers/app_reducer.dart';

import 'package:flutter_todo_redux/models/app_state.dart';
import 'package:flutter_todo_redux/pages/home_page.dart';

void main() => runApp(TodoApp());

class TodoApp extends StatelessWidget {
  final String title = 'Me Suite';
  final store = Store<AppState>(
    appReducer,
    initialState: AppState(),
    middleware: [LoggingMiddleware.printer()],
  );

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: MaterialApp(
        title: title,
        home: HomePage(title: 'Home'),
      ),
    );
  }
}
