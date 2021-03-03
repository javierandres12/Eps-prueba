

import 'package:eps/ui/screen/register_page.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';

import 'bloc/bloc_user.dart';


void main() {
  runApp(EpsApp());
}

class EpsApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return BlocProvider(
        child: MaterialApp(
            title: 'BlogApp',
            theme: ThemeData(
              primarySwatch: Colors.blue,
              primaryColor: Color(0xFF2EBFF7),
              accentColor: Colors.blueAccent,
              visualDensity: VisualDensity.adaptivePlatformDensity,
            ),
            home: RegisterPage()
        ),
        bloc: UserBloc()
    );
  }
}
