import 'package:flutter/material.dart';

class CardMonitor extends StatefulWidget {
  String result;
  List listaDatos;
  List listaDatosLetras;
  String ReferenciaMonitor;


  CardMonitor({
    @required this.listaDatos,
    @required this.result,
    @required this.listaDatosLetras,
    @required this.ReferenciaMonitor
  });


  @override
  State<StatefulWidget> createState() {

    return _CardMonitor();
  }

}

class _CardMonitor extends State<CardMonitor>{
  //variables de dragger Infinity vista XL
  int itemFc;
  int itemSpO2;
  int itemPSN;
  int itemRESP;
  int itemPNI;
  int itemPLS;
  String NombreDescripcion;

  @override
  Widget build(BuildContext context) {


    if(widget.listaDatos.isNotEmpty){
      print(widget.listaDatos);

      if( widget.listaDatos.indexOf('Dräger')!=-1 &&
          widget.listaDatos.indexOf('Infinity')!=-1 &&
          widget.listaDatos.indexOf('Vista')!=-1 &&
          widget.listaDatos.indexOf('XL')!=-1 ){//si es un Drager Infinity Vista XL
        setState(() {
          itemFc = (widget.listaDatosLetras.indexOf('FC')-1);
          itemSpO2 = (widget.listaDatosLetras.indexOf('Sp02')+1);
          itemPLS= (widget.listaDatosLetras.indexOf('Sp02')+2);
          itemRESP=(widget.listaDatosLetras.indexOf('PSN')-2);
          itemPSN=(widget.listaDatosLetras.indexOf('PSN')-1);
        });
        return  Container(
            width: (MediaQuery.of(context).size.width)/2,
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
                    'Dräger Infinity Vista XL',
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
                          'FC:',
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
                          '${widget.listaDatosLetras[itemFc]}',
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
                          'Sp02:',
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
                          '${widget.listaDatosLetras[itemSpO2]}',
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
                          'PLS:',
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
                          '${widget.listaDatosLetras[itemPLS]}',
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
                          'RESP:',
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
                          '${widget.listaDatosLetras[itemRESP]}',
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
                          'PSN:',
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
                          '${widget.listaDatosLetras[itemPSN]}',
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

      }else if(widget.listaDatos.indexOf('mindray')!=-1 &&
               widget.listaDatos.indexOf('iMEC12')!=-1 ){// si es un mindray iMEC12
        setState(() {
          itemFc = (widget.listaDatosLetras.indexOf('BCO')+1);
          itemSpO2 = (widget.listaDatosLetras.indexOf('Sp02')-2);
          itemRESP= (widget.listaDatosLetras.indexOf('Sp02')+2);
        });
        return  Container(
            width: (MediaQuery.of(context).size.width)/2,
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
                    'Mindray iMEC12',
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
                          'FC:',
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
                          '${widget.listaDatosLetras[itemFc]}',
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
                          'Sp02:',
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
                          '${widget.listaDatosLetras[itemSpO2]}',
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
                          'RESP:',
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
                          '${widget.listaDatosLetras[itemRESP]}',
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
      }else if(widget.listaDatos.indexOf('mindray')!=-1 &&
               widget.listaDatos.indexOf('iMEC10')!=-1 ){// si es un mindray iMEC10

        setState(() {
          itemFc = (widget.listaDatosLetras.indexOf('Sp02')-1);
          itemSpO2 = (widget.listaDatosLetras.indexOf('Sp02')+1);
          itemRESP= (widget.listaDatosLetras.indexOf('men')-4);
        });
        return  Container(
            width: (MediaQuery.of(context).size.width)/2,
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
                    'Mindray iMEC10',
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
                          'FC:',
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
                          '${widget.listaDatosLetras[itemFc]}',
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
                          'Sp02:',
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
                          '${widget.listaDatosLetras[itemSpO2].toString().substring(0,2)}',
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
                          'RESP:',
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
                          '${widget.listaDatosLetras[itemRESP]}',
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

      }else if(widget.listaDatos.indexOf('mindray')!=-1 &&
          widget.listaDatos.indexOf('MEC-1200')!=-1 ){// si es un mindray iPM-9800

        setState(() {
          itemFc = (widget.listaDatosLetras.indexOf('ECS')+1);
          itemPNI= (widget.listaDatosLetras.indexOf('PNI')+1);
          itemSpO2 = (widget.listaDatosLetras.indexOf('RESP')-1);

        });
        return  Container(
            width: (MediaQuery.of(context).size.width)/2,
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
                    'Mindray MEC-1200',
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
                          'FC:',
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
                          '${widget.listaDatosLetras[itemFc]}',
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
                          'PNI:',
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
                          '${widget.listaDatosLetras[itemPNI]}',
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
                          'Sp02:',
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
                          '${widget.listaDatosLetras[itemSpO2]}',
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
        return Center(
          child: Text('Falta registrar monitor'),
        );
      }

    }else{
      return Container();
    }



    /*if(widget.listaDatos.isEmpty){
      if(widget.result.isEmpty){
        return Container();
      }else{
        return  Container(
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
            padding: EdgeInsets.all(2),
            margin: EdgeInsets.all(3),
            child: Text(widget.result)
        );
      }

    }else{

      if(widget.listaDatos.length>=5){
        return  Container(
            width: (MediaQuery.of(context).size.width)/2,
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
                  margin: EdgeInsets.only(left: 2, right: 2),
                  padding: EdgeInsets.only(bottom: 0.5),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Text(
                          'FC:',
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
                          '${widget.listaDatos[1]}',
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
                          'Sp02:',
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
                          '${widget.listaDatos[2]}',
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
                          'PLS:',
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
                          '${widget.listaDatos[3]}',
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
                          'RESP:',
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
                          '${widget.listaDatos[4]}',
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
        return  Container(
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
            padding: EdgeInsets.all(2),
            margin: EdgeInsets.all(3),
            child: Text(widget.result)
        );
      }

    }*/







  }
}
