import 'package:flutter/material.dart';

Widget showDialogMessage(context, title, message, isError){
  showDialog(
    context: context,
    builder: (BuildContext builder) {
      return AlertDialog(
        title: Container(
          child: Expanded(
            child: Text(
              '$title',
              style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold
              ),
            ),
          )
        ),
        content: Text(
          "$message",
          style: TextStyle(
              color: Colors.black,
              fontSize: 16.0
          ),
        ),
        actions: <Widget>[
          ButtonTheme(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0)
            ),
            child: FlatButton(
              color: Colors.green,
              child: Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
        ],
      );
    });
}

Widget basicAddButton(context, String pageName, String buttonName){

  return ButtonTheme(
    height: 40.0,
    minWidth: 120.0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16.0),
    ),
    child: RaisedButton(
      onPressed: (){
        Navigator.of(context).pushNamed("$pageName");
      },
      child: Text(
        '$buttonName',
        style: TextStyle(
            fontSize: 16.0,
            color: Colors.white,
            fontWeight: FontWeight.bold
        ),
      ),
      color: Colors.green,
    ),
  );

}
