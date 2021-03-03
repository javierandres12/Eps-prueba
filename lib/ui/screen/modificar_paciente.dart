
import 'package:eps/bloc/bloc_user.dart';
import 'package:eps/model/paciente.dart';
import 'package:eps/ui/widget/button_app.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';


class ModificarPacienteScreen extends StatefulWidget{
  String id;
  String name;

  ModificarPacienteScreen({Key key,
    @required this.id,
    @required this.name
  });



  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ModificarPacienteScreen();
  }
}

class _ModificarPacienteScreen extends State<ModificarPacienteScreen>{

  UserBloc userBloc;
  final _scaffoldkey = GlobalKey<ScaffoldState>();
  // variable para el key que permite acceder al formulario actual del codigo
  final _formkey =  GlobalKey<FormState>();
  // creamos las variables para guardar los datos

  int color1= 0xFF2EBFF7;

  String _nombre;
  String _id;
  String _genero;
  String _edad;
  String _numero;
  String _eps;
  String _rol;


  bool _isSend = false;

  Future _enviar() async{

    if(_isSend)return;
    setState(() {
      _isSend = true;
    });

    final form = _formkey.currentState;

    if(!form.validate()){
      _scaffoldkey.currentState.hideCurrentSnackBar();
      setState(() {
        _isSend= false;
      });
      return;
    }
    form.save();
    userBloc.currentUser.then((FirebaseUser user){
      if(_nombre!=null && _id!=null && _numero!=null && _edad!=null && _genero!=null && _eps!=null &&_rol!=null ){
        print(_nombre);
        userBloc.currentUser.then((FirebaseUser user){
          userBloc.updatePaciente(Paciente(
              id: _id,
              nombre: _nombre,
              genero: _genero,
              edad: _edad,
              telefono: _numero,
              eps: _eps,
              rol: _rol));

        });
        _scaffoldkey.currentState.showSnackBar(SnackBar(content: Text('Modificando Paciente'),duration: Duration(seconds: 1),));
        _formkey.currentState.reset();
        _isSend= false;
        Navigator.pop(context);
      }else{
        _scaffoldkey.currentState.showSnackBar(SnackBar(content: Text('No se registro el paciente'),duration: Duration(seconds: 1),));
      }
    });

  }


  @override
  Widget build(BuildContext context) {
    //variables para el largo y ancho de la pantalla

    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidht = MediaQuery.of(context).size.width;
    userBloc = BlocProvider.of<UserBloc>(context);


    return Scaffold(
      appBar: AppBar(
        title: Text('Modificar Paciente', style: TextStyle(color: Colors.white,fontSize: 20),),
        leading: IconButton(icon: Icon(Icons.arrow_back,color: Colors.white,size: 20,), onPressed: (){Navigator.pop(context);}),
        backgroundColor: Colors.indigo,
      ),
      key: _scaffoldkey,
      body: new Container(
        child: Form(
            key: _formkey,
            child: Container(
              margin: EdgeInsets.only(left: 2, right: 2,bottom: 2),
              child: ListView(
                children: [
                  Container(
                    child: Text('Para eliminar el paciente "${widget.name}" presiona el siguiente botón', style: TextStyle(fontWeight: FontWeight.w500,fontSize: 20),),
                    margin: EdgeInsets.all(4),
                  ),
                  ButtonApp(
                      buttonText: 'Eliminar Paciente',
                      onPressed: (){
                        print('Se presiono eliminar paciente');
                        userBloc.deletePaciente(widget.id);
                        _scaffoldkey.currentState.showSnackBar(SnackBar(content: Text('Se elimino el paciente: ${widget.name}'),duration: Duration(seconds: 1),));

                      },
                      color1: 0xFF2E2183,
                      color2: 0xFF2E2183,
                      iconData: Icons.send
                  ),
                  Container(
                    child: Text('Para modificar Ingresa todos los datos del paciente, la identificación del paciente es:"${widget.id}" ', style: TextStyle(fontWeight: FontWeight.w500,fontSize: 20),),
                    margin: EdgeInsets.all(4),
                  ),
                  TextFormField(
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      labelText: 'Nombre del paciente',
                    ),
                    validator: (val){
                      if(val.isEmpty){
                        return 'Por favor ingrese el nombre del paciente';
                      }else{
                        return null;
                      }
                    },
                    onSaved: (val){
                      setState(() {
                        _nombre=val;
                      });
                    },
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Identificacion del paciente',
                    ),
                    validator: (val){
                      if(val.isEmpty){
                        return 'Por favor ingrese la identificación del paciente';
                      }else{
                        return null;
                      }
                    },
                    onSaved: (val){
                      setState(() {
                        _id=val;
                      });
                    },
                  ),
                  TextFormField(
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      labelText: 'Genero del paciente ingrese M o F',
                    ),
                    validator: (val){
                      if(val.isEmpty){
                        return 'Por favor ingrese el genero del paciente M o F';
                      }else{
                        return null;
                      }
                    },
                    onSaved: (val){
                      setState(() {
                        _genero=val;
                      });
                    },
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Edad del paciente',
                    ),
                    validator: (val){
                      if(val.isEmpty){
                        return 'Por favor ingrese la edad del paciente';
                      }else{
                        return null;
                      }
                    },
                    onSaved: (val){
                      setState(() {
                        _edad=val;
                      });
                    },
                  ),
                  TextFormField(
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      labelText: 'Telefono del paciente',
                    ),
                    validator: (val){
                      if(val.isEmpty){
                        return 'Por favor ingrese el numero del paciente';
                      }else{
                        return null;
                      }
                    },
                    onSaved: (val){
                      setState(() {
                        _numero=val;
                      });
                    },
                  ),
                  TextFormField(
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      labelText: 'Eps del paciente, ejemplo: Sanitas',
                    ),
                    validator: (val){
                      if(val.isEmpty){
                        return 'Por favor ingrese la Eps del paciente';
                      }else{
                        return null;
                      }
                    },
                    onSaved: (val){
                      setState(() {
                        _eps=val;
                      });
                    },
                  ),
                  TextFormField(
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      labelText: 'Rol del paciente, ejemplo: "Paciente"',
                    ),
                    validator: (val){
                      if(val.isEmpty){
                        return 'Por favor ingrese el rol del paciente';
                      }else{
                        return null;
                      }
                    },
                    onSaved: (val){
                      setState(() {
                        _rol=val;
                      });
                    },
                  ),
                  Padding(padding: EdgeInsets.all(5)),
                  ButtonApp(
                      buttonText: 'Modificar Paciente',
                      onPressed: (){
                        print('Se presiono registrar paciente');
                        _enviar();
                      },
                      color1: 0xFF2E2183,
                      color2: 0xFF2E2183,
                      iconData: Icons.send
                  )



                ],
              ),
            )

        ),

      ),
    );
  }
}