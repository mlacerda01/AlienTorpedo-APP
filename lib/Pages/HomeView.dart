import 'package:alien_torpedo_app/Pages/TipoEventoListView.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

enum Menu { Usuarios, Sorteio, Grupos, Eventos, TipoEvento}

class _HomeViewState extends State<HomeView> {

  redirectToView(menuItem){

    switch(menuItem){
      case Menu.TipoEvento:
        Navigator.of(context).pushNamed('/listarTipoEvento');
        break;
      case Menu.Usuarios:
        Navigator.of(context).pushNamed('/listarUsuarios');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    dynamic user = ModalRoute.of(context).settings.arguments;
    Menu _setMenu;

    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text(
          'Alien Torpedo',
          style: TextStyle(color: Colors.white, fontSize: 16.0),
        ),
        backgroundColor: Colors.green,
        centerTitle: true,
        leading: PopupMenuButton<Menu> (
          icon: Icon(Icons.menu),
          onSelected: (Menu menuItem){
            setState(() {
              _setMenu = menuItem;
              redirectToView(menuItem);
            });
          },
          itemBuilder: (context) => <PopupMenuEntry<Menu>>[
            const PopupMenuItem(
              value: Menu.TipoEvento,
              child: Text('Tipo Eventos'),
            ),
            const PopupMenuItem(
              value: Menu.Eventos,
              child: Text('Eventos'),
            ),
            const PopupMenuItem(
              value: Menu.Usuarios,
              child: Text('Usuarios')
            )
          ],
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.account_circle),
            tooltip: 'Account',
            color: Colors.white,
            onPressed: (){
              print('${user['nmUsuario']}');
            },
          )
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Text(''),
      ),
    );
  }
}