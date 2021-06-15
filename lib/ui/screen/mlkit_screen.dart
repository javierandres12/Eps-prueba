
import 'package:eps/bloc/bloc_user.dart';
import 'package:eps/model/paciente.dart';
import 'package:eps/ui/screen/detail_screen.dart';
import 'package:eps/ui/widget/button_app.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';


class MlKitScreen extends StatefulWidget{



  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MlKitScreen();
  }
}

class _MlKitScreen extends State<MlKitScreen>{

  List<String> itemsList = [
    'Text Scanner',
    'Barcode Scanner',
    'Label Scanner',
    'Face detection'
  ];


  UserBloc userBloc;
  final _scaffoldkey = GlobalKey<ScaffoldState>();
  // variable para el key que permite acceder al formulario actual del codigo
  final _formkey =  GlobalKey<FormState>();
  // creamos las variables para guardar los datos

  int color1= 0xFF2EBFF7;


  @override
  Widget build(BuildContext context) {
    //variables para el largo y ancho de la pantalla
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidht = MediaQuery.of(context).size.width;
    userBloc = BlocProvider.of<UserBloc>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text('ML Kit Firebase',style: TextStyle(color: Colors.white),),
        leading:  IconButton(icon: Icon(Icons.arrow_back,color: Colors.white,), onPressed: (){
          Navigator.pop(context);
        }),
      ),
      body: ListView.builder(
        itemCount: itemsList.length,
          itemBuilder: (context, index){
          
          return Card(
            child: ListTile(
              title: Text(itemsList[index]),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> DetailScreen(),
                  settings: RouteSettings(
                    arguments: itemsList[index],
                  ),
                ));
              },
            ),
          );
          
          }
      ),

    );




  }
}