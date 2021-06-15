import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class ButtonApp extends StatelessWidget {

  String buttonText ;
  final VoidCallback onPressed;
  int color1;
  int color2;
  IconData iconData;

  ButtonApp({Key key,
    @required this.buttonText,
    @required this.onPressed,
    @required this.color1,
    @required this.color2,
    @required this.iconData
  });


  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidht = MediaQuery.of(context).size.width;
    // TODO: implement build
    return InkWell(
      onTap: onPressed,
      child: Container(
        margin: EdgeInsets.all(5),
        height: 40,
        decoration: BoxDecoration(
          color: Color(color1),
          borderRadius: BorderRadius.circular(10.0),
        ),

        child: Container(
          alignment: Alignment.center,
          margin: EdgeInsets.all(3),
          child:  Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(padding: EdgeInsets.only(right: 20)),
              Icon(iconData,
                color: Colors.white,
                size: 25,
              ),
              Padding(padding: EdgeInsets.only(left: 10)),
              Text(
                buttonText,
                style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.white
                ),

              ),
            ],

          ),
        ),

      ),
    );
  }

}