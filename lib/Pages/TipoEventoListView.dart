import 'package:alien_torpedo_app/Models/TipoEvento.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:alien_torpedo_app/Services/EventoService.dart';

class TipoEventoListView extends StatefulWidget {
  @override
  _TipoEventoListViewState createState() => _TipoEventoListViewState();
}

class _TipoEventoListViewState extends State<TipoEventoListView> {
  EventoService _eventoService = new EventoService();
  List<TipoEvento> lstTiposEvento = List<TipoEvento>();

  void _CarregarListTipoEvento() async{
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
        appBar: AppBar(
          backgroundColor: Colors.green,
          centerTitle: true,
          title: Text(
            'Lista de Tipos Eventos',
            style: TextStyle(color: Colors.white, fontSize: 16.0),
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            color: Colors.white,
            onPressed: () {
              Navigator.pushNamed(context, '/home');
            },
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 10.0),
          child: ListView.builder(
                  itemCount: lstTiposEvento == null ? 0 : lstTiposEvento.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 22.0, bottom: 22.0, right: 14.0, left: 14.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(0.0),
                              child: CircleAvatar(
                                backgroundColor: Colors.green,
                              ),
                            ),
                            SizedBox(width: 10.0,),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 10.0, 0.0, 0.0),
                              child: Text(
                                  '${lstTiposEvento[index].nmTipoEvento}',
                                    style: TextStyle(
                                    fontSize: 14.0,
                                    color: Colors.black,
                                  ),
                                ),
                            ) ,
                          ],
                        ),
                      ),
                    );
                  }
                ),
          ),
        floatingActionButton: FlatButton.icon(
            color: Colors.green,
            onPressed: (){
              Navigator.of(context).pushNamed('/cadastrarTipoEvento');
            },
            icon: Icon(
                Icons.add_circle,
            ),
            label: Text(
              'Adicionar',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 14.0
              ),
            ),
        ),
    );
  }
}
