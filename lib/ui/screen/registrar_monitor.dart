import 'dart:io';
import 'package:eps/db/databaserec.dart';
import 'package:eps/model/registroMonitordata.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RegistrarMonitorScreen extends StatefulWidget{

  List listaDatos;
  List listaDatosLetras;
  List listaNumerica;
  File imagenRecortada;

  RegistrarMonitorScreen({
    @required this.listaNumerica,
    @required this.listaDatosLetras,
    @required this.listaDatos,
    @required this.imagenRecortada
  });



  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _RegistrarMonitorScreen();
  }
}

class _RegistrarMonitorScreen extends State<RegistrarMonitorScreen>{

  int color1= 0xFF2EBFF7;
  int colorFront=0xFF3B4C71;//0xFF93D3CB
  bool isImageLoaded = false;
  int colorAppbar=0xFF5574E4;

  //datos para las listas de respuestas
  String valueChooseIdM1;
  String valueChooseIdM2;
  String valueChooseIdM3;
  String valueChooseParametroMonitorFijo;
  String valueChooseParametroOperacion;
  String valueChooseOperacionECG;
  String valueChooseOperacionSP02;
  String valueChooseOperacionPSN;
  String valueChooseOperacionRESP;

  List ParametroOperacion=['Adelante','Atras'];

  final _scaffoldkey = GlobalKey<ScaffoldState>();
  // variable para el key que permite acceder al formulario actual del codigo
  final _formkey =  GlobalKey<FormState>();
  // creamos las variables para guardar los datos

