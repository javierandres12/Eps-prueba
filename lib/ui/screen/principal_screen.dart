

import 'package:barcode_scan/barcode_scan.dart';
import 'package:eps/bloc/bloc_user.dart';
import 'package:eps/ui/screen/agregar_paciente_screen.dart';
import 'package:eps/ui/screen/detail_screen.dart';
import 'package:eps/ui/screen/lista_paciente_screen.dart';
import 'package:eps/ui/screen/mlkit_screen.dart';
import 'package:eps/ui/screen/register_page.dart';
import 'package:eps/ui/widget/button_app.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';



class PrincipalScreen extends StatefulWidget{


  @override
  State<StatefulWidget> createState() {
     return _PrincipalScreen();

  }
}



class _PrincipalScreen extends State<PrincipalScreen>{
  UserBloc userBloc;
  ScanResult _scanResult;


  @override
  Widget build(BuildContext context) {
    userBloc = BlocProvider.of<UserBloc>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text('Grupo Ospedale',style:  TextStyle(fontSize: 20,fontWeight: FontWeight.w500, color: Colors.white),),
        //centerTitle: true,
        actions: [
          IconButton(icon: Icon(Icons.exit_to_app,color: Colors.white,), onPressed: (){
            userBloc.logOut();
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> RegisterPage()));
          })
        ],
      ),
      body: Container(
        margin: EdgeInsets.only(top: 15),
        child: Column(
          children: [
            /*ButtonApp(
              buttonText: 'Agregar Paciente',
              onPressed: (){
                print('se presiono agregar paciente');
                Navigator.push(context, MaterialPageRoute(builder: (context)=> AgregarPacienteScreen()));
              },
              color1: 0xFF285B82,
              color2: 0xFF285B82,
              iconData: Icons.add
          ),
          ButtonApp(
              buttonText: 'Lista de Pacientes',
              onPressed: (){
                print('se presiono Lista de Pacientes');
                Navigator.push(context, MaterialPageRoute(builder: (context)=> ListaPacienteScreen()));
              },
              color1: 0xFF285B82,
              color2: 0xFF285B82,
              iconData: Icons.list
          ),
          ButtonApp(
              buttonText: 'Codigo QR',
              onPressed: (){
                print('Se presiono codigo QR');
                _scanCode();
              },
              color1: 0xFF285B82,
              color2: 0xFF285B82,
              iconData: Icons.qr_code
          ),*/
            ButtonApp(
                buttonText: 'Leer monitor',
                onPressed: (){
                  print('se presiono Machine Learning');
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> DetailScreen()));
                },
                color1: 0xFF285B82,
                color2: 0xFF285B82,
                iconData: Icons.image_aspect_ratio
            ),
          ],
        ),
      )
    );
  }
  Future<void> _scanCode() async {
    var result = await BarcodeScanner.scan();
    setState(() {
      _scanResult = result;
    });
    if(result.format.name.isNotEmpty){
      showDialog(
          context: context,
          builder: (BuildContext context){
            return AlertDialog(
              title: Text('Lector de codigos QR y de Barras'),
              content: Container(
                width: 400,
                height: 400,
                child: Column(
                  children: [
                    Center(
                      child: Column(
                        children: [
                          Text(_scanResult.rawContent),
                          Text(_scanResult.format.toString())
                        ],
                      ),
                    )
                  ],
                ),
              ),
              actions: [
                TextButton(onPressed: (){Navigator.pop(context);}, child: Text('Cancelar')),
                TextButton(onPressed: (){Navigator.pop(context);}, child: Text('Aceptar')),
              ],

            );
          }
      );
    }
  }


}