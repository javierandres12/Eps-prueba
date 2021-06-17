
import 'package:eps/ui/screen/detail_screen.dart';
import 'package:eps/ui/screen/detail_screen_bomba.dart';
import 'package:eps/ui/screen/login_page_barras.dart';
import 'package:eps/ui/widget/button_sign.dart';
import 'package:flutter/material.dart';


class PrincipalScreen extends StatefulWidget{
  String token;
  List listItem = [];
  List listID = [];

  PrincipalScreen({
    @required this.token,
    @required this.listID,
    @required this.listItem
  });

  @override
  State<StatefulWidget> createState() {
    return _PrincipalScreen();

  }
}



class _PrincipalScreen extends State<PrincipalScreen>{
  int colorAppbar=0xFF3B4C71;//0xFF3B4C71
  int colorFront=0xFF3B4C71;//0xFF93D3CB
  final _scaffoldkey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      key: _scaffoldkey,
      appBar: AppBar(
        backgroundColor: Color(colorAppbar),
        iconTheme: IconThemeData(color: Colors.white),
        title: Text('Grupo Ospedale',style:  TextStyle(fontSize: 20,fontWeight: FontWeight.w500, color: Colors.white),),
        //centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.only(top: 15),
        child: Column(
          children: [
            ButtonSign(
                buttonText: 'Leer monitor',
                onPressed: (){
                  print('se presiono Machine Learning');
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> DetailScreen()));
                },
                color1: colorFront,
                color2: colorFront,
                iconData: Icons.image_aspect_ratio
            ),
            ButtonSign(
                buttonText: 'Leer bomba Inf.',
                onPressed: (){
                  print('se presiono Machine Learning');
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> DetailScreenBomba()));
                },
                color1: colorFront,
                color2: colorFront,
                iconData: Icons.image_aspect_ratio
            ),
          ],
        ),
      ),

      drawer:Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              child: Container(
                child: Icon(Icons.fact_check_outlined, size: 100,color: Color(colorFront),),
                height: 250,
                width: screenWidth,
              ),
            ),
            ListTile(
              title: Text('Configuración'),
              onTap: (){
                _scaffoldkey.currentState
                    .showSnackBar(SnackBar(content: Text('Proceso en construcción')));
              },
              leading: Icon(Icons.settings),
            ),
            ListTile(
              title: Text('Cerrar Sesión'),
              onTap: (){
                _scaffoldkey.currentState
                    .showSnackBar(SnackBar(content: Text('Saliendo de Ams')));
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => LoginPageBarras()));
              },
              leading: Icon(Icons.exit_to_app),
            ),
          ],
        ),
      ),
    );
  }

}