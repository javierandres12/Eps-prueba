
import 'package:eps/bloc/bloc_user.dart';
import 'package:eps/model/paciente.dart';
import 'package:eps/ui/screen/agregar_paciente_screen.dart';
import 'package:eps/ui/screen/modificar_paciente.dart';
import 'package:eps/ui/widget/card_paciente.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';

class ListViewPacientes extends StatefulWidget{


  @override
  State<StatefulWidget> createState() {
    return _ListViewPacientes();
  }
}

class _ListViewPacientes extends State<ListViewPacientes> {
  UserBloc userBloc;

  @override
  Widget build(BuildContext context) {
    userBloc = BlocProvider.of<UserBloc>(context);

    return StreamBuilder(
        stream: userBloc.pacienteStream,
        builder: (context, AsyncSnapshot snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.active:
              return View(
                  userBloc.buildPaciete(snapshot.data.documents));
            case ConnectionState.done:
              return View(
                  userBloc.buildPaciete(snapshot.data.documents));
            case ConnectionState.waiting:
              return CircularProgressIndicator();
            case ConnectionState.none:
              return CircularProgressIndicator();
            default:
              return View(
                  userBloc.buildPaciete(snapshot.data.documents));
          }
        }
    );

  }
  Widget View(List<Paciente> pacientes){
    return Column(
      children: pacientes.map((paciente){
        return CardPaciente(
            nombrePaciente: paciente.nombre,
            edadPaciente: paciente.edad.toString(),
            epsPaciente: paciente.eps,
            generoPaciente: paciente.genero,
            rolPaciente: paciente.rol,
            telefonoPaciente: paciente.telefono,
            idPaciente: paciente.id,
            onPressed: (){
              print('Se presiono paciente para modiicar');
              Navigator.push(context, MaterialPageRoute(builder: (context)=> ModificarPacienteScreen(id: paciente.id,name: paciente.nombre,)));
            })
        ;
      }).toList(),
    );
  }

}