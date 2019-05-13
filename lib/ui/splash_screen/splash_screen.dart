import 'package:flutter/material.dart';

class SplashScreenPage extends StatefulWidget {
  static const String routeName = '/';

  SplashScreenPage({@required this.onInit});

  final Function onInit;

  @override
  _SplashScreenPageState createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  void initState() {
    widget.onInit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.greenAccent,
        body: Container(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.mode_edit),
                const SizedBox(
                  height: 12.0,
                ),
                Text('ToDo Splash Screen'),
                const SizedBox(
                  height: 12.0,
                ),
                CircularProgressIndicator(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
