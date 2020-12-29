import 'package:flutter/material.dart';
import 'package:airapy/theme/theme.dart';
import 'package:google_fonts/google_fonts.dart';

class PrimaryButton extends StatelessWidget {
  final String buttonText;
  final Function onPressed;
  PrimaryButton({this.buttonText, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.infinity,
      child: FlatButton(
        color: primaryBlue,
        onPressed: onPressed,
        child: Text(
          buttonText,
          style: GoogleFonts.openSans(
              fontSize: 15, color: Colors.white, fontWeight: FontWeight.w600),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}

class TransparentButton extends StatelessWidget {
  final String buttonText;
  final Function onPressed;
  TransparentButton({this.buttonText, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.infinity,
      child: FlatButton(
        onPressed: onPressed,
        child: Text(
          buttonText,
          style: GoogleFonts.openSans(
              color: primaryBlue, fontSize: 15, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
