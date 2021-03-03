

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eps/model/paciente.dart';
import 'package:eps/model/user.dart';

import 'cloud_firestore_api.dart';

class CloudFirestoreRepositoryUser{

  final _cloudFirestoreAPI = CloudFirestoreAPIUser();

  void deletePaciente(String id)=>_cloudFirestoreAPI.deletePaciente(id);
  void updateUser(User user)=> _cloudFirestoreAPI.updateUser(user);

  void updatePaciente(Paciente paciente)=>_cloudFirestoreAPI.updatePaciente(paciente);

  List<Paciente> buildPaciete(List<DocumentSnapshot> pacienteListSnapshot)=>
      _cloudFirestoreAPI.buildPaciete(pacienteListSnapshot);




}