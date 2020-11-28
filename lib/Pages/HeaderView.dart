import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

Widget Header(context, String title){
  return AppBar(
    backgroundColor: Colors.green,
    title: Text(
        "$title",
        style: TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
        ) ,
    ),
    centerTitle: true,
    leading: IconButton(
      icon: Icon(Icons.arrow_back, color: Colors.white),
      onPressed: (){
        Navigator.of(context).pop();
      },
    ),
  );
}

Widget HeaderHomePage(context){
  return AppBar(
        title: Text(
          'Alien Torpedo',
          style: TextStyle(color: Colors.white, fontSize: 18.0, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.green,
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.account_circle),
            tooltip: 'Account',
            color: Colors.white,
            onPressed: () {
              Navigator.of(context).pushNamed('/editarUsuario', arguments: null);
            },
          )
        ],
      );
}