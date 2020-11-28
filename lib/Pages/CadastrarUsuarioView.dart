import 'package:flutter/material.dart';

import 'package:alien_torpedo_app/Pages/HeaderView.dart';

class CadastrarUsuarioView extends StatefulWidget {
  @override
  _CadastrarUsuarioViewState createState() => _CadastrarUsuarioViewState();
}

class _CadastrarUsuarioViewState extends State<CadastrarUsuarioView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(context, "Cadastrar Usuário"),
      body: Text('ok'),
    );
  }
}
