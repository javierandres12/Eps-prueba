

import 'package:eps/bloc/bloc_user.dart';
import 'package:eps/model/user.dart';
import 'package:eps/ui/screen/principal_screen.dart';
import 'package:eps/ui/widget/button_app.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class RegisterPage extends StatefulWidget{



  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _RegisterPage();
  }
}

class _RegisterPage extends State<RegisterPage>{


  UserBloc userBloc;
  int color1= 0xFF2EBFF7;


  @override
  Widget build(BuildContext context) {
    //variables para el largo y ancho de la pantalla

    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidht = MediaQuery.of(context).size.width;
    userBloc = BlocProvider.of<UserBloc>(context);

    return StreamBuilder(
        stream: userBloc.authStatus,
        builder:(BuildContext context, AsyncSnapshot snapshot){
          if(!snapshot.hasData || snapshot.hasError){
            return Scaffold(
              body: new Container(
                child: Form(
                    child: Container(
                      margin: EdgeInsets.only(left: 2, right: 2,bottom: 2),
                      child: ListView(
                        children: [
                          Container(
                            child: Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage("icons/chat.png"),
                                      )
                                  ),
                                  height: 250,
                                  width: screenWidht,
                                ),
                              ],
                            ),
                            height: 300,
                            width: screenWidht,
                            padding: EdgeInsets.only(top: 5),
                          ),
                          Container(
                            alignment: Alignment.bottomCenter,
                            padding: EdgeInsets.only(bottom: 5),
                            child:  Text('Ingresa a Eps con tu cuenta', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),),
                          ),
                          Padding(padding: EdgeInsets.only(top: 10)),
                          ButtonApp(
                              buttonText: 'Ingresa con Google',
                              onPressed: (){
                                userBloc.signIn().then((FirebaseUser user){
                                  userBloc.updateUser(User(
                                      uid: user.uid,
                                      name: user.displayName,
                                      email: user.email
                                  ));
                                  print('se creo el usuario');
                                  return PrincipalScreen();
                                });
                              },
                              color1: 0xFFEA0909,
                              color2: 0xFFff0000,
                              iconData: MdiIcons.google
                          ),
                        ],
                      ),
                    )

                ),

              ),
            );
          }else{
            return PrincipalScreen();
          }
        });
  }
}