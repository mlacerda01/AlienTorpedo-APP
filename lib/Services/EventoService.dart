import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:global_configuration/global_configuration.dart';

import 'package:alien_torpedo_app/Models/TipoEvento.dart';

class EventoService {

  var _globalConfiguration = GlobalConfiguration();

  Future<List<TipoEvento>> ListarTipoEvento() async {

    List<TipoEvento> tiposEventos = List<TipoEvento>();

    try {
      String url = GlobalConfiguration().getValue('Url_AlienTorpedoAPI') + GlobalConfiguration().getValue('listar_tipoEvento');
      http.Response response = await http.get(url);

      if(response.statusCode == 200){
        var jsonTipoEvento = jsonDecode(response.body);

        for(var evento in jsonTipoEvento){
          tiposEventos.add(TipoEvento.fromJson(evento));
        }
      }

      print('Quantidade de tipos evento: ${tiposEventos.length}');
      return tiposEventos;
    } catch (e) {
      print(
          "Erro ao tentar obter 'ListarTipoEvento'. Para mais informações consulte: $e");
    }
  }
  
  Future<dynamic> CadastrarTipoEvento(TipoEvento tipoEvento) async{
    
    try{
      print('CadastrarTipoEvento() - Passo 1');
      String url = _globalConfiguration.getValue('Url_AlienTorpedoAPI') + _globalConfiguration.getValue('cadastrar_tipoEvento');

      print('CadastrarTipoEvento() - Passo 2');
      print(jsonEncode(tipoEvento.toJson()));
      http.Response response = await http.post(url, body: jsonEncode(<String, String>{'cdTipoEvento': null, 'nmTipoEvento': tipoEvento.nmTipoEvento}));

      print('CadastrarTipoEvento() - Passo 3');
      if(response.statusCode == 200) {
        print(response.body);
        return jsonDecode(response.body);
      }
    }catch(e){
      print('Erro ao tentar cadastrar o tipo de evento. Para mais informações consulte: $e.');
    }
  }

  Future<http.Response> createTipoEvento(TipoEvento evento) {
    String url = _globalConfiguration.getValue('Url_AlienTorpedoAPI') + _globalConfiguration.getValue('cadastrar_tipoEvento');

    return http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      // body: jsonEncode(<String, String>{
      //   'nmTipoEvento': nmTipoEvento,
      // }),
      body: jsonEncode(evento.toJson()),
    );

  }

}
