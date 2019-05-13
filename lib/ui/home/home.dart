import 'dart:async';

import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:flutter_todo_redux/redux/auth/auth_actions.dart';
import 'package:flutter_todo_redux/redux/app/app_state.dart';
import 'package:flutter_todo_redux/models/loading_status.dart';

import 'package:flutter_todo_redux/ui/home/view_model/counter.dart';
import 'package:flutter_todo_redux/ui/home/view_model/increase_counter.dart';
import 'package:flutter_todo_redux/ui/home/view_model/todo_list.dart';

class HomePage extends StatefulWidget {
  static const String routeName = '/home_page';

  final String title;
  final Function onInit;

  HomePage({this.title, this.onInit});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  LoadingStatus loadingStatus;
  StreamSubscription listenStore;

  @override
  void initState() {
    widget.onInit();

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    listenStore.cancel();
  }

  @override
  Widget build(BuildContext context) {
    Store<AppState> store = StoreProvider.of<AppState>(context);
    listenStore = store.onChange.listen((_store) async {
      await Future.delayed(Duration(seconds: 3));
      if (_store.homeState.loadingStatus != loadingStatus) {
        setState(() {
          loadingStatus = _store.homeState.loadingStatus;
        });
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          if (loadingStatus == LoadingStatus.loading)
            Icon(
              Icons.network_check,
              color: Colors.white,
            ),
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () {
              store.dispatch(UnAuthenticateAction());
            },
          ),
        ],
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'You have pushed the button this many times:',
                  ),
                  Counter(),
                ],
              ),
            ),
            Expanded(
              child: TodoList(),
            ),
          ],
        ),
      ),
      floatingActionButton: IncreaseCountButton(),
    );
  }
}
