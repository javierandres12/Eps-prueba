
import 'package:eps/ui/screen/detail_screen.dart';
import 'package:eps/ui/screen/detail_screen_bomba.dart';
import 'package:eps/ui/screen/login_page_barras.dart';
import 'package:eps/ui/widget/button_sign.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';


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

  //creamoas variable local notifiactions
  FlutterLocalNotificationsPlugin localNotification;

  Future<void> scheduleNotification() async {
    var scheduledNotificationDateTime =
    DateTime.now().add(Duration(seconds: 4));
    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
      'channel id',
      'channel name',
      'channel description',
      icon: '@mipmap/ic_launcher',
      largeIcon: DrawableResourceAndroidBitmap('@mipmap/ic_launcher'),
    );
    var iOSPlatformChannelSpecifics = IOSNotificationDetails();
    var platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics
    );
    await localNotification.schedule(
        0,
        'scheduled title',
        'scheduled body',
        scheduledNotificationDateTime,
        platformChannelSpecifics);
  }

  Future<void> showBigPictureNotification() async {
    var bigPictureStyleInformation = BigPictureStyleInformation(
      DrawableResourceAndroidBitmap("@mipmap/ic_launcher"),
      largeIcon: DrawableResourceAndroidBitmap("@mipmap/ic_launcher"),
      contentTitle: 'flutter devs',
      summaryText: 'summaryText',
    );
    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
        'big text channel id',
        'big text channel name',
        'big text channel description',
        styleInformation: bigPictureStyleInformation);
    var platformChannelSpecifics =
    NotificationDetails(android: androidPlatformChannelSpecifics);
    await localNotification.show(
        0, 'big text title', 'silent body', platformChannelSpecifics,
        payload: "big image notifications");
  }

  Future<void> showNotificationMediaStyle() async {
    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
      'media channel id',
      'media channel name',
      'media channel description',
      color: Colors.red,
      enableLights: true,
      largeIcon: DrawableResourceAndroidBitmap("@mipmap/ic_launcher"),
      styleInformation: MediaStyleInformation(),
    );
    var platformChannelSpecifics =
    NotificationDetails(android: androidPlatformChannelSpecifics);
    await localNotification.show(
        0, 'notification title', 'notification body', platformChannelSpecifics);
  }

  Future GenerarNotificacion() async{
    var androidDetails = new AndroidNotificationDetails(
        "channelId",
        "Notificacion prueba",
        "Esta es una prueba para enviar la notificacion",
      icon: '@mipmap/ic_launcher',
      importance: Importance.max,
      //fullScreenIntent: true,
      //channelShowBadge: true,
    );
    var generalNotificationDetails = new NotificationDetails(
      android: androidDetails
    );
    await localNotification.show(0, "Velocidad fuera de rango", "el medicamento se esta suministrando con una velocidad mayor a la permitida, por favor revisar el suministro.", generalNotificationDetails);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var androidInitialize = new AndroidInitializationSettings('@mipmap/ic_launcher');
    var initializationSettings = new InitializationSettings(android: androidInitialize);
    localNotification= new FlutterLocalNotificationsPlugin();
    localNotification.initialize(initializationSettings);
  }

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
            ButtonSign(
                buttonText: 'Notifications push.',
                onPressed: (){
                  print('se genero notificacion');
                  //GenerarNotificacion();
                  //scheduleNotification();
                  //showBigPictureNotification();
                  showNotificationMediaStyle();

                },
                color1: colorFront,
                color2: colorFront,
                iconData: Icons.notification_important
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