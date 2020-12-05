import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:airapy/models/user_model.dart';

class ServerDatabase {
  Firestore _firestoreDatabase = Firestore.instance;
  final CollectionReference users = Firestore.instance.collection('users');

  Future<void> updateData(Map<String, dynamic> data) async {
    var user = await FirebaseAuth.instance.currentUser();
    return _firestoreDatabase
        .collection('users')
        .document(user.uid)
        .updateData(data);
  }

  // Future<void> addData(Map<String, dynamic> data) async {
  //   var user = await FirebaseAuth.instance.currentUser();
  //   return _firestoreDatabase
  //       .collection('users')
  //       .document(user.uid)
  //       .add(data);
  // }

  Future<void> logFood(
      {String mealType, food, healthiness, portionSize, photo}) async {
    var user = await FirebaseAuth.instance.currentUser();
    return await users.document(user.uid).collection("food log").add(
      {
        'mealType': mealType,
        'food': food,
        'healthiness': healthiness,
        'portionSize': portionSize,
        'photoURL': photo,
        'timestamp': FieldValue.serverTimestamp(),
        'coachNote': '—',
      },
    );
  }

  Future<bool> getActivationStatus() async {
    var user = await FirebaseAuth.instance.currentUser();
    return await users.document(user.uid).get().then((datasnapshot) {
      var status = datasnapshot.data['isActivated'];
      return status;
    });
  }

  // Stream<UserModel> getUserProfileStream(String userID) {
  //   return _firestoreDatabase
  //       .collection('users')
  //       .document(userID)
  //       .snapshots()
  //       .map((snap) => UserModel.fromJsonStream(snap.data));
  // }

  Future<UserModel> getUserProfile() async {
    var user = await FirebaseAuth.instance.currentUser();
    var querySnapshot =
        await Firestore.instance.collection('users').document(user.uid).get();

    return (querySnapshot.data != null)
        ? UserModel.fromSnapshot(querySnapshot)
        : null;
  }

  Future<String> getMealPlan() async {
    var user = await FirebaseAuth.instance.currentUser();
    return await users.document(user.uid).get().then((datasnapshot) {
      var mealPlan = datasnapshot.data['mealPlan'];
      return mealPlan;
    });
  }
}
