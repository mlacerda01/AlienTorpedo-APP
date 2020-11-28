import 'package:alien_torpedo_app/Models/Grupo.dart';
import 'package:alien_torpedo_app/Pages/HeaderView.dart';
import 'package:alien_torpedo_app/Services/GrupoService.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CadastrarGrupoView extends StatefulWidget {
  @override
  _CadastrarGrupoViewState createState() => _CadastrarGrupoViewState();
}

class _CadastrarGrupoViewState extends State<CadastrarGrupoView> {

  GrupoService _grupoService = new GrupoService();
  TextEditingController _controllerGrupoName = TextEditingController();

  DateTime dtInclusao = DateTime.now();
  // Grupo grupo = Grupo();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(context, "Cadastrar Grupo"),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 10.0),
          child: Card(
            child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
              const ListTile(
                leading: Icon(Icons.album),
                title: Text('Adicionar Grupo'),
              ),
              Container(
                padding: const EdgeInsets.only(
                    top: 0.0, bottom: 22.0, right: 20.0, left: 20.0),
                child: Column(
                  children: <Widget>[
                    TextField(
                      controller: _controllerGrupoName,
                      keyboardType: TextInputType.text,
                    ),
                    Row(
                      children: <Widget>[
                        Text("$dtInclusao"),
                        IconButton(
                          icon: Icon(Icons.calendar_today),
                          onPressed: (){
                            showDatePicker(
                                context: context,
                                initialDate: DateTime(2001),
                                firstDate: DateTime(2001),
                                lastDate: DateTime(2050)
                            ).then((date) {
                              setState(() {
                                dtInclusao = date;
                              });
                            });
                          },
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    ButtonTheme(
                      minWidth: 150.0,
                      height: 36.0,
                      child: FlatButton.icon(
                          onPressed: () async{
                            // grupo.nmGrupo = _controllerGrupoName.value.text;
                            // grupo.dtInclusao = dtInclusao.toString();
                            //
                            // var response = await _grupoService.AdicionarGrupo(grupo);
                            // print(_controllerGrupoName.value.text);
                            // print(dtInclusao);
                            // print(response.body);
                          },
                          color: Colors.green,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                          ),
                          icon: Icon(
                            Icons.save,
                            color: Colors.white,
                          ),
                          label: Text(
                            'Salvar',
                            style: TextStyle(color: Colors.white),
                          )),
                    )
                  ],
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
