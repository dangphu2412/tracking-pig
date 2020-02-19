import 'package:firebase_auth/firebase_auth.dart';
import 'package:tracking_pig_behavior/models/user.dart';
import 'package:tracking_pig_behavior/services/database.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // create user obj based on FirebaseUser
  User _userFromFirebaseUser(FirebaseUser user) {
    return (user != null)? User(uid: user.uid): null;
  }

  // auth change user stream
  Stream<User> get user {
    return _auth.onAuthStateChanged
      .map(_userFromFirebaseUser);
  }

  //Sign in ano
  Future signInAnon() async {

    try {
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // Sign up with email & password
  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;

      // create new document in Firestore
      await DatabaseService(uid: user.uid).updateUserData(email, 20 , true);

      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
    }
  }

  // Sign in with email & password
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
    }
  }

  // Sign out
  Future signOut() async {
      try {
        return await _auth.signOut();
      } catch (e) {
        print('Getting error sign out');
        print(e);
        return null;
      }
    }
}