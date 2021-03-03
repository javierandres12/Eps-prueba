

import 'package:firebase_auth/firebase_auth.dart';

import 'auth_api.dart';

class AuthRepository{

  //creamos variable que conecta con auth_api
  final _AuthApi = AuthApi();


  logOutFirebase() => _AuthApi.logOut();

  Future<FirebaseUser> signInFirebase() => _AuthApi.signIn();

}