import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Paciente{
  final String id;
  final String nombre;
  final String genero;
  final String edad;
  final String telefono;
  final String eps;
  final String rol;



  Paciente({Key key,
    @required this.id,
    @required this.nombre,
    @required this.genero,
    @required this.edad,
    @required this.telefono,
    @required this.eps,
    @required this.rol
  });

}