import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_quiz_maker/model/user.dart';

class Authservice {
  FirebaseAuth _auth = FirebaseAuth.instance;
  users _userFromFirebaseUser(User user) {
    return users != null ? users(uid: user.uid) : null;
  }

  Future signInEmailAndPass(String email, String password) async {
    try {
      UserCredential authResult = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User firebaseuser = authResult.user;
      return _userFromFirebaseUser(firebaseuser);
    } catch (e) {
      print(e.toString());
    }
  }

  Future signUpWithEmailAndPAssword(String email, String password) async {
    try {
      UserCredential authResult = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User firebaseUser = authResult.user;
      return _userFromFirebaseUser(firebaseUser);
    } catch (e) {
      print(e.toString());
    }
  }

  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
    }
  }
}
