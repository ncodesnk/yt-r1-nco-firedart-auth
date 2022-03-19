import 'package:flutter/material.dart';

import 'auth_sign_in.dart';
import 'auth_sign_up.dart';

class AuthHome extends StatefulWidget {
  const AuthHome({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<AuthHome> createState() => _AuthHomeState();
}

class _AuthHomeState extends State<AuthHome> {

  bool _showSignInScreen = true;

  void toggleAuthScreen() {
    setState(() {
      _showSignInScreen = !_showSignInScreen;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        child: _showSignInScreen ? SignInScreen(title: 'Sign in', toggleAuthScreen: toggleAuthScreen,) : SignUpScreen(title: "Sign up", toggleAuthScreen: toggleAuthScreen),
      ),
    );
  }

}