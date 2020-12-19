import 'package:airapy/theme/aircon_icons.dart';
import 'package:airapy/theme/theme.dart';
import 'package:airapy/utilities/margin.dart';
import 'package:airapy/views/coach_chat.dart';
import 'package:airapy/views/profile.dart';
import 'package:airapy/views/progress_food.dart';
import 'package:airapy/widgets/appbar.dart';
import 'package:airapy/widgets/default_card.dart';
import 'package:airapy/widgets/progress_card.dart';
import 'package:flutter/material.dart';

class Progress extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: CustomMainAppBar(
        title: 'Progress',
      ),
      body: SafeArea(
        child: SingleChildScrollView(
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
                      radius: 27.0,
                      backgroundImage: NetworkImage(
                          'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png'),
                    ),
                    XMargin(18),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Joseph Anya',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        YMargin(5),
                        Text(
                          'View profile',
                          style: TextStyle(
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
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
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
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ),
              ProgressCard(
                onPress: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CoachChat(),
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
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ),
              ProgressCard(
                onPress: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CoachChat(),
                    ),
                  );
                },
                cardImage: CircleAvatar(
                  child: Icon(
                    Aircon.medicine,
                    size: 26,
                    color: primaryBlue,
                  ),
                  radius: 22,
                  backgroundColor: secondaryBlue,
                ),
                label: Text(
                  'Medicines',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ),
              YMargin(40),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 7),
                child: Text(
                  'My exercises',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
                ),
              ),
              YMargin(7),
              ProgressCard(
                onPress: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CoachChat(),
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
                  'Aerobic exercise',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ),
              ProgressCard(
                onPress: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CoachChat(),
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
                  'Breathing exercise',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ),
              YMargin(10),
            ],
          ),
        ),
      ),
    );
  }
}
