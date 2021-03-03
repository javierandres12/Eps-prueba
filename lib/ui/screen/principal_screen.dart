
import 'package:eps/bloc/bloc_user.dart';
import 'package:eps/ui/screen/agregar_paciente_screen.dart';
import 'package:eps/ui/screen/lista_paciente_screen.dart';
import 'package:eps/ui/screen/register_page.dart';
import 'package:eps/ui/widget/button_app.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';


class PrincipalScreen extends StatefulWidget{


  @override
  State<StatefulWidget> createState() {
     return _PrincipalScreen();

  }
}

class _PrincipalScreen extends State<PrincipalScreen>{


  UserBloc userBloc;

  @override
  Widget build(BuildContext context) {
    userBloc = BlocProvider.of<UserBloc>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text('Eps Grupo G-8',style:  TextStyle(fontSize: 20,fontWeight: FontWeight.w500, color: Colors.white),),
        actions: [
          IconButton(icon: Icon(Icons.exit_to_app,color: Colors.white,), onPressed: (){
            userBloc.logOut();
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> RegisterPage()));
          })
        ],
      ),
      body: Column(
        children: [
          ButtonApp(
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
        ],
      ),
    );
  }
}