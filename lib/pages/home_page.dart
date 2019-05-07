import 'package:flutter/material.dart';
import 'package:flutter_todo_redux/containers/counter/counter.dart';
import 'package:flutter_todo_redux/containers/counter/increase_counter.dart';
import 'package:flutter_todo_redux/containers/home/todo_list.dart';

class HomePage extends StatelessWidget {
  static const String routeName = '/home_page';

  final String title;

  HomePage({this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
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
