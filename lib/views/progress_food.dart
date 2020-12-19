import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:airapy/models/user_model.dart';
import 'package:airapy/theme/theme.dart';
import 'package:airapy/widgets/appbar.dart';
import 'package:airapy/widgets/food_log_card.dart';

class FoodProgress extends StatefulWidget {
  @override
  _FoodProgressState createState() => _FoodProgressState();
}

class _FoodProgressState extends State<FoodProgress> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<UserModel>(context);
    return Scaffold(
      backgroundColor: background,
      appBar: CustomSecAppBar(
        title: 'Food & Drinks',
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 13),
          child: StreamBuilder<QuerySnapshot>(
              stream: Firestore.instance
                  .collection('users')
                  .document(provider.userID)
                  .collection('food log')
                  .orderBy('timestamp', descending: true)
                  .snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(
                    child: Text('Your logged meal will appear here'),
                  );
                }
                final meals = snapshot.data.documents;
                List<FoodLogCard> foodWidgets = [];
                for (var meal in meals) {
                  final mealName = meal.data['food'];
                  final healthiness = meal.data['healthiness'];
                  final mealType = meal.data['mealType'];
                  final portionSize = meal.data['portionSize'];
                  final coachNote = meal.data['coachNote'];
                  final timestamp = meal.data['timestamp'].toDate();
                  final foodWidget = FoodLogCard(
                    meal: mealName,
                    mealType: mealType,
                    healthiness: healthiness,
                    portionSize: portionSize,
                    coachNote: coachNote,
                    date: timestamp,
                  );
                  foodWidgets.add(foodWidget);
                }
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                  child: ListView(
                    reverse: false,
                    children: foodWidgets,
                  ),
                );
              }),
        ),
      ),
    );
  }
}
