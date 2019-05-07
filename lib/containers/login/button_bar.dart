import 'package:flutter/material.dart';
import 'package:flutter_todo_redux/pages/splash_screen_page.dart';

class ButtonBarWidget extends StatefulWidget {
  ButtonBarWidget(this.userCreds, this.setUserCreds);

  final Function setUserCreds;
  final Map<String, String> userCreds;

  @override
  _ButtonBarWidgetState createState() => _ButtonBarWidgetState();
}

class _ButtonBarWidgetState extends State<ButtonBarWidget> {
  Future _getUserList;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ButtonTheme.bar(
      child: ButtonBar(
        alignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          UserList(context, widget.setUserCreds),
          FlatButton(
            child: const Text('Register'),
            onPressed: () {
              _navigateToSplashScreen(context);
            },
          ),
          FlatButton(
            child: const Text('Login'),
            onPressed: () {
              _authenticateUser();
            },
          ),
        ],
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget UserList(context, setUserCreds) => FutureBuilder(
        future: _getUserList,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.active:
            case ConnectionState.waiting:
              return Container(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            case ConnectionState.done:
              final List userList = snapshot.data;

              return DropdownButton<String>(
                hint: Text('Choose a user'),
                items: userList.map(
                  (value) {
                    return DropdownMenuItem<String>(
                      value: value.id.toString(),
                      child: Text(value.username),
                    );
                  },
                ).toList(),
                onChanged: (newValue) {
                  final user = userList.firstWhere((item) {
                    return item.id.toString() == newValue;
                  });
                  setUserCreds('username', user.username);
                  setUserCreds('password', user.id);
                },
              );
          }
        },
      );

  void _navigateToSplashScreen(BuildContext context) {
    Navigator.pushNamed(context, SplashScreenPage.routeName);
  }

  void _authenticateUser() {
//    _loginScreenBloc.dispatch(AuthenticateUser(
//      username: widget.userCreds['username'],
//      password: widget.userCreds['password'],
//    ));
  }
}
