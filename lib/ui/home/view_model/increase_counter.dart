import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:flutter_todo_redux/redux/actions.dart'
    show IncrementCountAction;
import 'package:flutter_todo_redux/redux/app/app_state.dart';


class IncreaseCountButton extends StatelessWidget {
  IncreaseCountButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, VoidCallback>(
      converter: (Store<AppState> store) {
        return () {
          store.dispatch(IncrementCountAction());
        };
      },
      builder: (BuildContext context, VoidCallback increase) {
        return FloatingActionButton(
          onPressed: increase,
          child: Icon(Icons.add),
        );
      },
    );
  }
}
