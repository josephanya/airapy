import 'package:airapy/theme/theme.dart';
import 'package:airapy/utilities/margin.dart';
import 'package:airapy/widgets/appbar.dart';
import 'package:airapy/widgets/buttons.dart';
import 'package:airapy/widgets/default_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SingingExercise extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: CustomTetAppBar(
        title: '',
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              YMargin(5),
              DefaultCard(
                cardChild: Column(
                  children: [
                    Text(
                      'Singing uses the lungs to provide airflow to produce musical words or sounds with the voice. Singing can require a lot of effort for muscle contraction and co-ordination. This may benefit people with chronic obstructive pulmonary disease (COPD) in a manner similar to that of breathing exercises.',
                      style: GoogleFonts.openSans(
                        height: 1.35,
                        fontSize: 14.5,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    YMargin(15),
                    Text(
                      'Select 4 songs you like and sing along using the lyrics shown on your screen.',
                      style: GoogleFonts.openSans(
                        height: 1.35,
                        fontSize: 14.5,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  ],
                ),
              ),
              YMargin(30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    Text(
                      'Songs',
                      style: GoogleFonts.openSans(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: PrimaryButton(
          buttonText: 'Start',
          onPressed: () {},
        ),
      ),
    );
  }
}
