import 'package:flutter/material.dart';

class UtilView{

  AlertDialog showDialog(context, title, message){
    return AlertDialog(
          title: Container(
            child: Text(
              '$title',
              style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
          content: Text(
            "$message",
            style: TextStyle(
                color: Colors.red,
                fontSize: 16.0
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
    );
  }
}
