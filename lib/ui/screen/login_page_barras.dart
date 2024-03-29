import 'dart:convert';
import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:eps/ui/screen/login_page_email.dart';
import 'package:eps/ui/screen/pabellon_screen.dart';
import 'package:eps/ui/screen/principal_screen.dart';
import 'package:eps/ui/widget/button_app.dart';
import 'package:eps/ui/widget/button_sign.dart';
import 'package:eps/ui/widget/gradient.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LoginPageBarras extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _LoginPageBarras();
  }
}

class _LoginPageBarras extends State<LoginPageBarras> {
  //int colorFront=0xFF93D3CB;//0xFF151F43
  int colorFront = 0xFF3B4C71; //
  int colorSnackbar = 0xFF93D3CB;
  ScanResult scanResult;
  //ScanResult scanResult;
  String idScaner;
  String valueChoose;
  Map<String, dynamic> jsonLogin;

  Map<String, dynamic> jsonPabellon;
  List listItemPabe = [];
  List listIDPabe = [];

  List listItem = [];
  List listID = [];
  int item;
  //String Dominio = "https://dev-ams.portubien.co";//String Dominio = "http://190.14.240.149/MonitorAPI";
  String Dominio = "http://190.14.240.149/MonitorAPI";

  final _scaffoldkey = GlobalKey<ScaffoldState>();

