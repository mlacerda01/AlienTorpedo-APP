import 'package:flutter/material.dart';

import 'package:alien_torpedo_app/Models/TipoEvento.dart';
import 'package:alien_torpedo_app/Services/TipoEventoService.dart';
import 'package:alien_torpedo_app/Pages/HeaderView.dart';
import 'package:alien_torpedo_app/Pages/UtilView.dart';

class TipoEventoListView extends StatefulWidget {
  @override
  _TipoEventoListViewState createState() => _TipoEventoListViewState();
}

class _TipoEventoListViewState extends State<TipoEventoListView> {
  TipoEventoService _eventoService = new TipoEventoService();
  List<TipoEvento> lstTiposEvento = List<TipoEvento>();

  void _CarregarListTipoEvento() async {
    var evento = await _eventoService.ListarTipoEvento();

    setState(() {
      lstTiposEvento = evento;
    });
  }

  @override
  Future<void> initState() {
    _CarregarListTipoEvento();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: Header(context, "Lista de Tipos Eventos"),
      body: Container(
        padding: const EdgeInsets.all(10.0),
        child: Column(
            children:[
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  basicAddButton(context, "/cadastrarTipoEvento", "Adicionar")
                ],
              ),
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.only(top: 5.0),
                  children: lstTiposEvento.map((tipoEvento){
                    return Card(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: CircleAvatar(
                              backgroundColor: Colors.green,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 22.0, bottom: 22.0, right: 14.0, left: 14.0),
                            child: Text("${tipoEvento.nmTipoEvento}"),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ),
            ]
        ),
      ),
    );
  }
}