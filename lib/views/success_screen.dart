import 'package:flutter/material.dart';
import 'package:airapy/utilities/margin.dart';
import 'package:airapy/widgets/buttons.dart';
import 'package:google_fonts/google_fonts.dart';

class SuccessScreen extends StatelessWidget {
  final String title, subtitle, image;
  SuccessScreen({
    this.title,
    this.subtitle,
    this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                YMargin(
                  context.screenHeight(percent: 0.25),
                ),
                Image.asset(
                  image,
                  width: 130.0,
                ),
                YMargin(50),
                Text(
                  title,
                  style: GoogleFonts.openSans(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                YMargin(25),
                Text(
                  subtitle,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.openSans(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: PrimaryButton(
          buttonText: 'Continue',
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
