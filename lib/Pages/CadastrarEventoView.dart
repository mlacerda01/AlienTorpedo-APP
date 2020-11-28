import 'package:alien_torpedo_app/Pages/HeaderView.dart';
import 'package:flutter/material.dart';

class CadastrarEventoView extends StatefulWidget {
  @override
  _CadastrarEventoViewState createState() => _CadastrarEventoViewState();
}

class _CadastrarEventoViewState extends State<CadastrarEventoView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(context, "Cadastrar Evento"),
      body: Container(
        child: Text('aqui'),
      )
    );
  }
}
