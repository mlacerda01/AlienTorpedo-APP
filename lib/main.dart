import 'package:alien_torpedo_app/Models/TipoEvento.dart';
import 'package:alien_torpedo_app/Pages/CadastrarEventoView.dart';
import 'package:alien_torpedo_app/Pages/EventoListView.dart';
import 'package:alien_torpedo_app/Pages/GruposListView.dart';
import 'package:alien_torpedo_app/Pages/CadastrarTipoEventoView.dart';
import 'package:alien_torpedo_app/Pages/UndefinedView.dart';
import 'package:flutter/material.dart';
import 'package:global_configuration/global_configuration.dart';

import 'package:alien_torpedo_app/Pages/IndexView.dart';
import 'package:alien_torpedo_app/Pages/LoginView.dart';
import 'package:alien_torpedo_app/Pages/HomeView.dart';
import 'package:alien_torpedo_app/Pages/TipoEventoListView.dart';
import 'package:alien_torpedo_app/RouteGenerator.dart';

void setEnvironment() async{

  try {
    await GlobalConfiguration().loadFromAsset("app_settings.Development");
  }catch(e){
    print("Can't load the app_settings file. Erro: $e");
  }
}

void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  await setEnvironment();

  runApp(MaterialApp(
    initialRoute: '/',
    onGenerateRoute: RouteGenerator.generateRoute,
    onUnknownRoute: (settings) => MaterialPageRoute(
    builder: (context) => UndefinedView(
      name: settings.name,
    )),
  ));
}
