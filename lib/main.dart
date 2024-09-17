import 'package:flutter/material.dart';
import 'package:health_care_app/screens/auth/login.dart';
import 'package:health_care_app/screens/base.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  bool _isAuth = true;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Healthcare App',
      home: _isAuth ? BaseScreen() : LoginScreen(),
    );
  }
}
