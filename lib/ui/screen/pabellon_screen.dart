import 'dart:convert';
import 'package:eps/ui/screen/login_page_barras.dart';
import 'package:eps/ui/widget/button_sign.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PabellonScreen extends StatefulWidget {
  String token;
  List listItem = [];
  List listID = [];

  PabellonScreen(
      {@required this.token, @required this.listID, @required this.listItem});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _PabellonScreen();
  }
}

class _PabellonScreen extends State<PabellonScreen> {
  // variables pabellon
  //int frecuencia_horario;
  //int cantidad_planeacion;
  int colorAppbar = 0xFF3B4C71; //0xFF3B4C71
  String Dominio = "https://dev-ams.portubien.co";
  String valueChoose;
  String valueChooseHorario;
  String id_Pabellon;
  bool _isDownload = false;
  int colorDesargar = 0xFF5574E4; //color false
  Map<String, dynamic> jsonPabellon;
  Map<String, dynamic> jsonFactoresDeRiesgo;
  Map<String, dynamic> jsonPacientes;
  Map<String, dynamic> jsonKardex;

  List ListaHorarios = [
    '00:00:00',
    '01:00:00',
    '02:00:00',
    '03:00:00',
    '04:00:00',
    '05:00:00',
    '06:00:00',
    '07:00:00',
    '08:00:00',
    '09:00:00',
    '10:00:00',
    '11:00:00',
    '12:00:00',
    '13:00:00',
    '14:00:00',
    '15:00:00',
    '16:00:00',
    '17:00:00',
    '18:00:00',
    '19:00:00',
    '20:00:00',
    '21:00:00',
    '22:00:00',
    '23:00:00'
  ];

  //variables paciente
  List lista = [];
  String idScaner;
  Map<String, dynamic> jsonPaciente;

  final _scaffoldkey = GlobalKey<ScaffoldState>();

