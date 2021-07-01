import 'package:eps/db/databaserec.dart';
import 'package:eps/ui/screen/registrar_monitor.dart';
import 'package:eps/ui/widget/button_app.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class CardMonitor extends StatefulWidget {
  String result;
  List listaDatos;
  List listaDatosLetras;
  List listaNumerica;
  String ReferenciaMonitor;
  File imagenRecortada;


  CardMonitor({
    @required this.listaDatos,
    @required this.result,
    @required this.listaDatosLetras,
    @required this.ReferenciaMonitor,
    @required this.listaNumerica,
    @required this.imagenRecortada
  });


  @override
  State<StatefulWidget> createState() {

    return _CardMonitor();
  }

}

class _CardMonitor extends State<CardMonitor>{

  //color del boton
  int colorBoton=0xFF3B4C71;

  //variables de dragger Infinity vista XL
  int itemFc;
  int itemSpO2;
  int itemPSN;
  int itemRESP;
  int itemPNI;
  int itemPLS;


  //infinity vista XL
  //primera forma de mostrar los datos
  int valorFC;
  bool FC;
  //segunda forma de mostrar los datos
  int valorPSN;
  bool PSN;
  int orderPSN;
  String NombreDescripcion;
  List DatosMonitor;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(microseconds: 1)).then((value) async{
      var datosMonitor= await DataBaseREC.MonitorRegistrado(/*identifiacion1, identifiacion2, identifiacion3*/);
      setState(() {
        DatosMonitor=datosMonitor;
      });
      print('datos.....: ${DatosMonitor}');
    });
  }

  @override
  Widget build(BuildContext context) {


    if(widget.listaDatos.isNotEmpty){
      print(widget.listaDatos);
      print(widget.listaDatosLetras);
      print(widget.listaNumerica);

      if( //widget.listaDatos.indexOf('Dräger')!=-1 &&
          widget.listaDatos.indexOf('Infinity')!=-1 &&
          widget.listaDatos.indexOf('Vista')!=-1 &&
          widget.listaDatos.indexOf('XL')!=-1 ||
              widget.listaDatos.indexOf('Infinity')!=-1 &&
              widget.listaDatos.indexOf('VistaXL')!=-1){//si es un Drager Infinity Vista XL

        try{
          int valorpsn = int.parse(widget.listaDatosLetras[(widget.listaDatosLetras.indexOf('PSN')+1)]);
          setState(() {
            valorPSN=valorpsn;
            orderPSN=0;
            PSN=true;
          });
        }catch(e){
          try{
            int valorpsn = int.parse(widget.listaDatosLetras[(widget.listaDatosLetras.indexOf('PSN')-1)]);
            setState(() {
              valorPSN=valorpsn;
              orderPSN=1;
              PSN=true;
            });
          }catch(e){
            setState(() {
              PSN=false;
            });
          }
        }

        if(widget.listaDatosLetras.indexOf('PSN')!=-1 &&
            (widget.listaNumerica.indexOf(valorPSN)-4)>=0
            && PSN){
          setState(() {
            itemFc=(widget.listaNumerica.indexOf(valorPSN)-4);
            itemSpO2 = (widget.listaNumerica.indexOf(valorPSN)-3);
            itemPLS= (widget.listaNumerica.indexOf(valorPSN)-2);
            itemRESP=(widget.listaNumerica.indexOf(valorPSN)-1);
            itemPSN=(widget.listaNumerica.indexOf(valorPSN));
          });
          return  Container(
              width: (MediaQuery.of(context).size.width)/2,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Color(0xFFFFF7E2),
                  boxShadow: [
                    BoxShadow(
                        color:Colors.red,
                        blurRadius: 2
                    )
                  ]
              ),
              padding: EdgeInsets.all(5),
              margin: EdgeInsets.all(5),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 2, right: 2,bottom: 5),
                    padding: EdgeInsets.only(bottom: 0.5),
                    child: Text(
                      'Dräger Infinity Vista XL',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                          color: Colors.black),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 2, right: 2),
                    padding: EdgeInsets.only(bottom: 0.5),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Text(
                            'FC:',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 15,
                                color: Colors.black),
                          ),
                          alignment: Alignment.topLeft,
                        ),
                        Container(
                          alignment: Alignment.topRight,
                          child: Text(
                            '${widget.listaNumerica[itemFc]}',
                            style: TextStyle(
                                fontWeight: FontWeight.w300,
                                fontSize: 15,
                                color: Colors.black),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 2, right: 2),
                    padding: EdgeInsets.only(bottom: 0.5),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Text(
                            'Sp02:',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 15,
                                color: Colors.black),
                          ),
                          alignment: Alignment.topLeft,
                        ),
                        Container(
                          alignment: Alignment.topRight,
                          child: Text(
                            '${widget.listaNumerica[itemSpO2]}',
                            style: TextStyle(
                                fontWeight: FontWeight.w300,
                                fontSize: 15,
                                color: Colors.black),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 2, right: 2),
                    padding: EdgeInsets.only(bottom: 0.5),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Text(
                            'PLS:',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 15,
                                color: Colors.black),
                          ),
                          alignment: Alignment.topLeft,
                        ),
                        Container(
                          alignment: Alignment.topRight,
                          child: Text(
                            '${widget.listaNumerica[itemPLS]}',
                            style: TextStyle(
                                fontWeight: FontWeight.w300,
                                fontSize: 15,
                                color: Colors.black),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 2, right: 2),
                    padding: EdgeInsets.only(bottom: 0.5),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Text(
                            'RESP:',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 15,
                                color: Colors.black),
                          ),
                          alignment: Alignment.topLeft,
                        ),
                        Container(
                          alignment: Alignment.topRight,
                          child: Text(
                            '${widget.listaNumerica[itemRESP]}',
                            style: TextStyle(
                                fontWeight: FontWeight.w300,
                                fontSize: 15,
                                color: Colors.black),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 2, right: 2),
                    padding: EdgeInsets.only(bottom: 0.5),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Text(
                            'PSN:',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 15,
                                color: Colors.black),
                          ),
                          alignment: Alignment.topLeft,
                        ),
                        Container(
                          alignment: Alignment.topRight,
                          child: Text(
                            '${widget.listaNumerica[itemPSN]}',
                            style: TextStyle(
                                fontWeight: FontWeight.w300,
                                fontSize: 15,
                                color: Colors.black),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              )
          );

        }else if(widget.listaNumerica.length<=5){
          return Center(
            child: Container(
              child: Text('No se realizó el reconocimiento de la imagen, por favor intenta con otra'),
            ),
          );
        }else{
          return Center(
            child: Container(
              child: Text('No se realizó el reconocimiento de la imagen, por favor intenta con otra'),
            ),
          );
        }


      }else if(widget.listaDatos.indexOf('mindray')!=-1 &&
               widget.listaDatos.indexOf('iMEC12')!=-1 ){// si es un mindray iMEC12
        setState(() {
          itemFc = (widget.listaDatosLetras.indexOf('BCO')+1);
          itemSpO2 = (widget.listaDatosLetras.indexOf('Sp02')-2);
          itemRESP= (widget.listaDatosLetras.indexOf('Sp02')+2);
        });

        if(widget.listaDatosLetras.indexOf('Sp02')!=-1){
          return  Container(
              width: (MediaQuery.of(context).size.width)/2,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Color(0xFFFFF7E2),
                  boxShadow: [
                    BoxShadow(
                        color:Colors.red,
                        blurRadius: 2
                    )
                  ]
              ),
              padding: EdgeInsets.all(5),
              margin: EdgeInsets.all(5),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 2, right: 2,bottom: 5),
                    padding: EdgeInsets.only(bottom: 0.5),
                    child: Text(
                      'Mindray iMEC12',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                          color: Colors.black),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 2, right: 2),
                    padding: EdgeInsets.only(bottom: 0.5),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Text(
                            'FC:',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 15,
                                color: Colors.black),
                          ),
                          alignment: Alignment.topLeft,
                        ),
                        Container(
                          alignment: Alignment.topRight,
                          child: Text(
                            '${widget.listaDatosLetras[itemFc]}',
                            style: TextStyle(
                                fontWeight: FontWeight.w300,
                                fontSize: 15,
                                color: Colors.black),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 2, right: 2),
                    padding: EdgeInsets.only(bottom: 0.5),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Text(
                            'Sp02:',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 15,
                                color: Colors.black),
                          ),
                          alignment: Alignment.topLeft,
                        ),
                        Container(
                          alignment: Alignment.topRight,
                          child: Text(
                            '${widget.listaDatosLetras[itemSpO2]}',
                            style: TextStyle(
                                fontWeight: FontWeight.w300,
                                fontSize: 15,
                                color: Colors.black),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 2, right: 2),
                    padding: EdgeInsets.only(bottom: 0.5),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Text(
                            'RESP:',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 15,
                                color: Colors.black),
                          ),
                          alignment: Alignment.topLeft,
                        ),
                        Container(
                          alignment: Alignment.topRight,
                          child: Text(
                            '${widget.listaDatosLetras[itemRESP]}',
                            style: TextStyle(
                                fontWeight: FontWeight.w300,
                                fontSize: 15,
                                color: Colors.black),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              )
          );
        }else{
          return Center(
            child: Container(
              child: Text('No se realizó el reconocimiento de la imagen, por favor intenta con otra'),
            ),
          );
        }


      }else if(widget.listaDatos.indexOf('mindray')!=-1 &&
               widget.listaDatos.indexOf('iMEC10')!=-1 ){// si es un mindray iMEC10

        setState(() {
          itemFc = (widget.listaDatosLetras.indexOf('Sp02')-1);
          itemSpO2 = (widget.listaDatosLetras.indexOf('Sp02')+1);
          itemRESP= (widget.listaDatosLetras.indexOf('men')-4);
        });
        if(widget.listaDatosLetras.indexOf('Sp02')!=-1 && widget.listaDatosLetras.indexOf('men')!=-1 ){
          return  Container(
              width: (MediaQuery.of(context).size.width)/2,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Color(0xFFFFF7E2),
                  boxShadow: [
                    BoxShadow(
                        color:Colors.red,
                        blurRadius: 2
                    )
                  ]
              ),
              padding: EdgeInsets.all(5),
              margin: EdgeInsets.all(5),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 2, right: 2,bottom: 5),
                    padding: EdgeInsets.only(bottom: 0.5),
                    child: Text(
                      'Mindray iMEC10',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                          color: Colors.black),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 2, right: 2),
                    padding: EdgeInsets.only(bottom: 0.5),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Text(
                            'FC:',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 15,
                                color: Colors.black),
                          ),
                          alignment: Alignment.topLeft,
                        ),
                        Container(
                          alignment: Alignment.topRight,
                          child: Text(
                            '${widget.listaDatosLetras[itemFc]}',
                            style: TextStyle(
                                fontWeight: FontWeight.w300,
                                fontSize: 15,
                                color: Colors.black),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 2, right: 2),
                    padding: EdgeInsets.only(bottom: 0.5),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Text(
                            'Sp02:',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 15,
                                color: Colors.black),
                          ),
                          alignment: Alignment.topLeft,
                        ),
                        Container(
                          alignment: Alignment.topRight,
                          child: Text(
                            '${widget.listaDatosLetras[itemSpO2].toString().substring(0,2)}',
                            style: TextStyle(
                                fontWeight: FontWeight.w300,
                                fontSize: 15,
                                color: Colors.black),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 2, right: 2),
                    padding: EdgeInsets.only(bottom: 0.5),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Text(
                            'RESP:',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 15,
                                color: Colors.black),
                          ),
                          alignment: Alignment.topLeft,
                        ),
                        Container(
                          alignment: Alignment.topRight,
                          child: Text(
                            '${widget.listaDatosLetras[itemRESP]}',
                            style: TextStyle(
                                fontWeight: FontWeight.w300,
                                fontSize: 15,
                                color: Colors.black),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              )
          );
        }else{
          return Center(
            child: Container(
              child: Text('No se realizó el reconocimiento de la imagen, por favor intenta con otra'),
            ),
          );
        }

      }else if(widget.listaDatos.indexOf('mindray')!=-1 &&
          widget.listaDatos.indexOf('MEC-1200')!=-1 ){// si es un mindray iPM-9800

        try{
          int valorfc =int.parse(widget.listaDatosLetras[widget.listaDatosLetras.indexOf('ECS')+1]);
          setState(() {
            valorFC=valorfc;
            FC=true;
          });
        }catch(e){
          try{
            int valorfc =int.parse(widget.listaDatosLetras[widget.listaDatosLetras.indexOf('EC6')+1]);
            setState(() {
              valorFC=valorfc;
              FC=true;
            });
          }catch(e){
            try{
              int valorfc =int.parse(widget.listaDatosLetras[widget.listaDatosLetras.indexOf('cUPs')-1]);
              setState(() {
                valorFC=valorfc;
                FC=true;
              });
            }catch(e){
              try{
                int valorfc =int.parse(widget.listaDatosLetras[widget.listaDatosLetras.indexOf('ECG')+1]);
                setState(() {
                  valorFC=valorfc;
                  FC=true;
                });
              }catch(e){
                setState(() {
                  FC=false;
                });
              }
            }
          }
        }

        if(FC){
          setState(() {
            itemFc = (widget.listaNumerica.indexOf(valorFC));
            itemPNI= (widget.listaNumerica.indexOf(valorFC)+1);
            itemSpO2 = (widget.listaNumerica.length-1);
          });
          return  Container(
              width: (MediaQuery.of(context).size.width)/2,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Color(0xFFFFF7E2),
                  boxShadow: [
                    BoxShadow(
                        color:Colors.red,
                        blurRadius: 2
                    )
                  ]
              ),
              padding: EdgeInsets.all(5),
              margin: EdgeInsets.all(5),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 2, right: 2,bottom: 5),
                    padding: EdgeInsets.only(bottom: 0.5),
                    child: Text(
                      'Mindray MEC-1200',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                          color: Colors.black),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 2, right: 2),
                    padding: EdgeInsets.only(bottom: 0.5),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Text(
                            'FC:',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 15,
                                color: Colors.black),
                          ),
                          alignment: Alignment.topLeft,
                        ),
                        Container(
                          alignment: Alignment.topRight,
                          child: Text(
                            '${widget.listaNumerica[itemFc]}',
                            style: TextStyle(
                                fontWeight: FontWeight.w300,
                                fontSize: 15,
                                color: Colors.black),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 2, right: 2),
                    padding: EdgeInsets.only(bottom: 0.5),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Text(
                            'PNI:',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 15,
                                color: Colors.black),
                          ),
                          alignment: Alignment.topLeft,
                        ),
                        Container(
                          alignment: Alignment.topRight,
                          child: Text(
                            '${widget.listaNumerica[itemPNI]}',
                            style: TextStyle(
                                fontWeight: FontWeight.w300,
                                fontSize: 15,
                                color: Colors.black),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 2, right: 2),
                    padding: EdgeInsets.only(bottom: 0.5),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Text(
                            'Sp02:',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 15,
                                color: Colors.black),
                          ),
                          alignment: Alignment.topLeft,
                        ),
                        Container(
                          alignment: Alignment.topRight,
                          child: Text(
                            '${widget.listaNumerica[itemSpO2]}',
                            style: TextStyle(
                                fontWeight: FontWeight.w300,
                                fontSize: 15,
                                color: Colors.black),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              )
          );
        }else{
          return Center(
            child: Container(
              child: Text('No se realizó el reconocimiento de la imagen, por favor intenta con otra'),
            ),
          );
        }


      }else if(DatosMonitor.isNotEmpty){//si no esta parametrizado y se va a buscar el parametro en la base de datos
        print('funciona');
        print(widget.listaDatosLetras[int.parse(DatosMonitor[0]['operacionECG'])]);
        print(DatosMonitor[0]['identificacionM1']);
        //if(DatosMonitor[0]['identificacionM1'])
        if(widget.listaDatos.indexOf(DatosMonitor[0]['identificacionM1'])!=-1 &&
            widget.listaDatos.indexOf(DatosMonitor[0]['identificacionM2'])!=-1 &&
            widget.listaDatos.indexOf(DatosMonitor[0]['identificacionM3'])!=-1 ){

          setState(() {
            itemFc = int.parse(DatosMonitor[0]['operacionECG']);
            itemSpO2 = int.parse(DatosMonitor[0]['operacionSP02']);
            itemRESP= int.parse(DatosMonitor[0]['operacionRESP']);
          });
          return  Container(
              width: (MediaQuery.of(context).size.width)/2,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Color(0xFFFFF7E2),
                  boxShadow: [
                    BoxShadow(
                        color:Colors.red,
                        blurRadius: 2
                    )
                  ]
              ),
              padding: EdgeInsets.all(5),
              margin: EdgeInsets.all(5),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 2, right: 2,bottom: 5),
                    padding: EdgeInsets.only(bottom: 0.5),
                    child: Text(
                      'Monitor ${DatosMonitor[0]['identificacionM1']} ${DatosMonitor[0]['identificacionM2']} ${DatosMonitor[0]['identificacionM3']}',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                          color: Colors.black),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 2, right: 2),
                    padding: EdgeInsets.only(bottom: 0.5),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Text(
                            'FC:',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 15,
                                color: Colors.black),
                          ),
                          alignment: Alignment.topLeft,
                        ),
                        Container(
                          alignment: Alignment.topRight,
                          child: Text(
                            '${widget.listaDatosLetras[itemFc]}',
                            style: TextStyle(
                                fontWeight: FontWeight.w300,
                                fontSize: 15,
                                color: Colors.black),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 2, right: 2),
                    padding: EdgeInsets.only(bottom: 0.5),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Text(
                            'Sp02:',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 15,
                                color: Colors.black),
                          ),
                          alignment: Alignment.topLeft,
                        ),
                        Container(
                          alignment: Alignment.topRight,
                          child: Text(
                            '${widget.listaDatosLetras[itemSpO2].toString().substring(0,2)}',
                            style: TextStyle(
                                fontWeight: FontWeight.w300,
                                fontSize: 15,
                                color: Colors.black),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 2, right: 2),
                    padding: EdgeInsets.only(bottom: 0.5),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Text(
                            'RESP:',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 15,
                                color: Colors.black),
                          ),
                          alignment: Alignment.topLeft,
                        ),
                        Container(
                          alignment: Alignment.topRight,
                          child: Text(
                            '${widget.listaDatosLetras[itemRESP]}',
                            style: TextStyle(
                                fontWeight: FontWeight.w300,
                                fontSize: 15,
                                color: Colors.black),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              )
          );
        }else{
          return Container(
            child: Text('en proceso'),
          );
        }

      }else{
        return Center(
          child: Container(
            child: Column(
              children: [
                Text('Falta registrar monitor'),
                ButtonApp(
                    buttonText: 'Registrar',
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> RegistrarMonitorScreen(
                          listaNumerica: widget.listaNumerica,
                          listaDatosLetras: widget.listaDatosLetras,
                          listaDatos: widget.listaDatos,
                          imagenRecortada: widget.imagenRecortada)
                      ));
                    },
                    color1: colorBoton,
                    color2: colorBoton,
                    iconData: Icons.app_registration
                ),
              ],
            ),
          ),
        );
      }

    }else{
      return Container();
    }





  }
}
