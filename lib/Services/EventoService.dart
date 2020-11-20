import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:global_configuration/global_configuration.dart';

import 'package:alien_torpedo_app/Models/TipoEvento.dart';
import 'package:alien_torpedo_app/Models/Evento.dart';

class EventoService {
  GlobalConfiguration _global = GlobalConfiguration();

  Future<List<Evento>> ListarEventos() async {
    List<Evento> eventos = List<Evento>();

    try {
      String url = _global.getValue('Url_AlienTorpedoAPI') + _global.getValue('listar_eventos');
      http.Response response = await http.get(url);

      if (response.statusCode == 200) {
        var jsonEventos = jsonDecode(response.body);

        for (var evento in jsonEventos) {
          eventos.add(Evento.fromJson(evento));
        }
      } else {
        throw new Exception(response.body);
      }
    } catch (e) {
      print('$e');
    }
  }

}
