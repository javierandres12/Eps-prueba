import 'package:flutter/material.dart';

class CardBomba extends StatefulWidget {
  List listaNumerica;
  List listaDatos;

  CardBomba({
    @required this.listaDatos,
    @required this.listaNumerica,
  });


  @override
  State<StatefulWidget> createState() {

    return _CardBomba();
  }

}

class _CardBomba extends State<CardBomba>{

  String NombreDescripcion;

  @override
  Widget build(BuildContext context) {
    print(widget.listaNumerica);
    print(widget.listaDatos);

    if(widget.listaNumerica.isEmpty || widget.listaDatos.isEmpty){
      return Container();
    }else{
      if(widget.listaNumerica.length==2 && widget.listaDatos.length>=7 && widget.listaDatos.length<=9 ){
        return Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Color(0xFFFFF7E2),
                boxShadow: [
                  BoxShadow(
                      color:Colors.red,
                      blurRadius: 2
                  )
                ]
            ),
            padding: EdgeInsets.all(5),
            margin: EdgeInsets.all(5),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 2, right: 2,bottom: 5),
                  padding: EdgeInsets.only(bottom: 0.5),
                  child: Text(
                    'Bomba de Infusión',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                        color: Colors.black),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 2, right: 2),
                  padding: EdgeInsets.only(bottom: 0.5),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Text(
                          'Volumen Restante:',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 15,
                              color: Colors.black),
                        ),
                        alignment: Alignment.topLeft,
                      ),
                      Container(
                        alignment: Alignment.topRight,
                        child: Text(
                          '${widget.listaNumerica[0]} ml',
                          style: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: 15,
                              color: Colors.black),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 2, right: 2),
                  padding: EdgeInsets.only(bottom: 0.5),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Text(
                          'Volumen Saliente:',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 15,
                              color: Colors.black),
                        ),
                        alignment: Alignment.topLeft,
                      ),
                      Container(
                        alignment: Alignment.topRight,
                        child: Text(
                          '${widget.listaNumerica[1]} ml',
                          style: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: 15,
                              color: Colors.black),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 2, right: 2),
                  padding: EdgeInsets.only(bottom: 0.5),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Text(
                          'Velocidad:',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 15,
                              color: Colors.black),
                        ),
                        alignment: Alignment.topLeft,
                      ),
                      Container(
                        alignment: Alignment.topRight,
                        child: Text(
                          '${widget.listaNumerica[0]} ml / ${widget.listaDatos[3]}',
                          style: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: 15,
                              color: Colors.black),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            )
        );
      }else if(widget.listaNumerica.length==3 && widget.listaDatos.length>=11 && widget.listaDatos.length<=13 ){
        return Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Color(0xFFFFF7E2),
                boxShadow: [
                  BoxShadow(
                      color:Colors.red,
                      blurRadius: 2
                  )
                ]
            ),
            padding: EdgeInsets.all(5),
            margin: EdgeInsets.all(5),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 2, right: 2,bottom: 5),
                  padding: EdgeInsets.only(bottom: 0.5),
                  child: Text(
                    'Bomba de Infusión',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                        color: Colors.black),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 2, right: 2),
                  padding: EdgeInsets.only(bottom: 0.5),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Text(
                          'Volumen Restante:',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 15,
                              color: Colors.black),
                        ),
                        alignment: Alignment.topLeft,
                      ),
                      Container(
                        alignment: Alignment.topRight,
                        child: Text(
                          '${widget.listaNumerica[0]} ml',
                          style: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: 15,
                              color: Colors.black),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 2, right: 2),
                  padding: EdgeInsets.only(bottom: 0.5),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Text(
                          'Volumen Saliente:',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 15,
                              color: Colors.black),
                        ),
                        alignment: Alignment.topLeft,
                      ),
                      Container(
                        alignment: Alignment.topRight,
                        child: Text(
                          '${widget.listaNumerica[2]} ml',
                          style: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: 15,
                              color: Colors.black),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 2, right: 2),
                  padding: EdgeInsets.only(bottom: 0.5),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Text(
                          'Velocidad:',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 15,
                              color: Colors.black),
                        ),
                        alignment: Alignment.topLeft,
                      ),
                      Container(
                        alignment: Alignment.topRight,
                        child: Text(
                          '${widget.listaNumerica[0]} ml / ${widget.listaDatos[5]}',
                          style: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: 15,
                              color: Colors.black),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            )
        );
      }else{
        return Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Color(0xFFFFF7E2),
                boxShadow: [
                  BoxShadow(
                      color:Colors.red,
                      blurRadius: 2
                  )
                ]
            ),
            padding: EdgeInsets.all(5),
            margin: EdgeInsets.all(5),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 2, right: 2,bottom: 5),
                  padding: EdgeInsets.only(bottom: 0.5),
                  child: Text(
                    'Bomba de Infusión',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                        color: Colors.black),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 2, right: 2),
                  padding: EdgeInsets.only(bottom: 0.5),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Text(
                          'Volumen Restante:',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 15,
                              color: Colors.black),
                        ),
                        alignment: Alignment.topLeft,
                      ),
                      Container(
                        alignment: Alignment.topRight,
                        child: Text(
                          '${widget.listaNumerica[0]}',
                          style: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: 15,
                              color: Colors.black),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 2, right: 2),
                  padding: EdgeInsets.only(bottom: 0.5),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Text(
                          'Volumen Saliente:',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 15,
                              color: Colors.black),
                        ),
                        alignment: Alignment.topLeft,
                      ),
                      Container(
                        alignment: Alignment.topRight,
                        child: Text(
                          '${widget.listaNumerica[1]} ml',
                          style: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: 15,
                              color: Colors.black),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 2, right: 2),
                  padding: EdgeInsets.only(bottom: 0.5),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Text(
                          'Volumen Saliente:',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 15,
                              color: Colors.black),
                        ),
                        alignment: Alignment.topLeft,
                      ),
                      Container(
                        alignment: Alignment.topRight,
                        child: Text(
                          '${widget.listaNumerica[0]} ml / ${widget.listaDatos[3]}',
                          style: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: 15,
                              color: Colors.black),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            )
        );
      }

    }
  }
}
