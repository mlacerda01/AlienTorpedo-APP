import 'package:flutter/material.dart';

import 'package:alien_torpedo_app/Models/Evento.dart';
import 'package:alien_torpedo_app/Services/EventoService.dart';

class EventoListView extends StatefulWidget {
  @override
  _EventoListViewState createState() => _EventoListViewState();
}

class _EventoListViewState extends State<EventoListView> {

  EventoService _eventoService = EventoService();
  List<Evento> lstEventos = List<Evento>();

  void loadEventos() async
  {
    await _eventoService.ListarEventos().then((eventos){
      setState(() {
        lstEventos = eventos;
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
      appBar: AppBar(
        title: Text('Eventos'),
        backgroundColor: Colors.green,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: () {
            Navigator.pushNamed(context, '/home');
          },
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 10.0),
        child: Container(
          child: ListView.builder(
            itemCount: lstEventos != null ? lstEventos.length : 0,
            itemBuilder: (context, index){
              var evento = lstEventos[index];

              return Card(
                child: Padding(
                  padding: const EdgeInsets.only(top: 22.0, bottom: 22.0, right: 14.0, left: 14.0),
                  child: Text("${evento.NmEvento}"),
                ),
              );
            },
            ),
          ),
      ),
    );
  }
}
