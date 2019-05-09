import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:flutter_todo_redux/redux/actions/auth_actions.dart';
import 'package:flutter_todo_redux/models/app_state.dart';

import 'package:flutter_todo_redux/containers/counter/counter.dart';
import 'package:flutter_todo_redux/containers/counter/increase_counter.dart';
import 'package:flutter_todo_redux/containers/home/todo_list.dart';

class HomePage extends StatefulWidget {
  static const String routeName = '/home_page';

  final String title;
  final Function onInit;

  HomePage({this.title, this.onInit});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    widget.onInit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final store = StoreProvider.of<AppState>(context);
    bool isLoading = false;

    store.onChange.listen((_store) async {
      await Future.delayed(Duration(seconds: 3));
      setState(() {
        isLoading = _store.isLoading;
      });
    });

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          if (isLoading)
            IconButton(
              icon: Icon(
                Icons.network_check,
                color: Colors.white,
              ),
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
