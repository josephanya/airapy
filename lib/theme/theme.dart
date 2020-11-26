import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Color background = Color(0XFFF3F6FC);
const Color white = Color(0XFFFFFFFF);
const Color primaryBlue = Color(0xFF0F2D5A);
const Color secondaryBlue = Color(0xFFDCE8F9);
const Color lightGrey = Color(0xffbdbdbd);
const Color grey = Color(0xff8e8e8e);
const Color black = Color(0xff000000);
const Color textfieldFill = Color(0xFFFFFFFF);
const Color green = Color(0xff34DB7A);
const Color red = Color(0xffF2513D);
const Color yellow = Color(0xffFFD556);
const Color gold = Color(0xffFFC107);

themeData(context) => ThemeData(
      textTheme: GoogleFonts.openSansTextTheme(
        Theme.of(context).textTheme,
      ),
      primarySwatch: Colors.blue,
      primaryColor: Colors.white,
      backgroundColor: background,
      accentColor: primaryBlue,
      visualDensity: VisualDensity.adaptivePlatformDensity,
    );
