import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String userID,
      firstName,
      lastName,
      email,
      profilePic,
      bio,
      location,
      stepGoal,
      mealPlan,
      referralID,
      coachID;
  bool isActivated;
  DateTime creationDate;
  final DocumentReference reference;

  UserModel({
    this.userID,
    this.firstName,
    this.lastName,
    this.email,
    this.profilePic,
    this.bio,
    this.location,
    this.stepGoal,
    this.mealPlan,
    this.referralID,
    this.coachID,
    this.isActivated,
    this.creationDate,
    this.reference,
  });

  UserModel.fromMap(Map<dynamic, dynamic> map, {this.reference})
      : userID = map['userID'],
        firstName = map['firstName'],
        lastName = map['lastName'],
        email = map['email'],
        profilePic = map['profilePic'],
        bio = map['bio'],
        location = map['location'],
        stepGoal = map['stepGoal'],
        mealPlan = map['mealPlan'],
        referralID = map['referralID'],
        coachID = map['coachID'],
        isActivated = map['isActivated'],
        creationDate = map['creationDate'].toDate();

  UserModel.fromJson(Map<String, dynamic> json, {this.reference})
      : userID = json['userID'],
        firstName = json['firstName'],
        lastName = json['lastName'],
        email = json['email'],
        profilePic = json['profilePic'],
        bio = json['bio'],
        location = json['location'],
        stepGoal = json['stepGoal'],
        mealPlan = json['mealPlan'],
        referralID = json['referralID'],
        coachID = json['coachID'],
        isActivated = json['isActivated'],
        creationDate = json['creationDate'].toDate();

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userID'] = this.userID;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['email'] = this.email;
    data['profilePic'] = this.profilePic;
    data['bio'] = this.bio;
    data['location'] = this.location;
    data['stepGoal'] = this.stepGoal;
    data['mealPlan'] = this.mealPlan;
    data['referralID'] = this.referralID;
    data['coachID'] = this.coachID;
    data['isActivated'] = this.isActivated;
    data['creationDate'] = this.creationDate;
    return data;
  }

  UserModel.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);
}
