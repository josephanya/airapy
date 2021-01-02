import 'dart:io';
import 'package:airapy/models/user_model.dart';
import 'package:airapy/theme/aircon_icons.dart';
import 'package:airapy/theme/theme.dart';
import 'package:airapy/utilities/margin.dart';
import 'package:airapy/views/coach_chat.dart';
import 'package:airapy/views/profile.dart';
import 'package:airapy/views/progress_aerobic_exercise.dart';
import 'package:airapy/views/progress_breathing_exercise.dart';
import 'package:airapy/views/progress_food.dart';
import 'package:airapy/views/readings_steps.dart';
import 'package:airapy/widgets/appbar.dart';
import 'package:airapy/widgets/default_card.dart';
import 'package:airapy/widgets/progress_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Progress extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<UserModel>(context);
    return Scaffold(
      backgroundColor: background,
      appBar: CustomMainAppBar(
        title: 'Progress',
      ),
      body: SafeArea(
        child: StreamBuilder(
            stream: Firestore.instance
                .collection('users')
                .document(provider.userID)
                .snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: Platform.isAndroid
                      ? CircularProgressIndicator()
                      : CupertinoActivityIndicator(),
                );
              }
              return SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 13),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    YMargin(10),
                    DefaultCard(
                      onPress: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Profile(),
                        ),
                      ),
                      cardChild: Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.grey[300],
                            radius: 28.0,
                            backgroundImage: snapshot.data['profilePic'] != ''
                                ? NetworkImage(
                                    snapshot.data['profilePic'],
                                  )
                                : AssetImage('images/blank-avatar.png'),
                          ),
                          XMargin(18),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${provider.firstName} ${provider.lastName}',
                                style: GoogleFonts.openSans(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              YMargin(5),
                              Text(
                                'View profile',
                                style: GoogleFonts.openSans(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: grey,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    YMargin(40),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 7),
                      child: Text(
                        'My habits',
                        style: GoogleFonts.openSans(
                            fontSize: 15, fontWeight: FontWeight.w700),
                      ),
                    ),
                    YMargin(7),
                    ProgressCard(
                      onPress: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => FoodProgress(),
                          ),
                        );
                      },
                      cardImage: CircleAvatar(
                        child: Icon(
                          Aircon.food,
                          size: 26,
                          color: primaryBlue,
                        ),
                        radius: 22,
                        backgroundColor: secondaryBlue,
                      ),
                      label: Text(
                        'Food and drinks',
                        style: GoogleFonts.openSans(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                    ),
                    ProgressCard(
                      onPress: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ReadingsSteps(),
                          ),
                        );
                      },
                      cardImage: CircleAvatar(
                        child: Icon(
                          Aircon.steps,
                          size: 26,
                          color: primaryBlue,
                        ),
                        radius: 22,
                        backgroundColor: secondaryBlue,
                      ),
                      label: Text(
                        'Steps',
                        style: GoogleFonts.openSans(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                    ),
                    YMargin(40),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 7),
                      child: Text(
                        'My exercises',
                        style: GoogleFonts.openSans(
                            fontSize: 15, fontWeight: FontWeight.w700),
                      ),
                    ),
                    YMargin(7),
                    ProgressCard(
                      onPress: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProgressAerobicExercise(),
                          ),
                        );
                      },
                      cardImage: CircleAvatar(
                        child: Icon(
                          Aircon.aerobics,
                          size: 26,
                          color: primaryBlue,
                        ),
                        radius: 22,
                        backgroundColor: secondaryBlue,
                      ),
                      label: Text(
                        'Aerobic exercise',
                        style: GoogleFonts.openSans(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                    ),
                    ProgressCard(
                      onPress: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProgressBreathingExercise(),
                          ),
                        );
                      },
                      cardImage: CircleAvatar(
                        child: Icon(
                          Aircon.breathing,
                          size: 26,
                          color: primaryBlue,
                        ),
                        radius: 22,
                        backgroundColor: secondaryBlue,
                      ),
                      label: Text(
                        'Breathing exercise',
                        style: GoogleFonts.openSans(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                    ),
                    YMargin(10),
                  ],
                ),
              );
            }),
      ),
    );
  }
}
