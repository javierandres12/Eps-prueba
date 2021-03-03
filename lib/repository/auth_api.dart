
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthApi{

  final FirebaseAuth _auth = FirebaseAuth.instance;

  final GoogleSignIn googleSignIn = GoogleSignIn();


  // metodo de SignIn con google
  Future<FirebaseUser> signIn() async {
    GoogleSignInAccount googleSignInAccount =
    await googleSignIn.signIn();

    GoogleSignInAuthentication gSA =
    await googleSignInAccount.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
        idToken: gSA.idToken, accessToken: gSA.accessToken);

    FirebaseUser user = (await _auth.signInWithCredential(credential)).user;
    return user;
  }


  // metodo cerrar sesion
  logOut() async {
    await _auth.signOut();
    googleSignIn.signOut();
  }




}