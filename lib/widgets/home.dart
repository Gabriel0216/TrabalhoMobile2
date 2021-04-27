import 'package:flutter/material.dart';
import "package:shared_preferences/shared_preferences.dart";

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String usuario;

  @override
  void initState() {
    super.initState();
    getDadosUsuario();
  }

  getDadosUsuario() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    this.usuario = (prefs.getString('usuario') ?? "");
  }

  void Logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('usuario');
    Navigator.pushNamedAndRemoveUntil(
        context, "/login", ModalRoute.withName('/login'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("Bem vindo " + this.usuario),
          RaisedButton(
            onPressed: Logout,
            child: Text("Logout"),
          )
        ],
      ),
    );
  }
}
