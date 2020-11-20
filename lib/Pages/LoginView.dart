import 'dart:convert';

import 'package:alien_torpedo_app/Pages/UtilView.dart';
import 'package:flutter/material.dart';
import 'package:alien_torpedo_app/Services/UsuarioService.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {

  UsuarioService _usuarioService = UsuarioService();
  TextEditingController _controllerEmail = TextEditingController();
  TextEditingController _controllerPassword = TextEditingController();
  UtilView _utilView = UtilView();

  bool _isEmailValid = false;
  bool _isPasswordValid = false;

  bool isDataValid(String email, String password){

    bool isValid = (email.isEmpty || password.isEmpty) ? false: true;

    if(!isValid){
      setState(() {
        _isPasswordValid = password.isEmpty;
        _isEmailValid = email.isEmpty;
      });
    }

    return isValid;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _controllerEmail.dispose();
    _controllerPassword.dispose();

    super.dispose();
  }

  void _showDialog(title, message){
    showDialog(
        context: context,
        builder: (BuildContext builder){
          return AlertDialog(
            title: Container(
              child: Text(
                '$title',
                style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold
                ),
              ),
            ),
            content: Text(
                "$message",
                style: TextStyle(
                    color: Colors.red,
                    fontSize: 16.0
                ),
            ),
            actions: <Widget>[
              FlatButton(
                child: Text("OK"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.fromLTRB(20.0, 180.0, 20.0, 0),
        child: Center(
          child: Column(
            children: <Widget>[
              TextField(
                controller: _controllerEmail,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  icon: Icon(Icons.mail),
                  labelText: 'E-mail',
                  border: OutlineInputBorder(),
                  errorText: _isEmailValid ? 'Value Can\'t Be Empty' : null
                ),
              ),
              SizedBox(height: 20.0,),
              TextField(
                controller: _controllerPassword,
                obscureText: true,
                keyboardType: TextInputType.text,
                maxLength: 20,
                decoration: InputDecoration(
                  icon: Icon(Icons.lock),
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                  errorText: _isPasswordValid ? 'Value Can\'t Be Empty' : null,
                ),
              ),
              RaisedButton(
                color: Colors.green,
                elevation: 24.0,
                child: Text(
                    'Logar',
                    style: TextStyle(color: Colors.white, fontSize: 14.0, fontWeight: FontWeight.bold),
                ),
                onPressed: () async {
                  String email = _controllerEmail.value.text;
                  String password = _controllerPassword.value.text;

                  if(isDataValid(email, password)) {
                    var response = await _usuarioService.AutenticarUsuario(email, password);

                    if(response['cdretorno'] == 0){
                      Navigator.pushReplacementNamed(context, '/home', arguments: response);
                    }else{
                      // _utilView.showDialog(context,'Atenção', response['mensagem']);
                      _showDialog('Atenção', response['mensagem']);
                    }
                  }
                },
              ),
            ],
          ),
        ),
      )
    );
  }
}