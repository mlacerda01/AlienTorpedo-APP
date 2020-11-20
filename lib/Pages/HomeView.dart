import 'package:flutter/material.dart';

import 'package:alien_torpedo_app/Pages/TipoEventoListView.dart';
import 'package:alien_torpedo_app/Models/Menu.dart';
import 'package:flutter/services.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

// enum Menu { Usuarios, Sorteio, Grupos, Eventos, TipoEvento }

class _HomeViewState extends State<HomeView> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var user = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text(
          'Alien Torpedo',
          style: TextStyle(color: Colors.white, fontSize: 16.0),
        ),
        backgroundColor: Colors.green,
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.account_circle),
            tooltip: 'Account',
            color: Colors.white,
            onPressed: () {
              Navigator.of(context).pushNamed('/editarUsuario', arguments: user);
            },
          )
        ],
      ),
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: CircleAvatar(

              ),
              decoration: BoxDecoration(
                color: Colors.green,
              ),
            ),
            ListTile(
              title: Text('Eventos'),
              onTap: (){
                Navigator.of(context).pushNamed('/listarEventos');
              },
            ),
            ListTile(
              title: Text('Tipos Evento'),
              onTap: (){
                Navigator.of(context).pushNamed('/listarTipoEvento');
              },
            ),
            ListTile(
                title: Text('Grupos'),
                onTap: (){
                  Navigator.of(context).pushNamed('/listarGrupos');
              },
            ),
            ListTile(
              title: Text('Sair'),
              onTap: (){
                SystemNavigator.pop();
              },
            )
          ],
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Text(''),
      ),
    );
  }
}
