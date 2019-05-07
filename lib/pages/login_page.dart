import 'package:flutter/material.dart';

import 'package:flutter_todo_redux/containers/login/button_bar.dart';
import 'package:flutter_todo_redux/containers/login/input_fields.dart';

class LoginPage extends StatefulWidget {
  LoginPage({this.title});

  static final String routeName = '/login';

  final String title;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Map<String, String> userCreds = Map();

  @override
  void initState() {
    setState(() {
      userCreds.putIfAbsent('username', () => "");
      userCreds.putIfAbsent('password', () => "");
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        child: Center(
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  InputFieldsWidget(userCreds, setUserCreds),
                  ButtonBarWidget(userCreds, setUserCreds),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  setUserCreds(key, update) {
    print(update);
    setState(() {
      this.userCreds[key] = update.toString();
    });
  }
}