import 'package:flutter/material.dart';

import 'package:alien_torpedo_app/Models/Evento.dart';
import 'package:alien_torpedo_app/Services/EventoService.dart';
import 'package:alien_torpedo_app/Pages/HeaderView.dart';
import 'package:alien_torpedo_app/Pages/UtilView.dart';

class EventoListView extends StatefulWidget {
  @override
  _EventoListViewState createState() => _EventoListViewState();
}

class _EventoListViewState extends State<EventoListView> {

  EventoService _eventoService = EventoService();
  List<Evento> lstEventos = List<Evento>();
  List<String> snapshot = List<String>();

  void loadEventos() async
  {
    await _eventoService.ListarEventos().then((eventos){
      setState(() {
        lstEventos = eventos;

        snapshot.add("Teste 1");
        snapshot.add("Teste 2");
        snapshot.add("Teste 3");
        snapshot.add("Teste 4");
        snapshot.add("Teste 5");

      });
    });
  }

  @override
  void initState() {
    loadEventos();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: Header(context, "Eventos"),
      body: Container(
        padding: const EdgeInsets.all(10.0),
        child: Column(
            children:[
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  basicAddButton(context, "/cadastrarEventos", "Adicionar")
                ],
              ),
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.only(top: 5.0),
                  children: snapshot.map((data){
                    return Card(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 22.0, bottom: 22.0, right: 14.0, left: 14.0),
                        child: Text("${data}"),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ]
        ),
      ),
    );
    // fill in required params
  }
}
