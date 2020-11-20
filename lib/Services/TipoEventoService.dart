import 'package:flutter/material.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:alien_torpedo_app/Models/TipoEvento.dart';

class TipoEventoService {

  GlobalConfiguration _global = GlobalConfiguration();

  Future<List<TipoEvento>> ListarTipoEvento() async {
    List<TipoEvento> tiposEventos = List<TipoEvento>();

    try {
      String url = _global.getValue('Url_AlienTorpedoAPI') + _global.getValue('listar_tipoEvento');
      http.Response response = await http.get(url);

      if (response.statusCode == 200) {
        var jsonTipoEvento = jsonDecode(response.body);

        for (var evento in jsonTipoEvento) {
          tiposEventos.add(TipoEvento.fromJson(evento));
        }
      }

      return tiposEventos;
    } catch (e) {
      print(
          "Erro ao tentar obter 'ListarTipoEvento'. Para mais informações consulte: $e");
    }
  }

  Future<http.Response> AdicionarTipoEvento(TipoEvento evento) {
    try {
      String url = _global.getValue('Url_AlienTorpedoAPI') +
          _global.getValue('cadastrar_tipoEvento');

      return http.post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(evento.toJson()),
      );
    } catch (e) {}
  }
}

