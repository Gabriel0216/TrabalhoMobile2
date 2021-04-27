import "package:flutter/material.dart";
import "package:shared_preferences/shared_preferences.dart";

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

//SharedPreferences prefs = await SharedPreferences.getInstance();

class _LoginState extends State<Login> {
  final GlobalKey<ScaffoldState> scaffoldkey = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String usuario = "";
  String senha = "";
  bool autoavaliacao = false;

  void MostrarMensagem(String msg) {
    scaffoldkey.currentState.showSnackBar(SnackBar(content: Text(msg)));
  }

  void Acessar() async {
    final FormState form = formKey.currentState;
    if (!form.validate()) {
      autoavaliacao = true;
      MostrarMensagem(
          'Dados inválidos detectados! Corrijá os campos em vermelho!');
    } else {
      form.save();
      if (usuario == "admin" && senha == "senha12345") {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('usuario', usuario);
        Navigator.pushNamedAndRemoveUntil(
            context, "/home", ModalRoute.withName('/home'));
      } else {
        MostrarMensagem('Usuário ou senha inválidos!');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldkey,
      appBar: AppBar(
        title: Text('Login'),
      ),
      backgroundColor: Colors.amberAccent,
      body: SafeArea(
          top: false,
          bottom: false,
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextFormField(
                  key: Key("mobile"),
                  decoration: InputDecoration(labelText: "Nome de usuário"),
                  keyboardType: TextInputType.text,
                  onSaved: (String value) {
                    usuario = value;
                  },
                ),
                TextFormField(
                    decoration: InputDecoration(labelText: "Senha"),
                    obscureText: true,
                    onSaved: (String value) {
                      senha = value;
                    }),
                Divider(),
                ButtonBar(
                  children: <Widget>[
                    RaisedButton.icon(
                      onPressed: Acessar,
                      icon: Icon(Icons.arrow_forward),
                      label: Text("Acessar"),
                    )
                  ],
                )
              ],
            ),
          )),
    );
  }
}
