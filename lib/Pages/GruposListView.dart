import 'package:flutter/material.dart';

import 'package:alien_torpedo_app/Pages/HeaderView.dart';
import 'package:alien_torpedo_app/Models/Grupo.dart';
import 'package:alien_torpedo_app/Services/GrupoService.dart';
import 'package:alien_torpedo_app/Pages/UtilView.dart';

class GrupoListView extends StatefulWidget {
  @override
  _GrupoListViewState createState() => _GrupoListViewState();
}

class _GrupoListViewState extends State<GrupoListView> {

  List<Grupo> lstGrupos = List<Grupo>();
  GrupoService _grupoService = GrupoService();

  void loadGrupos() async{
    _grupoService.ListarGrupos().then((grupos)
    {
      setState(() {
        lstGrupos = grupos;
      });
    });
  }

  @override
  void initState() {
    loadGrupos();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: Header(context, "Grupos"),
      body: Container(
        padding: const EdgeInsets.all(10.0),
        child: Column(
            children:[
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  basicAddButton(context, "/cadastrarGrupos", "Adicionar")
                ],
              ),
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.only(top: 5.0),
                  children: lstGrupos.map((grupo){
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
                            child: Text("${grupo.nmGrupo}"),
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
