import 'package:flutter/material.dart';

class InputFieldsWidget extends StatefulWidget {
  InputFieldsWidget(this.userCreds, this.setUserCreds);

  final Function setUserCreds;
  final Map<String, String> userCreds;

  @override
  _InputFieldsWidgetState createState() => _InputFieldsWidgetState();
}

class _InputFieldsWidgetState extends State<InputFieldsWidget> {
  final username = TextEditingController();
  final password = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    username.text = widget.userCreds['username'];
    password.text = widget.userCreds['password'];

    return Column(
      children: <Widget>[
        TextFormField(
          controller: username,
          decoration: const InputDecoration(
            labelText: 'Username',
          ),
          validator: (String value) {
            if (value.trim().isEmpty) {
              return 'Username is required';
            }
          },
          onFieldSubmitted: (value) {
            widget.setUserCreds('username', value);
          },
        ),
        const SizedBox(
          height: 12.0,
        ),
        TextFormField(
          controller: password,
          obscureText: true,
          decoration: const InputDecoration(
            labelText: 'Password',
          ),
          validator: (String value) {
            if (value.trim().isEmpty) {
              return 'Password is required';
            }
          },
          onFieldSubmitted: (value) {
            widget.setUserCreds('password', value);
          },
        )
      ],
    );
  }
}
