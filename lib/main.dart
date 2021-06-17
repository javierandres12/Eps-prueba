

import 'package:eps/ui/screen/login_page_barras.dart';
import 'package:flutter/material.dart';



void main() {
  runApp(EpsApp());
}

class EpsApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
        title: 'Monitor Ospedale',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          primaryColor: Color(0xFF2EBFF7),
          accentColor: Colors.blueAccent,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: LoginPageBarras()
    );
  }
}
