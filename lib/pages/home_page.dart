import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_todo_redux/actions/auth_actions.dart';
import 'package:flutter_todo_redux/containers/counter/counter.dart';
import 'package:flutter_todo_redux/containers/counter/increase_counter.dart';
import 'package:flutter_todo_redux/containers/home/todo_list.dart';
import 'package:flutter_todo_redux/models/app_state.dart';

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
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () {
              StoreProvider.of<AppState>(context).dispatch(UnAuthenticateAction());
            },
          )
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
