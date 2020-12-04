import 'package:airapy/theme/aircon_icons.dart';
import 'package:airapy/theme/theme.dart';
import 'package:airapy/utilities/margin.dart';
import 'package:airapy/views/aerobic_exercise.dart';
import 'package:airapy/views/coach_chat.dart';
import 'package:airapy/views/profile.dart';
import 'package:airapy/views/singing_exercise.dart';
import 'package:airapy/views/track_food.dart';
import 'package:airapy/widgets/task_card.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 13),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              YMargin(30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 9),
                child: Container(
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            'Good morning,\nJoseph!',
                            style: TextStyle(
                                fontSize: 27, fontWeight: FontWeight.w700),
                          ),
                          GestureDetector(
                            child: CircleAvatar(
                              radius: 28.0,
                              backgroundImage: NetworkImage(
                                  'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png'),
                            ),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Profile(),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                      YMargin(25),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 7),
                child: Text(
                  "Today's tasks",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
                ),
              ),
              YMargin(7),
              TaskCard(
                label: 'Keep walking',
                description: 'You have taken 1359 steps today',
                image: CircleAvatar(
                  child: Icon(
                    Aircon.steps,
                    size: 25,
                    color: primaryBlue,
                  ),
                  radius: 22,
                  backgroundColor: secondaryBlue,
                ),
                onPress: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CoachChat(),
                  ),
                ),
              ),
              TaskCard(
                label: 'Breathing exercise',
                description: 'Helps you breathe with less effort',
                image: CircleAvatar(
                  child: Icon(
                    Aircon.breathing,
                    size: 25,
                    color: primaryBlue,
                  ),
                  radius: 22,
                  backgroundColor: secondaryBlue,
                ),
                onPress: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SingingExercise(),
                  ),
                ),
              ),
              TaskCard(
                label: 'Aerobic exercise',
                description: 'Strengthens the heart and lungs',
                image: CircleAvatar(
                  child: Icon(
                    Aircon.aerobics,
                    size: 25,
                    color: primaryBlue,
                  ),
                  radius: 22,
                  backgroundColor: secondaryBlue,
                ),
                onPress: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AerobicExercise(),
                  ),
                ),
              ),
              TaskCard(
                label: 'Log your meals',
                description: 'Add breakfast',
                image: CircleAvatar(
                  child: Icon(
                    Aircon.food,
                    size: 25,
                    color: primaryBlue,
                  ),
                  radius: 22,
                  backgroundColor: secondaryBlue,
                ),
                onPress: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TrackFood(),
                  ),
                ),
              ),
              // TaskCard(
              //   label: 'Read your lesson',
              //   description: 'Lessons educate and inspire you',
              //   image: CircleAvatar(
              //     child: Icon(
              //       Aircon.food,
              //       size: 25,
              //       color: primaryBlue,
              //     ),
              //     radius: 22,
              //     backgroundColor: secondaryBlue,
              //   ),
              //   onPress: () => Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //       builder: (context) => CoachChat(),
              //     ),
              //   ),
              // ),
              TaskCard(
                label: 'Prednisolone 10mg',
                description: 'Take one tablet at 9:00 AM',
                image: CircleAvatar(
                  child: Icon(
                    Aircon.medicine,
                    size: 25,
                    color: primaryBlue,
                  ),
                  radius: 22,
                  backgroundColor: secondaryBlue,
                ),
                onPress: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CoachChat(),
                  ),
                ),
              ),
              YMargin(40),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 7),
                child: Text(
                  "My meal plan",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
                ),
              ),
              YMargin(7),
              TaskCard(
                label: 'Your meal plan',
                description: 'Made specifically for you ',
                image: CircleAvatar(
                  child: Icon(
                    Aircon.meal_plan,
                    size: 25,
                    color: primaryBlue,
                  ),
                  radius: 22,
                  backgroundColor: secondaryBlue,
                ),
              ),
              YMargin(8),
            ],
          ),
        ),
      ),
    );
  }
}
