
import 'package:eps/bloc/bloc_user.dart';
import 'package:eps/ui/screen/agregar_paciente_screen.dart';
import 'package:eps/ui/screen/register_page.dart';
import 'package:eps/ui/widget/button_app.dart';
import 'package:eps/ui/widget/list_view_pacientes.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';


class ListaPacienteScreen extends StatefulWidget{


  @override
  State<StatefulWidget> createState() {
    return _ListaPacienteScreen();

  }
}

class _ListaPacienteScreen extends State<ListaPacienteScreen>{
  UserBloc userBloc;

  @override
  Widget build(BuildContext context) {
    userBloc = BlocProvider.of<UserBloc>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text('Lista de pacientes',style:  TextStyle(fontSize: 20,fontWeight: FontWeight.w500, color: Colors.white),),
        leading:  IconButton(icon: Icon(Icons.arrow_back,color: Colors.white,), onPressed: (){
          Navigator.pop(context);
        }),
      ),
      body: ListView(
        children: [
         ListViewPacientes()
        ],
      ),
    );
  }
}