import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class IndexView extends StatefulWidget {
  @override
  _IndexViewState createState() => _IndexViewState();
}

class _IndexViewState extends State<IndexView> {

  void redirect(){
      Navigator.pushReplacementNamed(context, '/login');
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Colors.green,
      body: Container(
        margin: EdgeInsets.fromLTRB(0, 200.0, 0, 0),
        child: Column(
          children: <Widget>[
            SpinKitFoldingCube(
              color: Colors.blueGrey,
              size: 120.0,
            ),
            SizedBox(height: 30.0,),
            FlatButton(
                onPressed: (){
                  redirect();
                },
                child: Text(
                  'Login',
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                  ),
                ),
            ),
          ],
        ),
      ),
    );
  }
}
