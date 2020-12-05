import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:airapy/models/user_model.dart';

class Auth {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<FirebaseUser> signIn(String email, String password) async {
    FirebaseUser user = (await _firebaseAuth.signInWithEmailAndPassword(
            email: email, password: password))
        .user;
    return user;
  }

  Future<FirebaseUser> signUp(String email, String password) async {
    FirebaseUser user = (await _firebaseAuth.createUserWithEmailAndPassword(
            email: email, password: password))
        .user;
    return user;
  }

  Future<void> signOut() async {
    return await _firebaseAuth.signOut();
  }

  Future<void> resetPassword(String email) async {
    return await _firebaseAuth.sendPasswordResetEmail(email: email);
  }

  createUserProfile(UserModel userModel) async {
    await Firestore.instance
        .collection('users')
        .document(userModel.userID)
        .setData(userModel.toJson());
  }
}
