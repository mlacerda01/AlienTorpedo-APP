import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:global_configuration/global_configuration.dart';

class UsuarioService {

  Future<dynamic> AutenticarUsuario(String NmEmail, String NmSenha) async {
    dynamic responseStream;

    try {

      String url = GlobalConfiguration().getValue('Url_AlienTorpedoAPI') + GlobalConfiguration().getValue('autenticar_usuario');
      url = url.replaceAll('{{email}}', NmEmail).replaceAll('{{senha}}', NmSenha).replaceAll(' ', '');

      http.Response response = await http.get(url);
      responseStream = jsonDecode(response.body);

      print(responseStream);

    } catch (e) {
      responseStream = 'Erro: $e';
    }

    return responseStream;
  }
}
