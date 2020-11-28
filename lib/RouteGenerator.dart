import 'package:alien_torpedo_app/Pages/CadastrarEventoView.dart';
import 'package:alien_torpedo_app/Pages/CadastrarGrupoView.dart';
import 'package:alien_torpedo_app/Pages/CadastrarTipoEventoView.dart';
import 'package:alien_torpedo_app/Pages/EventoListView.dart';
import 'package:alien_torpedo_app/Pages/GruposListView.dart';
import 'package:alien_torpedo_app/Pages/HomeView.dart';
import 'package:alien_torpedo_app/Pages/LoginView.dart';
import 'package:alien_torpedo_app/Pages/TipoEventoListView.dart';
import 'package:alien_torpedo_app/Pages/UndefinedView.dart';
import 'package:alien_torpedo_app/Pages/UsuarioView.dart';
import 'package:flutter/material.dart';

import 'Pages/CadastrarUsuarioView.dart';
import 'Pages/IndexView.dart';

class RouteGenerator{

  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch(settings.name){
      case "/":
        return MaterialPageRoute(builder: (context) => IndexView());
      case "/login":
        return MaterialPageRoute(builder: (context) => LoginView());
      case "/home":
        return MaterialPageRoute(builder: (context) => HomeView());
      case "/listarTipoEvento":
        return MaterialPageRoute(builder: (context) => TipoEventoListView());
      case "/cadastrarTipoEvento":
        return MaterialPageRoute(builder: (context) => CadastrarTipoEventoView());
      case "/listarEventos":
        return MaterialPageRoute(builder: (context) => EventoListView());
      case "/cadastrarEventos":
        return MaterialPageRoute(builder: (context) => CadastrarEventoView());
      case "/listarGrupos":
        return MaterialPageRoute(builder: (context) => GrupoListView());
      case "/cadastrarGrupos":
        return MaterialPageRoute(builder: (context) => CadastrarGrupoView());
      case "/editarUsuario":
        return MaterialPageRoute(builder: (context) => UsuarioView());
      case "/cadastrarUsuario":
        return MaterialPageRoute(builder: (context) => CadastrarUsuarioView());
      default:
          return MaterialPageRoute(builder: (context) => UndefinedView());
    }
  }

}