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

  Future<void> logWeight({String weight}) async {
    var user = await FirebaseAuth.instance.currentUser();
    return await users.document(user.uid).collection('weight log').add(
      {
        'weight': weight,
        "timestamp": FieldValue.serverTimestamp(),
      },
    );
  }

  Future<void> logBloodGlucose({String bloodGlucose, context}) async {
    var user = await FirebaseAuth.instance.currentUser();
    return await users.document(user.uid).collection('blood glucose log').add(
      {
        'bloodGlucose': bloodGlucose,
        'context': context,
        'timestamp': FieldValue.serverTimestamp(),
      },
    );
  }

  Future<void> logBloodPressure(
      {String systolicBloodPressure, diastolicBloodPressure}) async {
    var user = await FirebaseAuth.instance.currentUser();
    return await users.document(user.uid).collection('blood pressure log').add(
      {
        'systolicBloodPressure': systolicBloodPressure,
        'diastolicBloodPressure': diastolicBloodPressure,
        'timestamp': FieldValue.serverTimestamp(),
      },
    );
  }

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

  Future<bool> getPaymentStatus() async {
    var user = await FirebaseAuth.instance.currentUser();
    return await users.document(user.uid).get().then((datasnapshot) {
      var status = datasnapshot.data['hasPaid'];
      return status;
    });
  }

  Future<bool> getActivationStatus() async {
    var user = await FirebaseAuth.instance.currentUser();
    return await users.document(user.uid).get().then((datasnapshot) {
      var status = datasnapshot.data['isActivated'];
      return status;
    });
  }

  Future<int> getAmount() async {
    var user = await FirebaseAuth.instance.currentUser();
    return await users.document(user.uid).get().then((datasnapshot) {
      var amount = datasnapshot.data['amount'];
      return amount;
    });
  }

  Future addPaymentInfo({String cycle, int amount}) async {
    var user = await FirebaseAuth.instance.currentUser();
    return await users.document(user.uid).updateData(
      {
        'subscriptionAmount': amount,
        'subscriptionCycle': cycle,
      },
    );
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

  // Future<CoachModel> getCoachProfile(String coachID) async {
  //   var querySnapshot =
  //       await Firestore.instance.collection('coaches').document(coachID).get();

  //   return (querySnapshot.data != null)
  //       ? CoachModel.fromSnapshot(querySnapshot)
  //       : null;
  // }

  Future<String> getMealPlan() async {
    var user = await FirebaseAuth.instance.currentUser();
    return await users.document(user.uid).get().then((datasnapshot) {
      var mealPlan = datasnapshot.data['mealPlan'];
      return mealPlan;
    });
  }
}
