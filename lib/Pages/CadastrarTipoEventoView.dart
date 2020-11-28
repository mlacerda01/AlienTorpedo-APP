import 'package:alien_torpedo_app/Pages/UtilView.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:alien_torpedo_app/Services/TipoEventoService.dart';
import 'package:alien_torpedo_app/Models/TipoEvento.dart';
import 'package:alien_torpedo_app/Pages/HeaderView.dart';
import 'package:alien_torpedo_app/Pages/UtilView.dart';

class CadastrarTipoEventoView extends StatefulWidget {
  @override
  _CadastrarTipoEventoViewState createState() => _CadastrarTipoEventoViewState();
}

class _CadastrarTipoEventoViewState extends State<CadastrarTipoEventoView> {

  TipoEventoService _eventoService = new TipoEventoService();
  TextEditingController _controllerEvento = TextEditingController();
  bool _isTipoEventoValid = true;

  @override
  Future<void> initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: Header(context, "Cadastrar Tipo Evento"),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 10.0),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10.0, 40.0, 10.0, 10.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  TextField(
                    controller: _controllerEvento,
                    decoration: InputDecoration(
                        labelText: 'Tipo Evento',
                        border: OutlineInputBorder(),
                        errorText: !_isTipoEventoValid ? 'Value Can\'t Be Empty' : null
                    ),
                  ),
                  SizedBox(height: 8.0,),
                  FlatButton(

                    onPressed: () async {
                      TipoEvento event = new TipoEvento();
                      event.nmTipoEvento = _controllerEvento.value.text;

                      if(event.nmTipoEvento.isEmpty){
                        setState(() {
                          _isTipoEventoValid = false;
                        });

                      } else{

                        var response = await _eventoService.AdicionarTipoEvento(event);
                        showDialogMessage(context, 'Atenção', response.body, response.statusCode != 200);
                      }
                    },
                    color: Colors.green,
                    child: Text(
                        'Cadastrar',
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.white
                        ),
                    ),
                  )
                ],
              ),
            ),
          ),
        )
    );
  }
}
