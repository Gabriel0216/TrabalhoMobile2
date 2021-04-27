import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:login_flutter/widgets/landing.dart';
import 'package:login_flutter/widgets/login.dart';
import 'package:login_flutter/widgets/home.dart';

void main() => runApp(MyApp());

bool isLogged = false;
String nome = '';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tela login',
      routes: {
        '/': (context) => Landing(),
        '/login': (context) => Login(),
        '/home': (context) => Home()
      },
      theme: ThemeData(primarySwatch: Colors.blue),
    );
  }
}
