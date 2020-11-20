import 'package:global_configuration/global_configuration.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:alien_torpedo_app/Models/Grupo.dart';

class GrupoService{

  GlobalConfiguration _globalConfig = GlobalConfiguration();

  Future<List<Grupo>> ListarGrupos() async{
    List<Grupo> grupos = List<Grupo>();

    try{
      String url = _globalConfig.getValue('Url_AlienTorpedoAPI') + _globalConfig.getValue('listar_grupos');
      http.Response response = await http.get(url);

      if(response.statusCode == 200){
        var jsonGrupos = jsonDecode(response.body);
        for(var grupo in jsonGrupos) {
          grupos.add(Grupo.fromJson(grupo));
        }
      }else{
        throw new Exception(response.body);
      }

      return grupos;
    }catch(e){
      print('$e');
    }
  }

  Future<http.Response> AdicionarGrupo(Grupo grupo) async{

    try{
      String url = _globalConfig.getValue('Url_AlienTorpedoAPI') + _globalConfig.getValue('cadastrar_grupos');
      return await http.post(
          url,
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: grupo.toJson()
      );

    }catch(e){

    }

  }
}