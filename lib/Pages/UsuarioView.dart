import 'package:flutter/material.dart';

import 'package:alien_torpedo_app/Pages/HeaderView.dart';

class UsuarioView extends StatefulWidget {
  @override
  _UsuarioViewState createState() => _UsuarioViewState();
}

class _UsuarioViewState extends State<UsuarioView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var usuario = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: Header(context, "Usuário"),
      body: Card(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 10.0),
          child: Column(
            children: [Text("$usuario['nmUsuario']")],
          ),
        ),
      ),
    );
  }
}
