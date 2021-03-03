

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eps/model/paciente.dart';
import 'package:eps/model/user.dart';
import 'package:eps/repository/auth_repository.dart';
import 'package:eps/repository/cloud_firestore_api.dart';
import 'package:eps/repository/cloud_firestore_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';


class UserBloc implements Bloc{

 final _auth_repository = AuthRepository();


  Stream<FirebaseUser> streamFirebase = FirebaseAuth.instance.onAuthStateChanged;
  Stream<FirebaseUser> get authStatus => streamFirebase;

  Future<FirebaseUser> get currentUser => FirebaseAuth.instance.currentUser();

 //casos de la aplicacion
 //singIn con google
 Future<FirebaseUser> signIn(){
   //ingresamos con la clase creada en AuthRepository
   return _auth_repository.signInFirebase();

 }

 //metodo de salida
 logOut(){
   _auth_repository.logOutFirebase();
 }






  //registrar en la base de datos el ususario
  final _cloudFirestoreRepositoryUser = CloudFirestoreRepositoryUser();

 void deletePaciente(String id)=>_cloudFirestoreRepositoryUser.deletePaciente(id);
 void updateUser(User user)=> _cloudFirestoreRepositoryUser.updateUser(user);
 void updatePaciente(Paciente paciente)=>_cloudFirestoreRepositoryUser.updatePaciente(paciente);


 Stream<QuerySnapshot> pacienteListStream =
 Firestore.instance.collection(CloudFirestoreAPIUser().PACIENTES).snapshots();

 Stream<QuerySnapshot> get pacienteStream => pacienteListStream;

 List<Paciente> buildPaciete(List<DocumentSnapshot> pacienteListSnapshot)=>
     _cloudFirestoreRepositoryUser.buildPaciete(pacienteListSnapshot);







  @override
  void dispose() {

  }
}