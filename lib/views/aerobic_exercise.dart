import 'package:airapy/theme/theme.dart';
import 'package:airapy/utilities/margin.dart';
import 'package:airapy/widgets/appbar.dart';
import 'package:airapy/widgets/buttons.dart';
import 'package:airapy/widgets/default_card.dart';
import 'package:flutter/material.dart';

class AerobicExercise extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: CustomSecAppBar(
        title: 'Aerobic exercise',
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 13),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            YMargin(10),
            DefaultCard(
              cardChild: Image.asset("images/jumping_jack.gif"),
            ),
            YMargin(30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Text(
                'Jumping jacks',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            YMargin(20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Text(
                'Start with your feet together and your arms by your sides, then jump up with your feet apart and your hands over your head. Return to the start position and repeat.',
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
            ),
            YMargin(30),
            PrimaryButton(
              onPressed: () {},
              buttonText: 'Start',
            )
          ],
        ),
      ),
    );
  }
}
