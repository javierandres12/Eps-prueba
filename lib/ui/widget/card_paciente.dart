

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardPaciente extends StatelessWidget{

  String nombrePaciente;
  String edadPaciente;
  String epsPaciente;
  String idPaciente;
  String generoPaciente;
  String telefonoPaciente;
  String rolPaciente;
  final VoidCallback onPressed;


  CardPaciente({Key key,
    @ required this.nombrePaciente,
    @ required this.edadPaciente,
    @required this.epsPaciente,
    @required this.idPaciente,
    @required this.generoPaciente,
    @required this.telefonoPaciente,
    @required this.rolPaciente,
    @required this.onPressed

  });

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidht = MediaQuery.of(context).size.width;

    if(int.parse(edadPaciente)>=50){
      return InkWell(
        onTap: onPressed,
        child: Container(
          child: Container(
            margin: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.all(3),
                  child: Text('Nombre: ${nombrePaciente}',style: TextStyle(fontSize: 16, ),),
                ),
                Container(
                  margin: EdgeInsets.all(2),
                  child: Text('Id: ${idPaciente}',style: TextStyle(fontSize: 16, ),),
                ),
                Container(
                  margin: EdgeInsets.all(2),
                  child: Text('Genero: ${generoPaciente}',style: TextStyle(fontSize: 16, ),),
                ),
                Container(
                  margin: EdgeInsets.all(2),
                  child: Text('Edad: ${edadPaciente}',style: TextStyle(fontSize: 16, ),),
                ),
                Container(
                  margin: EdgeInsets.all(2),
                  child: Text('Telefono: ${telefonoPaciente}',style: TextStyle(fontSize: 16, ),),
                ),
                Container(
                  margin: EdgeInsets.all(2),
                  child: Text('Eps: ${epsPaciente}',style: TextStyle(fontSize: 16, ),),
                ),
                Container(
                  margin: EdgeInsets.all(2),
                  child: Text('Rol: ${rolPaciente}',style: TextStyle(fontSize: 16, ),),
                ),
                Container(
                  margin: EdgeInsets.all(2),
                  alignment: Alignment.center,
                  child: Text('Presiona para modificar o eliminar...',style: TextStyle(fontSize: 10, ),),
                ),
              ],
            ),
          ),
          width: screenWidht-30,
          decoration: BoxDecoration(
            //color: Color(0xFFD8D3C6),
            color: Color(0xFFE31616),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          margin: EdgeInsets.all(10),
          //padding: EdgeInsets.only(top: 10),
          alignment: Alignment.topLeft,
        ),
      );
    }else{
      return InkWell(
        onTap: onPressed,
        child: Container(
          child: Container(
            margin: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.all(3),
                  child: Text('Nombre: ${nombrePaciente}',style: TextStyle(fontSize: 16, ),),
                ),
                Container(
                  margin: EdgeInsets.all(2),
                  child: Text('Id: ${idPaciente}',style: TextStyle(fontSize: 16, ),),
                ),
                Container(
                  margin: EdgeInsets.all(2),
                  child: Text('Genero: ${generoPaciente}',style: TextStyle(fontSize: 16, ),),
                ),
                Container(
                  margin: EdgeInsets.all(2),
                  child: Text('Edad: ${edadPaciente}',style: TextStyle(fontSize: 16, ),),
                ),
                Container(
                  margin: EdgeInsets.all(2),
                  child: Text('Telefono: ${telefonoPaciente}',style: TextStyle(fontSize: 16, ),),
                ),
                Container(
                  margin: EdgeInsets.all(2),
                  child: Text('Eps: ${epsPaciente}',style: TextStyle(fontSize: 16, ),),
                ),
                Container(
                  margin: EdgeInsets.all(2),
                  child: Text('Rol: ${rolPaciente}',style: TextStyle(fontSize: 16, ),),
                ),
                Container(
                  margin: EdgeInsets.all(2),
                  alignment: Alignment.center,
                  child: Text('Presiona para modificar o eliminar...',style: TextStyle(fontSize: 10, ),),
                ),
              ],
            ),
          ),
          width: screenWidht-30,
          decoration: BoxDecoration(
            //color: Color(0xFFD8D3C6),
            color: Color(0xFF46C50A),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          margin: EdgeInsets.all(10),
          //padding: EdgeInsets.only(top: 10),
          alignment: Alignment.topLeft,
        ),
      );

    }


    // TODO: implement build



  }
}