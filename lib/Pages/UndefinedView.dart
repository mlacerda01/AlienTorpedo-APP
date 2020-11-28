import 'package:flutter/material.dart';

import 'package:alien_torpedo_app/Pages/HeaderView.dart';

class UndefinedView extends StatelessWidget {
  final String name;
  const UndefinedView({Key key, this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(context, ""),
      body: Center(
        child: Text("Route for '$name' is not defined"),
      ),
    );
  }
}
