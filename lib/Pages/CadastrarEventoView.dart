import 'package:flutter/material.dart';

class CadastrarEventoView extends StatefulWidget {
  @override
  _CadastrarEventoViewState createState() => _CadastrarEventoViewState();
}

class _CadastrarEventoViewState extends State<CadastrarEventoView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Texto'),
        backgroundColor: Colors.green,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.white,
        ),
      ),
      body: Container(
        child: Text('aqui'),
      )
    );
  }
}