  Future _enviar() async {
    if (valueChoose != null) {
      setState(() {
        item = listID[listItem.indexOf(valueChoose)];
      });
      print(item);
      //scaner
      var result = await BarcodeScanner.scan(
          options: ScanOptions(
              android:
                  AndroidOptions(useAutoFocus: true, aspectTolerance: 100.0)));
      //var result = await BarcodeScanner.scan(options: ScanOptions(android: AndroidOptions(useAutoFocus: true, aspectTolerance: 0.00)));
      setState(() {
        scanResult = result;
      });
      print('....${scanResult.rawContent}');
      if (result.format.name.isNotEmpty && !(result.format.name == "unknown")) {
        _scaffoldkey.currentState.showSnackBar(SnackBar(
          content: Container(
              height: 70,
              child: Column(
                children: [
                  CircularProgressIndicator(),
                  Padding(padding: EdgeInsets.all(2)),
                  Text('Verificando Datos')
                ],
              )),
          backgroundColor: Color(colorSnackbar),
          duration: Duration(minutes: 10),
        ));
        setState(() {
          idScaner = result.rawContent.toString();
        });
        print(idScaner);

        //Uri url = Uri.parse('${Dominio}/api/login');
        Uri url = Uri.parse('${Dominio}/api/UsBombas?cedula=${idScaner}&idclinica=${item}');
        Map data = {"barras": idScaner, "id_clinica": item};

        final response = await http.get(url,
        );
        setState(() {
          jsonLogin = json.decode(response.body);
        });
        print(
            'barras: ${idScaner},id_clinica: ${item}, status: ${response.statusCode}');
        print(jsonLogin);

        if (response.statusCode == 200) {
          _scaffoldkey.currentState.removeCurrentSnackBar();
          _scaffoldkey.currentState.showSnackBar(SnackBar(
              content: Text('Bienvenido'),
              duration: Duration(seconds: 1),
              backgroundColor: Color(colorSnackbar)));

          /*

          //Uri url1 = Uri.https(Dominio, "api/getListPabellones");
          Uri url1 = Uri.parse('${Dominio}/api/getListPabellones');
          //Uri url1 = Uri.parse('http://app.portubien.co/ams/api/getListPabellones');
          //Uri url1 = Uri.http('http://app.portubien.co','ams/api/getListPabellones');
          final responsePabellon = await http.get(url1, headers: {
            "Content-Type": "application/x-www-form-urlencoded",
            "Authorization": 'Bearer ${jsonLogin['token']}',
          });
          //print('Token: Bearer ${jsonLogin['token']}');
          //print(json.decode(responsePabellon.body));
          setState(() {
            jsonPabellon = json.decode(responsePabellon.body);
          });
          print('pabellones ${jsonPabellon}');
          var lstPabe = new List();
          var lstItePabe = new List();
          for (int i = 0; i < jsonPabellon['data'].length; i++) {
            lstPabe.add(jsonPabellon['data'][i]['MPNomP']);
            lstItePabe.add(jsonPabellon['data'][i]['MPCodP']);
            if (lstPabe.length == jsonPabellon['data'].length) {
              listIDPabe = lstItePabe;
              listItemPabe = lstPabe;
            }
          }
          */

          //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> PrincipalScreen(token: 'Bearer ${jsonLogin['token']}'.toString(),listID: listIDPabe,listItem: listItemPabe,)));
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => PabellonScreen(
                        token: 'Bearer ${jsonLogin['token']}'.toString(),
                        listID: listIDPabe,
                        listItem: listItemPabe,
                      )));
        } else {
          _scaffoldkey.currentState.removeCurrentSnackBar();
          _scaffoldkey.currentState.showSnackBar(SnackBar(
            content: Text(
              'Usuario no registrado, por favor intentelo de nuevo',
            ),
            duration: Duration(seconds: 1),
            backgroundColor: Color(colorSnackbar),
          ));
        }
      } else {
        _scaffoldkey.currentState.removeCurrentSnackBar();
        _scaffoldkey.currentState.showSnackBar(SnackBar(
            content: Text('Por favor vuelva a escanear el codigo de barras'),
            duration: Duration(milliseconds: 350),
            backgroundColor: Color(colorSnackbar)));
      }
    } else {
      _scaffoldkey.currentState.removeCurrentSnackBar();
      _scaffoldkey.currentState.showSnackBar(SnackBar(
          content: Text('Por favor elige la clinica'),
          duration: Duration(seconds: 1),
          backgroundColor: Color(colorSnackbar)));
    }
  }

  Future obtenerClinicas() async {
    //Uri url = Uri.https(Dominio, "api/getListClinicas");
    Uri url = Uri.parse('${Dominio}/api/Clinica');
    //Uri url = new Uri.https('app.portubien.co','/ams/api/getListClinicas');
    final response = await http.get(url);
    print(json.decode(response.body));
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    double screenwidht = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    // TODO: implement build
    return Scaffold(
      key: _scaffoldkey,
      body: Stack(
        children: [
          GradientBack(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Container(
                  margin: EdgeInsets.only(top: 40, left: 20, right: 20),
                  width: screenwidht - 20,
                  height: screenHeight - 250,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white),
                  child: FutureBuilder(
                    future: obtenerClinicas(),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (!snapshot.hasData || snapshot.hasError) {
                        return Center(
                            child: Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                padding: EdgeInsets.all(5),
                                width: 60,
                                height: 60,
                                child: CircularProgressIndicator(),
                              ),
                              Text('Sincronizando base de datos'),
                            ],
                          ),
                        ));
                      } else {
                        var lst = new List();
                        var lstIte = new List();
                        for (int i = 0; i < snapshot.data.length; i++) {
                          lstIte.add(snapshot.data[i]['cli_id']);
                          lst.add(
                              snapshot.data[i]['cli_nombre_clinica']);
                          if (lst.length == snapshot.data.length) {
                            listItem = lst;
                            listID = lstIte;
                          }
                        }
                        return Container(
                          padding: EdgeInsets.only(top: 30),
                          alignment: Alignment.center,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                child: Icon(
                                  Icons.fact_check_outlined,
                                  size: 100,
                                  color: Color(colorFront),
                                ),
                                height: 100,
                                width: screenwidht - 40,
                                margin: EdgeInsets.only(bottom: 5),
                              ),
                              Text(
                                'Inicio de sesión',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black),
                              ),
                              Container(
                                margin: EdgeInsets.all(5),
                                width: screenwidht - 30,
                                height: 40,
                                padding: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black12,
                                      )
                                    ]),
                                child: DropdownButton(
                                    hint: Text('Seleccinar Clínica'),
                                    value: valueChoose,
                                    isExpanded: true,
                                    items: listItem.map((valueItem) {
                                      return DropdownMenuItem(
                                        value: valueItem,
                                        child: Text(valueItem),
                                      );
                                    }).toList(),
                                    onChanged: (newValue) {
                                      setState(() {
                                        valueChoose = newValue;
                                      });
                                    }),
                              ),
                              ButtonSign(
                                  buttonText: 'Ingresar con codigo de barras',
                                  onPressed: () {
                                    print('se presiono Ingresar');
                                    _enviar();
                                  },
                                  color1: colorFront,
                                  color2: colorFront,
                                  iconData: Icons.qr_code_scanner),
                              Container(
                                padding: EdgeInsets.all(5),
                                margin: EdgeInsets.all(5),
                                child: Text('Ó Ingresa con'),
                              ),
                              ButtonApp(
                                  buttonText: 'Email',
                                  onPressed: () {
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                LoginPageEmail()));
                                  },
                                  color1: colorFront,
                                  color2: colorFront,
                                  iconData: Icons.email),
                            ],
                          ),
                        );
                      }
                    },
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