  Future<void> descargarPabellon() async{

    if(valueChoose!=null && _isDownload==false){
      setState(() {
        id_Pabellon = widget.listID[widget.listItem.indexOf(valueChoose)];
        _isDownload=true;
        //_isDownload=true;
        //colorDesargar=0xFF82D2C8;//color true
      });
      print(id_Pabellon);
      //print('token: ${widget.token}');
      //DataBaseAMS.guardarToken(TokenData(token: widget.token));
      _scaffoldkey.currentState.showSnackBar(SnackBar(
        content: Container(
            height: 100,
            child: Column(
              children: [
                CircularProgressIndicator(),
                Padding(padding: EdgeInsets.all(2)),
                Text('Descargando Pabellon')
              ],
            )
        ),
        backgroundColor: Color(0xFF5574E4),
        duration: Duration(minutes: 10),
      ));
      print('idPAbellon ${id_Pabellon}');


      try{
        Uri urlFactores = Uri.parse('${Dominio}/api/getFactoresRiesgo');
        final resposeFactoresDeRiesgo = await http.get(
            urlFactores,
            headers: {
              "Content-Type": "application/x-www-form-urlencoded",
              "Authorization": widget.token
            });
        setState(() {
          jsonFactoresDeRiesgo = json.decode(resposeFactoresDeRiesgo.body);
        });
        print(jsonFactoresDeRiesgo);
        //print(widget.token);

        //pabellon
        //Uri url1 = Uri.https(Dominio,"api/getKardexPacienteByPabellon/${id_Pabellon}");
        Uri url1 = Uri.parse('${Dominio}/api/getKardexPacienteByPabellon/${id_Pabellon}');
        final resposePabellon = await http.get(
            url1,
            headers: {
              "Content-Type": "application/x-www-form-urlencoded",
              "Authorization": widget.token
            });
        setState(() {
          jsonPabellon = json.decode(resposePabellon.body);
        });
        //print(jsonPabellon);

        //print('Camas: ${jsonPabellon['data']['camas'][0].length}');
        //print('Camas: ${jsonPabellon['data']['camas'][0]}');
        //print('Kardex: ${jsonPabellon['data']['kardex'][16]}');
        //print('Kardex: ${jsonPabellon['data']['kardex'][17]}');
        /*print('Kardex: ${jsonPabellon['data']['kardex'][1]}');
       print('Kardex: ${jsonPabellon['data']['kardex'][2]}');
       print('Kardex: ${jsonPabellon['data']['kardex'][3]}');
       print('Kardex: ${jsonPabellon['data']['kardex'][4]}');*/

        //imprimir el json completo
        prettyPrintJson(String input) {
          const JsonDecoder decoder = JsonDecoder();
          const JsonEncoder encoder = JsonEncoder.withIndent('  ');
          final dynamic object = decoder.convert(input);
          final dynamic prettyString = encoder.convert(object);
          prettyString.split('\n').forEach((dynamic element) => print(element));
        }

        prettyPrintJson(json.encode(jsonPabellon['data']['camas'][0]));
        /*print('Kardex: ${jsonPabellon['data']['kardex'][0]}');
       print('Kardex: ${jsonPabellon['data']['kardex'][1]}');
       print('Kardex: ${jsonPabellon['data']['kardex'][2]}');
       print('Kardex: ${jsonPabellon['data']['kardex'][3]}');
       print('Kardex: ${jsonPabellon['data']['kardex'][4]}');
       print('Kardex: ${jsonPabellon['data']['kardex'][5]}');
       print('Kardex: ${jsonPabellon['data']['kardex'][6]}');*/



        if(jsonPabellon['status']=="error"){
          _scaffoldkey.currentState.removeCurrentSnackBar();
          setState(() {
            _isDownload=false;
          });
          return showDialog(
              context: context,
              builder: (BuildContext context){
                return AlertDialog(
                  content: Text('No se descargó el pabellon debido a que:\n\n "${jsonPabellon['message'].toString().trim()}".'),
                  title: Text('ERROR DE DESCARGA', style: TextStyle(fontSize: 15,fontWeight: FontWeight.w900),),
                  actions: [
                    TextButton(
                        onPressed: (){Navigator.pop(context);},
                        child: Text(
                          'Aceptar',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        )
                    )
                  ],
                );
              }
          );



        }else{
          //descarga de pabellon

          //print('Datos: ${jsonPabellon['data']}');
          setState(() {
            _isDownload=true;
            colorDesargar=0xFF82D2C8;//color true
            jsonPaciente=jsonPabellon['data']['camas'];
            jsonKardex=jsonPabellon['data']['kardex'];
          });
          print('Pacientes: ${jsonPaciente}');
          print('Kardex: ${jsonKardex}');

          //factores de riesgo
          /*for(int p =0 ;p<jsonFactoresDeRiesgo['data'].length;p++){
            DataBaseAMS.guardarListaDeFactoresDeRiesgos(
                FactoresListaData(
                    id_factor_riesgo: jsonFactoresDeRiesgo['data'][p]['id'].toString().trim(),
                    nombre_riesgo: jsonFactoresDeRiesgo['data'][p]['nombre'].toString().trim(),
                    observaciones: jsonFactoresDeRiesgo['data'][p]['descripcion'].toString().trim(),
                    estado: jsonFactoresDeRiesgo['data'][p]['estado'].toString().trim(),
                    color: jsonFactoresDeRiesgo['data'][p]['color'].toString().trim()
                ));
          }

          //pabellon
          for(int l = 0 ; l<jsonPabellon['data']['camas'].length; l++){

            DataBaseAMS.guardarPaciente(
                PacienteData(
                    activar: 0.toString(),
                    numeroCama: jsonPabellon['data']['camas'][l]['numeroCama'].toString().trim(),
                    paciente_cedula: jsonPabellon['data']['camas'][l]['paciente_cedula'].toString().trim(),
                    tipo_documento: jsonPabellon['data']['camas'][l]['tipo_documento'].toString().trim(),
                    paciente_ingreso: jsonPabellon['data']['camas'][l]['paciente_ingreso'].toString().trim(),
                    paciente_nombre: jsonPabellon['data']['camas'][l]['paciente_nombre'].toString().trim(),
                    paciente_apellido: jsonPabellon['data']['camas'][l]['paciente_apellido'].toString().trim(),
                    paciente_genero: jsonPabellon['data']['camas'][l]['paciente_genero'].toString().trim(),
                    historia_clinica: jsonPabellon['data']['camas'][l]['historia_clinica'].toString().trim()),
                jsonPabellon['data']['camas'][l]['historia_clinica'].toString().trim()
            );

            if(jsonPabellon['data']['camas'][l]['alergias_paciente']==null || jsonPabellon['data']['camas'][l]['alergias_paciente']==[] || jsonPabellon['data']['camas'][l]['alergias_paciente'].toString()=='[]'){
            }else{
              //print('Paciente: ${jsonPabellon['data']['camas'][l]}');
              //print('Alergias: ${jsonPabellon['data']['camas'][l]['alergias_paciente']}');
              for(int b = 0;b<jsonPabellon['data']['camas'][l]['alergias_paciente'].length;b++){
                DataBaseAMS.guardarAlergias(
                    AlergiaData(
                        enviar: 0.toString(),
                        numeroCama: jsonPabellon['data']['camas'][l]['numeroCama'].toString().trim(),
                        paciente_cedula: jsonPabellon['data']['camas'][l]['paciente_cedula'].toString().trim(),
                        tipo_documento: jsonPabellon['data']['camas'][l]['tipo_documento'].toString().trim(),
                        paciente_ingreso: jsonPabellon['data']['camas'][l]['paciente_ingreso'].toString().trim(),
                        paciente_nombre: jsonPabellon['data']['camas'][l]['paciente_nombre'].toString().trim(),
                        paciente_apellido: jsonPabellon['data']['camas'][l]['paciente_apellido'].toString().trim(),
                        paciente_genero: jsonPabellon['data']['camas'][l]['paciente_genero'].toString().trim(),
                        historia_clinica: jsonPabellon['data']['camas'][l]['historia_clinica'].toString().trim(),
                        descripcion: jsonPabellon['data']['camas'][l]['alergias_paciente'][b]['descripcion'].toString().trim(),
                        id_medicamento_ams: jsonPabellon['data']['camas'][l]['alergias_paciente'][b]['id_medicamento_ams'].toString().trim(),
                        nombre_medicamento: jsonPabellon['data']['camas'][l]['alergias_paciente'][b]['nombre_medicamento'].toString().trim(),
                        codigo_his: jsonPabellon['data']['camas'][l]['alergias_paciente'][b]['codigo_his'].toString().trim(),
                        tipo_alergia: jsonPabellon['data']['camas'][l]['alergias_paciente'][b]['tipo_alergia'].toString().trim()
                    )
                );

              }
            }

            //Aislamientos luego
            if(jsonPabellon['data']['camas'][l]['niveles_aislamiento']==null || jsonPabellon['data']['camas'][l]['niveles_aislamiento']==[] || jsonPabellon['data']['camas'][l]['niveles_aislamiento'].toString()=='[]' ){
            }else{
              for(int n = 0;n<jsonPabellon['data']['camas'][l]['niveles_aislamiento'].length;n++){
                DataBaseAMS.guardarAislamientos(
                    AislamientoData(
                        enviar: 0.toString(),
                        tipo_documento: jsonPabellon['data']['camas'][l]['tipo_documento'].toString().trim(),
                        historia_clinica: jsonPabellon['data']['camas'][l]['historia_clinica'].toString().trim(),
                        nombre_nivel: jsonPabellon['data']['camas'][l]['niveles_aislamiento'][n]['nombre_nivel'].toString().trim(),
                        descripcion: jsonPabellon['data']['camas'][l]['niveles_aislamiento'][n]['descripcion'].toString().trim(),
                        observaciones: jsonPabellon['data']['camas'][l]['niveles_aislamiento'][n]['observaciones'].toString().trim(),
                        user_name: jsonPabellon['data']['camas'][l]['niveles_aislamiento'][n]['user_name'].toString().trim(),
                        numero_ingreso: jsonPabellon['data']['camas'][l]['paciente_ingreso'].toString().trim()
                    )
                );
              }
            }

            //Factores de riesgo
            if(jsonPabellon['data']['camas'][l]['factores_riesgos']==null || jsonPabellon['data']['camas'][l]['factores_riesgos']==[] || jsonPabellon['data']['camas'][l]['factores_riesgos'].toString()=='[]' ){
            }else{
              for(int n = 0;n<jsonPabellon['data']['camas'][l]['factores_riesgos'].length;n++){
                DataBaseAMS.guardarFactoresDeRiesgos(
                    FactoresRiesgosData(
                        enviar: 0.toString(),
                        codigo_tipo_documento: jsonPabellon['data']['camas'][l]['tipo_documento'].toString().trim(),
                        historia_clinica: jsonPabellon['data']['camas'][l]['historia_clinica'].toString().trim(),
                        id_factor_riesgo: jsonPabellon['data']['camas'][l]['factores_riesgos'][n]['id'].toString().trim(),
                        observaciones: jsonPabellon['data']['camas'][l]['factores_riesgos'][n]['observaciones'].toString().trim(),
                        nombre_nivel: jsonPabellon['data']['camas'][l]['factores_riesgos'][n]['nombre_nivel'].toString().trim(),
                        color: jsonPabellon['data']['camas'][l]['factores_riesgos'][n]['color'].toString().trim(),
                        numero_ingreso: jsonPabellon['data']['camas'][l]['paciente_ingreso'].toString().trim()
                    )
                );
              }
            }




          }

          //aplicados no necesarios
          /*if(jsonPabellon['data']['aplicados'].isNotEmpty){


             for(int n= 0; n<jsonPabellon['data']['aplicados'].length;n++) {

               if ( jsonPabellon['data']['aplicados'][n]['hora_aplicacion'].toString().trim() == "1753-01-01 00:00:00.000" && jsonPabellon['data']['aplicados'][n]['hora_planeacion'].toString().trim() == "1753-01-01 00:00:00.000" ) {


               }else{
                 DataBaseAMS.guardarPlaneados(
                   PlaneadoData(
                       historia_clinica: jsonPabellon['data']['aplicados'][n]['historia_clinica'].toString().trim(),
                       tipo_documento: jsonPabellon['data']['aplicados'][n]['tipo_documento'].toString().trim(),
                       folio: jsonPabellon['data']['aplicados'][n]['folio'].toString().trim(),
                       codigo_farmaco: jsonPabellon['data']['aplicados'][n]['codigo_farmaco'].toString().trim(),
                       principio_activo: jsonPabellon['data']['aplicados'][n]['principio_activo'].toString().trim(),
                       forma: jsonPabellon['data']['aplicados'][n]['forma'].toString().trim(),
                       cod_concentracion: jsonPabellon['data']['aplicados'][n]['cod_concentracion'].toString().trim(),
                       ingreso_paciente: jsonPabellon['data']['aplicados'][n]['ingreso_paciente'].toString().trim(),
                       hora_planeacion: jsonPabellon['data']['aplicados'][n]['hora_planeacion'].toString().trim(),
                       hora_aplicacion: jsonPabellon['data']['aplicados'][n]['hora_aplicacion'].toString().trim(),
                       numero_dosis: jsonPabellon['data']['aplicados'][n]['numero_dosis'].toString().trim(),
                       medicamento_descripcion: jsonPabellon['data']['aplicados'][n]['medicamento_descripcion'].toString().trim(),
                       lectura_dosis: jsonPabellon['data']['aplicados'][n]['cantidad_dosis'].toString().trim(),
                       cantidad_dosis: jsonPabellon['data']['aplicados'][n]['cantidad_dosis'].toString().trim(),
                       folio_original: jsonPabellon['data']['aplicados'][n]['folio_original'].toString().trim(),
                       id_user_horarios: jsonPabellon['data']['aplicados'][n]['id_user_horarios'].toString().trim(),
                       id_horario: 'Sin',
                       horario_anterior: json.encode([].toString()),
                       vector_horarios: json.encode([].toString()),
                       total_dosis: jsonPabellon['data']['aplicados'][n]['total_dosis'].toString().trim()
                   ),
                 );

                 /*DataBaseAMS.eliminarPlaneadosAplicadosAntes(
                 jsonPabellon['data']['aplicados'][n]['historia_clinica'].toString().trim(),
                 jsonPabellon['data']['aplicados'][n]['tipo_documento'].toString().trim(),
                 jsonPabellon['data']['aplicados'][n]['folio'].toString().trim(),
                 jsonPabellon['data']['aplicados'][n]['codigo_farmaco'].toString().trim(),
                 jsonPabellon['data']['aplicados'][n]['principio_activo'].toString().trim(),
                 jsonPabellon['data']['aplicados'][n]['forma'].toString().trim(),
                 jsonPabellon['data']['aplicados'][n]['cod_concentracion'].toString().trim(),
                 jsonPabellon['data']['aplicados'][n]['medicamento_descripcion'].toString().trim(),
                 '1753-01-01 00:00:00.000',
                 jsonPabellon['data']['aplicados'][n]['hora_planeacion'].toString().trim()
             );*/
               }
             }



         }*/

          for(int m= 0; m<jsonPabellon['data']['kardex'].length;m++){

            if(jsonPabellon['data']['kardex'][m]['estado_dosificacion'].toString().trim()!='A'){

              print('esta despachado kardex');

              //guardar Kardex con el vector de horarios
              DataBaseAMS.guardarKardex(
                KardexData(
                    historia_clinica: jsonPabellon['data']['kardex'][m]['historia_clinica'].toString().trim(),
                    tipo_documento: jsonPabellon['data']['kardex'][m]['tipo_documento'].toString().trim(),
                    folio: jsonPabellon['data']['kardex'][m]['folio'].toString().trim(),
                    codigo_farmaco: jsonPabellon['data']['kardex'][m]['codigo_farmaco'].toString().trim(),
                    principio_activo: jsonPabellon['data']['kardex'][m]['principio_activo'].toString().trim(),
                    forma: jsonPabellon['data']['kardex'][m]['forma'].toString().trim(),
                    cod_concentracion: jsonPabellon['data']['kardex'][m]['cod_concentracion'].toString().trim(),
                    ingreso_paciente: jsonPabellon['data']['kardex'][m]['ingreso_paciente'].toString().trim(),
                    medicamento_descripcion: jsonPabellon['data']['kardex'][m]['medicamento_descripcion'].toString().trim(),
                    via_administracion: jsonPabellon['data']['kardex'][m]['via_administracion'].toString().trim(),
                    formulacion_observacion: jsonPabellon['data']['kardex'][m]['formulacion_observacion'].toString().trim(),
                    estado_formulacion: jsonPabellon['data']['kardex'][m]['estado_formulacion'].toString().trim(),
                    frecuencia_dosis: jsonPabellon['data']['kardex'][m]['frecuencia_dosis'].toString().trim(),
                    cantidad_total: jsonPabellon['data']['kardex'][m]['cantidad_total'].toString().trim(),
                    cantidad_dosis: jsonPabellon['data']['kardex'][m]['cantidad_dosis'].toString().trim(),
                    unidad_dosis: jsonPabellon['data']['kardex'][m]['unidad_dosis'].toString().trim(),
                    descripcion_concentracion: jsonPabellon['data']['kardex'][m]['descripcion_concentracion'].toString().trim(),
                    estado_dosificacion: jsonPabellon['data']['kardex'][m]['estado_dosificacion'].toString().trim(),
                    usuario_recibe: jsonPabellon['data']['kardex'][m]['usuario_recibe'].toString().trim(),
                    estado_lasa: jsonPabellon['data']['kardex'][m]['estado_lasa'].toString().trim(),
                    estado_confirmacion: jsonPabellon['data']['kardex'][m]['estado_confirmacion'].toString().trim(),
                    lectura_dosis: jsonPabellon['data']['kardex'][m]['cantidad_dosis'].toString().trim(),
                    codigo_dosis: jsonPabellon['data']['kardex'][m]['codigo_dosis'].toString().trim(),
                    folio_original: jsonPabellon['data']['kardex'][m]['folio_original'].toString().trim(),
                    pendientes: jsonPabellon['data']['kardex'][m]['pendientes'].toString().trim(),
                    //prioridad: jsonPabellon['data']['kardex'][m]['prioridad'].toString().trim(),
                    prioridad: (jsonPabellon['data']['kardex'][m]['prioridad']==null)?0.toString():jsonPabellon['data']['kardex'][m]['prioridad'].toString().trim(),
                    fecha_vencimiento: jsonPabellon['data']['kardex'][m]['fecha_vencimiento'].toString().trim(),
                    contenido_total_medicamento: jsonPabellon['data']['kardex'][m]['contenido_total_medicamento'].toString().trim(),
                    contenido_total_medicamento_lectura: jsonPabellon['data']['kardex'][m]['contenido_total_medicamento'].toString().trim()
                ),
              );
              //filtroFrecuenciasVectorHorarios(m);


              //guardar observaciones enfermeria
              if(jsonPabellon['data']['kardex'][m]['observaciones_enfermeria']==null || jsonPabellon['data']['kardex'][m]['observaciones_enfermeria']==[] || jsonPabellon['data']['kardex'][m]['observaciones_enfermeria'].toString()=='[]'){
              }else{
                print('Observaciones enfermeria: ${jsonPabellon['data']['kardex'][m]['observaciones_enfermeria']}');
                for(int j = 0;j<jsonPabellon['data']['kardex'][m]['observaciones_enfermeria'].length;j++){
                  DataBaseAMS.guardarObservaciones(
                      ObservacionesData(
                          historia_clinica: jsonPabellon['data']['kardex'][m]['historia_clinica'].toString().trim(),
                          tipo_documento: jsonPabellon['data']['kardex'][m]['tipo_documento'].toString().trim(),
                          folio: jsonPabellon['data']['kardex'][m]['folio'].toString().trim(),
                          codigo_farmaco: jsonPabellon['data']['kardex'][m]['codigo_farmaco'].toString().trim(),
                          principio_activo: jsonPabellon['data']['kardex'][m]['principio_activo'].toString().trim(),
                          forma: jsonPabellon['data']['kardex'][m]['forma'].toString().trim(),
                          cod_concentracion: jsonPabellon['data']['kardex'][m]['cod_concentracion'].toString().trim(),
                          ingreso_paciente: jsonPabellon['data']['kardex'][m]['ingreso_paciente'].toString().trim(),
                          hora_planeacion: jsonPabellon['data']['kardex'][m]['hora_planeacion'].toString().trim(),
                          numero_dosis: jsonPabellon['data']['kardex'][m]['hora_planeacion'].toString().trim(),
                          medicamento_descripcion: jsonPabellon['data']['kardex'][m]['medicamento_descripcion'].toString().trim(),
                          observaciones: jsonPabellon['data']['kardex'][m]['observaciones_enfermeria'][j]['observaciones'].toString().trim(),
                          updated_at: jsonPabellon['data']['kardex'][m]['observaciones_enfermeria'][j]['updated_at'].toString().trim(),
                          clinica_id: jsonPabellon['data']['kardex'][m]['observaciones_enfermeria'][j]['clinica_id'].toString().trim(),
                          id_usuario: jsonPabellon['data']['kardex'][m]['observaciones_enfermeria'][j]['id_usuario'].toString().trim(),
                          medicamento_his_id: jsonPabellon['data']['kardex'][m]['observaciones_enfermeria'][j]['medicamento_his_id'].toString().trim()

                      )
                  );
                }
              }

              //guardar codigos de barras
              if(jsonPabellon['data']['kardex'][m]['barcodes']==null || jsonPabellon['data']['kardex'][m]['barcodes']==[]){
              }else{
                for(int n = 0;n<jsonPabellon['data']['kardex'][m]['barcodes'].length;n++){
                  DataBaseAMS.guardarBarcodes(
                    BarcodeData(
                        historia_clinica: jsonPabellon['data']['kardex'][m]['historia_clinica'].toString().trim(),
                        tipo_documento: jsonPabellon['data']['kardex'][m]['tipo_documento'].toString().trim(),
                        folio: jsonPabellon['data']['kardex'][m]['folio'].toString().trim(),
                        codigo_farmaco: jsonPabellon['data']['kardex'][m]['codigo_farmaco'].toString().trim(),
                        principio_activo: jsonPabellon['data']['kardex'][m]['principio_activo'].toString().trim(),
                        forma: jsonPabellon['data']['kardex'][m]['forma'].toString().trim(),
                        cod_concentracion: jsonPabellon['data']['kardex'][m]['cod_concentracion'].toString().trim(),
                        ingreso_paciente: jsonPabellon['data']['kardex'][m]['ingreso_paciente'].toString().trim(),
                        hora_planeacion: jsonPabellon['data']['kardex'][m]['hora_planeacion'].toString().trim(),
                        hora_aplicacion: jsonPabellon['data']['kardex'][m]['hora_aplicacion'].toString().trim(),
                        numero_dosis: jsonPabellon['data']['kardex'][m]['hora_planeacion'].toString().trim(),
                        medicamento_descripcion: jsonPabellon['data']['kardex'][m]['medicamento_descripcion'].toString().trim(),
                        codigo_his: '${jsonPabellon['data']['kardex'][m]['codigo_farmaco']}-${jsonPabellon['data']['kardex'][m]['principio_activo']}-${jsonPabellon['data']['kardex'][m]['cod_concentracion']}-${jsonPabellon['data']['kardex'][m]['forma']}',
                        barcode: jsonPabellon['data']['kardex'][m]['barcodes'][n]),
                    /*jsonPabellon['data']['kardex'][m]['historia_clinica'].toString().trim(),
                jsonPabellon['data']['kardex'][m]['tipo_documento'].toString().trim(),
                jsonPabellon['data']['kardex'][m]['folio'].toString().trim(),
                jsonPabellon['data']['kardex'][m]['codigo_farmaco'].toString().trim(),
                jsonPabellon['data']['kardex'][m]['principio_activo'].toString().trim(),
                jsonPabellon['data']['kardex'][m]['forma'].toString().trim(),
                jsonPabellon['data']['kardex'][m]['cod_concentracion'].toString().trim(),
                jsonPabellon['data']['kardex'][m]['medicamento_descripcion'].toString().trim(),
                jsonPabellon['data']['kardex'][m]['barcodes'][n]*/
                  );
                }
              }

              //crear planeacion para el kardex
              filtroFrecuenciasKardex(m);

            }else{
              print('kardex no despachado');
            }

          }


          for(int v=0;v<jsonPabellon['data']['respuestas'].length;v++){
            DataBaseAMS.guardarRespuesta(RespuestaData(respuesta: jsonPabellon['data']['respuestas'][v]));
          }*/

          _scaffoldkey.currentState.removeCurrentSnackBar();
          return showDialog(
              context: context,
              builder: (BuildContext context){
                return AlertDialog(
                  content: Text('Se descargó el pabellon "${valueChoose.toString().trim()}" correctamente.'),
                  title: Text('INFORMACION DE DESCARGA', style: TextStyle(fontSize: 15,fontWeight: FontWeight.w900),),
                  actions: [
                    TextButton(
                        onPressed: (){Navigator.pop(context);},
                        child: Text(
                          'Aceptar',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        )
                    )
                  ],
                );
              }
          );

        }

      }catch(e){
        print('error');
        print(e);
        print(jsonPabellon);
        print(jsonFactoresDeRiesgo);

        setState(() {
          _isDownload=false;
        });

        _scaffoldkey.currentState.removeCurrentSnackBar();
        return showDialog(
            context: context,
            builder: (BuildContext context){
              return AlertDialog(
                content: Text('No se descargó el pabellon, por favor revise su conexion a internet.'),
                title: Text('ERROR DE DESCARGA', style: TextStyle(fontSize: 15,fontWeight: FontWeight.w900),),
                actions: [
                  TextButton(
                      onPressed: (){Navigator.pop(context);},
                      child: Text(
                        'Aceptar',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      )
                  )
                ],
              );
            }
        );
      }


    }else if (valueChoose == null){
      _scaffoldkey.currentState.showSnackBar(SnackBar(
          content: Text('Por favor elige una clinica'),
          duration: Duration(seconds: 1),
          backgroundColor: Color(0xFF5574E4)));
    }else if(valueChoose!=null && _isDownload==true){
      return showDialog(
          context: context,
          builder: (BuildContext context){
            return AlertDialog(
              content: Text('No se realizó la descarga debido a que ya descargó un pabellon en la base de datos, por favor elimine ese pabellon para descargar otro'),
              title: Text('INFORMACION DE DESCARGA', style: TextStyle(fontSize: 15,fontWeight: FontWeight.w900),),
              actions: [
                TextButton(
                    onPressed: (){Navigator.pop(context);},
                    child: Text(
                      'Aceptar',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                )
              ],
            );
          }
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      key: _scaffoldkey,
      appBar: AppBar( 
        backgroundColor: Color(colorAppbar),
        title: Text(
          'Reconocimiento',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: ListView(
        children: [
          //aca comienza
          Container(
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.white12,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 1)]),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.all(10),
                  child: Text(
                    'Descargar pabellon',
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.w900),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  child: Text(
                    'Selecione el pabellon y luego presione el boton descargar pabellon',
                    style: TextStyle(fontSize: 13, color: Colors.black),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 5, right: 5, top: 2, bottom: 2),
                  width: screenWidth - 30,
                  height: 40,
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                        )
                      ]),
                  child: DropdownButton(
                      hint: Text('Seleccione el pabellon: '),
                      value: valueChoose,
                      isExpanded: true,
                      items: widget.listItem.map((valueItem) {
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
                Container(
                  margin: EdgeInsets.only(left: 5, right: 5, top: 2, bottom: 2),
                  width: screenWidth - 30,
                  height: 40,
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                        )
                      ]),
                  child: DropdownButton(
                      hint: Text('Seleccionar Horario: '),
                      value: valueChooseHorario,
                      isExpanded: true,
                      items: ListaHorarios.map((valueItem) {
                        return DropdownMenuItem(
                          value: valueItem,
                          child: Text(valueItem),
                        );
                      }).toList(),
                      onChanged: (newValue) {
                        setState(() {
                          valueChooseHorario = newValue;
                        });
                      }),
                ),
                ButtonSign(
                    buttonText: 'Descargar Pabellon',
                    onPressed: () {
                      descargarPabellon();
                    },
                    color1: colorAppbar,
                    color2: colorAppbar,
                    iconData: Icons.download_sharp),
              ],
            ),
          ),

          Container(
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.white12,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 1)]),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.all(10),
                  child: Text(
                    'Proceso de aplicación AMS',
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.w900),
                  ),
                ),
                ButtonSign(
                    buttonText: 'Ver Pabellon',
                    onPressed: () {
                      /*Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => InformacionPacientePage(
                                    listID: widget.listID,
                                    listItem: widget.listItem,
                                    valueChoose: valueChooseHorario,
                                  )));*/
                    },
                    color1: colorAppbar,
                    color2: colorAppbar,
                    iconData: Icons.remove_red_eye_sharp),
                ButtonSign(
                    buttonText: 'Eliminar Pabellon',
                    onPressed: () {
                      //eliminarTodo();
                    },
                    color1: colorAppbar,
                    color2: colorAppbar,
                    iconData: Icons.delete),
              ],
            ),
          )
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              child: Container(
                child: Icon(
                  Icons.fact_check_outlined,
                  size: 100,
                  color: Color(colorAppbar),
                ),
                height: 250,
                width: screenWidth,
              ),
            ),
            ListTile(
              title: Text('Configuración'),
              onTap: () {
                _scaffoldkey.currentState.showSnackBar(
                    SnackBar(content: Text('Proceso en construcción')));
              },
              leading: Icon(Icons.settings),
            ),
            ListTile(
              title: Text('Cerrar Sesión'),
              onTap: () {
                _scaffoldkey.currentState
                    .showSnackBar(SnackBar(content: Text('Saliendo de Ams')));
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => LoginPageBarras()));
              },
              leading: Icon(Icons.exit_to_app),
            ),
          ],
        ),
      ),
    );
  }
}
