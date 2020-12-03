import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:alien_torpedo_app/Pages/UtilView.dart';

class IndexView extends StatefulWidget {
  @override
  _IndexViewState createState() => _IndexViewState();
}

class _IndexViewState extends State<IndexView> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor:  Colors.green[100],
      body: Container(
        margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 20.0),
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                basicRedirectButton(context, '/cadastrarUsuario', "Cadastrar", 250.0, 46.0),
                SizedBox(height: 8.0,),
                basicRedirectButton(context, '/login', "Login", 250.0, 46.0)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
