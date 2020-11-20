import 'package:alien_torpedo_app/Models/Grupo.dart';
import 'package:alien_torpedo_app/Services/GrupoService.dart';
import 'package:flutter/material.dart';

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
      appBar: AppBar(
        title: Text('Grupos'),
        backgroundColor: Colors.green,
        centerTitle: true,
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 10.0),
          child: ListView.builder(
            itemCount: lstGrupos != null ? lstGrupos.length : 0,
            itemBuilder: (context, index){
              var grupo = lstGrupos[index];

              return Card(
                child: Padding(
                  padding: const EdgeInsets.only(top: 22.0, bottom: 22.0, right: 14.0, left: 14.0),
                  child: Row(
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
                          grupo.nmGrupo,
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.black,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