  @override
  Widget build(BuildContext context) {
    //variables para el largo y ancho de la pantalla
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidht = MediaQuery.of(context).size.width;


    return Scaffold(
      key: _scaffoldkey,
      appBar: AppBar(
        backgroundColor: Color(colorFront),
        title: Text('Registrar Monitor',style: TextStyle(color: Colors.white),),
        centerTitle: true,
        leading:  IconButton(icon: Icon(Icons.arrow_back,color: Colors.white,), onPressed: (){
          Navigator.pop(context);
        }),
        actions: [
          IconButton(
              icon: Icon(Icons.settings , color: Colors.white,),
              onPressed: (){

              }
          ),
        ],
      ),
      body: ListView(
        children: [
          Container(
            height: screenHeight/2.5,
            width: screenWidht,
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: FileImage(widget.imagenRecortada),
                )
            ),
          ),
          Container(
            padding: EdgeInsets.all(2),
            margin: EdgeInsets.only(top:5,left: 10,right: 5,bottom: 10),
            decoration: BoxDecoration(
              color: Color(colorFront),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Column(
              children: [
                Container(
                  child: Text('Primer parametro de reconocimiento',style: TextStyle(color: Colors.white),),
                ),
                Container(
                  height: 40,
                  width: screenWidht,
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(2),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 3,
                          color: Color(colorFront),
                        )
                      ]
                  ),
                  child: DropdownButton(
                      hint: Text('Identificacion M1'),
                      value: valueChooseIdM1,
                      isExpanded: true,
                      items: widget.listaDatos.map((valueItem){
                        return DropdownMenuItem(
                          value: valueItem,
                          child: Text(valueItem),
                        );
                      }).toList(),
                      onChanged: (newValue){
                        setState(() {
                          valueChooseIdM1 = newValue;
                        });
                      }
                  ),
                ),
                Container(
                  child: Text('Segundo parametro de reconocimiento',style: TextStyle(color: Colors.white),),
                ),
                Container(
                  height: 40,
                  width: screenWidht,
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(2),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 3,
                          color: Color(colorFront),
                        )
                      ]
                  ),
                  child: DropdownButton(
                      hint: Text('Identificacion M2'),
                      value: valueChooseIdM2,
                      isExpanded: true,
                      items: widget.listaDatos.map((valueItem){
                        return DropdownMenuItem(
                          value: valueItem,
                          child: Text(valueItem),
                        );
                      }).toList(),
                      onChanged: (newValue){
                        setState(() {
                          valueChooseIdM2 = newValue;
                        });
                      }
                  ),
                ),
                Container(
                  child: Text('Tercer parametro de reconocimiento',style: TextStyle(color: Colors.white),),
                ),
                Container(
                  height: 40,
                  width: screenWidht,
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(2),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 3,
                          color: Color(colorFront),
                        )
                      ]
                  ),
                  child: DropdownButton(
                      hint: Text('Identificacion M3'),
                      value: valueChooseIdM3,
                      isExpanded: true,
                      items: widget.listaDatos.map((valueItem){
                        return DropdownMenuItem(
                          value: valueItem,
                          child: Text(valueItem),
                        );
                      }).toList(),
                      onChanged: (newValue){
                        setState(() {
                          valueChooseIdM3 = newValue;
                        });
                      }
                  ),
                ),
                /*Container(
                  child: Text('Parametro de reconocimiento [FC,ECG,SP02...]',style: TextStyle(color: Colors.white),),
                ),
                Container(
                  height: 40,
                  width: screenWidht,
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(2),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 3,
                          color: Color(colorFront),
                        )
                      ]
                  ),
                  child: DropdownButton(
                      hint: Text('Parametro de lectura'),
                      value: valueChooseParametroMonitorFijo,
                      isExpanded: true,
                      items: widget.listaDatosLetras.map((valueItem){
                        return DropdownMenuItem(
                          value: valueItem,
                          child: Text(valueItem),
                        );
                      }).toList(),
                      onChanged: (newValue){
                        setState(() {
                          valueChooseParametroMonitorFijo = newValue;
                        });
                      }
                  ),
                ),
                Container(
                  child: Text('Posicion adelante o atras',style: TextStyle(color: Colors.white),),
                ),
                Container(
                  height: 40,
                  width: screenWidht,
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(2),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 3,
                          color: Color(colorFront),
                        )
                      ]
                  ),
                  child: DropdownButton(
                      hint: Text('Adelante o atras'),
                      value: valueChooseParametroOperacion,
                      isExpanded: true,
                      items: ParametroOperacion.map((valueItem){
                        return DropdownMenuItem(
                          value: valueItem,
                          child: Text(valueItem),
                        );
                      }).toList(),
                      onChanged: (newValue){
                        setState(() {
                          valueChooseParametroOperacion = newValue;
                        });
                      }
                  ),
                ),*/
                Container(
                  child: Text('Valor ECG',style: TextStyle(color: Colors.white),),
                ),
                Container(
                  height: 40,
                  width: screenWidht,
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(2),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 3,
                          color: Color(colorFront),
                        )
                      ]
                  ),
                  child: DropdownButton(
                      hint: Text('ECG'),
                      value: valueChooseOperacionECG,
                      isExpanded: true,
                      items: widget.listaNumerica.map((valueItem){
                        return DropdownMenuItem(
                          value: valueItem,
                          child: Text(valueItem),
                        );
                      }).toList(),
                      onChanged: (newValue){
                        setState(() {
                          valueChooseOperacionECG = newValue;
                        });
                      }
                  ),
                ),
                Container(
                  child: Text('Valor SP02',style: TextStyle(color: Colors.white),),
                ),
                Container(
                  height: 40,
                  width: screenWidht,
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(2),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 3,
                          color: Color(colorFront),
                        )
                      ]
                  ),
                  child: DropdownButton(
                      hint: Text('SP02'),
                      value: valueChooseOperacionSP02,
                      isExpanded: true,
                      items: widget.listaNumerica.map((valueItem){
                        return DropdownMenuItem(
                          value: valueItem,
                          child: Text(valueItem),
                        );
                      }).toList(),
                      onChanged: (newValue){
                        setState(() {
                          valueChooseOperacionSP02 = newValue;
                        });
                      }
                  ),
                ),
                Container(
                  child: Text('Valor RESP',style: TextStyle(color: Colors.white),),
                ),
                Container(
                  height: 40,
                  width: screenWidht,
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(2),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 3,
                          color: Color(colorFront),
                        )
                      ]
                  ),
                  child: DropdownButton(
                      hint: Text('RESP'),
                      value: valueChooseOperacionRESP,
                      isExpanded: true,
                      items: widget.listaNumerica.map((valueItem){
                        return DropdownMenuItem(
                          value: valueItem,
                          child: Text(valueItem),
                        );
                      }).toList(),
                      onChanged: (newValue){
                        setState(() {
                          valueChooseOperacionRESP = newValue;
                        });
                      }
                  ),
                ),
              ],
            ),
          ),
          
        ],
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blue,
          child: Icon(Icons.check,color: Colors.white,),
          onPressed: (){
            if(valueChooseIdM1!=null &&
                valueChooseIdM2!=null &&
                //valueChooseIdM3!=null &&
                //valueChooseParametroMonitorFijo!=null &&
                //valueChooseParametroOperacion!=null &&
                valueChooseOperacionECG!=null &&
                valueChooseOperacionSP02!=null &&
                valueChooseOperacionRESP!=null ){

              print(valueChooseIdM1);
              print(valueChooseIdM2);
              print(valueChooseIdM3);
              print(valueChooseParametroMonitorFijo);
              print(widget.listaNumerica.indexOf(valueChooseOperacionECG));
              print(widget.listaNumerica.indexOf(valueChooseOperacionSP02));
              print(widget.listaNumerica.indexOf(valueChooseOperacionRESP));
              print(widget.listaNumerica.length.toString());

              DataBaseREC.guardarRegistroMonitor(
                  RegistroMonitorData(
                      identificacionM1: valueChooseIdM1.toString(),
                      identificacionM2: valueChooseIdM2.toString(),
                      identificacionM3: valueChooseIdM3.toString(),
                      parametroMonitorFijo: valueChooseParametroMonitorFijo.toString(),
                      parametroOperacion: valueChooseParametroOperacion.toString(),
                      operacionECG: widget.listaNumerica.indexOf(valueChooseOperacionECG).toString(),
                      operacionSP02: widget.listaNumerica.indexOf(valueChooseOperacionSP02).toString(),
                      operacionPSN: valueChooseOperacionECG.toString(),
                      operacionRESP: widget.listaNumerica.indexOf(valueChooseOperacionRESP).toString(),
                      largoVector: widget.listaNumerica.length.toString()
                  )
              );
              return showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      content: Text(
                        'El monitor se registro correctamente, por favor vuelva a realizar el proceso de reconocimiento.',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      title: Text(
                        'MONITOR REGISTRADO',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      actions: [
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                              Navigator.pop(context);
                              Navigator.pop(context);
                            },
                            child: Text(
                              'Aceptar',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                              ),
                            )
                        )
                      ],
                    );
                  }
              );
            }else{
              _scaffoldkey.currentState.showSnackBar(SnackBar(content: Text('Por favor seleciona todas las opciones')));
            }

          }
      ),

    );




  }
}

