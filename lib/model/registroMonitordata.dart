import 'package:flutter/cupertino.dart';

class RegistroMonitorData{

  int id;
  String identificacionM1;
  String identificacionM2;
  String identificacionM3;
  String parametroMonitorFijo;//pueden ser FC,SP02,ECG...
  String parametroOperacion;
  String operacionECG;
  String operacionSP02;
  String operacionPSN;
  String operacionRESP;
  String largoVector;


  RegistroMonitorData({
    @required this.identificacionM1,
    @required this.identificacionM2,
    @required this.identificacionM3,
    @required this.parametroMonitorFijo,
    @required this.parametroOperacion,
    @required this.operacionECG,
    @required this.operacionSP02,
    @required this.operacionPSN,
    @required this.operacionRESP,
    @required this.largoVector,
    this.id
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      "identificacionM1": identificacionM1,
      "identificacionM2":identificacionM2,
      "identificacionM3":identificacionM3,
      "parametroMonitorFijo":parametroMonitorFijo,
      "parametroOperacion":parametroOperacion,
      "operacionECG":operacionECG,
      "operacionSP02":operacionSP02,
      "operacionPSN":operacionPSN,
      "operacionRESP":operacionRESP,
      "largoVector":largoVector
    };
  }
}