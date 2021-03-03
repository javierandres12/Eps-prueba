import 'package:flutter/material.dart';

class User{
  final String uid;
  final String name;
  final String email;


  User({Key key,
    @required this.uid,
    @required this.name,
    @required this.email,
  });

}