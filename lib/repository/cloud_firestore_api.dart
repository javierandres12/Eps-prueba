

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eps/model/paciente.dart';
import 'package:eps/model/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CloudFirestoreAPIUser{

  //creamos el nombre de las collections de la base de datos
  final String USERS = "users";
  final String PACIENTES = "pacientes";


  //creamos el tipo de firestore llamado _db y luego instanciamos


  final Firestore _db = Firestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void deletePaciente(String id) async{
    DocumentReference reference = _db.collection(CloudFirestoreAPIUser().PACIENTES).document(id);
    return await reference.delete();
  }

  void updateUser(User user) async{
    DocumentReference reference = _db.collection(USERS).document(user.uid);
    return await reference.setData({
      'uid': user.uid,
      'name': user.name,
      'email':user.email,
      'lastSignIn':DateTime.now()
    },merge: true);
  }

  void updatePaciente(Paciente paciente) async{
    DocumentReference reference = _db.collection(PACIENTES).document(paciente.id);
    return await reference.setData({
      'nombre':paciente.nombre,
      'id':paciente.id,
      'genero':paciente.genero,
      'edad':paciente.edad,
      'telefono':paciente.telefono,
      'eps':paciente.eps,
      'rol':paciente.rol
    });
  }

  List<Paciente> buildPaciete(List<DocumentSnapshot> pacienteListSnapshot) {
    List<Paciente> pacientes = List<Paciente>();
    pacienteListSnapshot.forEach((p) {
      Paciente paciente = Paciente(
          id: p.data['id'],
          nombre: p.data['nombre'],
          genero: p.data['genero'],
          edad: p.data['edad'],
          telefono: p.data['telefono'],
          eps: p.data['eps'],
          rol: p.data['rol']
      );
      pacientes.add(paciente);
    });
    return pacientes;
  }


    /*void updateUser(User user) async{
    DocumentReference reference = _db.collection(USERS).document(user.uid);
    return await reference.setData({
      'uid': user.uid,
      'name': user.name,
      'email':user.email,
      'lastSignIn':DateTime.now()
    },merge: true);
  }

  void updateComentario(Comentario comentario) async{
    DocumentReference reference = _db.collection(COMENTARIOS).document(comentario.time);
    return await reference.setData({
      'name': comentario.name,
      'text': comentario.text,
      'time': comentario.time,
      'title': comentario.title
    });
  }


  List<Post> buildPost(List<DocumentSnapshot> postListSnapshot){
    List<Post> posts = List<Post>();
    postListSnapshot.forEach((p) {
      Post post = Post(
          title: p.data['title'],
          text: p.data['text'],
          busqueda: p.data['busqueda'],
          information: p.data['information'],
          image: p.data['image']);
      posts.add(post);
    });
    return posts;
  }*/





}