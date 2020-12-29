import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:airapy/theme/theme.dart';
import 'package:airapy/widgets/appbar.dart';
import 'package:airapy/widgets/default_card.dart';

class ReadingsSteps extends StatefulWidget {
  @override
  _ReadingsStepsState createState() => _ReadingsStepsState();
}

class _ReadingsStepsState extends State<ReadingsSteps> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: CustomSecAppBar(
        title: 'All readings',
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(17, 20, 17, 7),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Date',
                      style: GoogleFonts.openSans(
                          fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'steps',
                      style: GoogleFonts.openSans(
                          fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              DefaultCard(
                cardChild: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '22 Aug, 2020',
                      style: GoogleFonts.openSans(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: black),
                    ),
                    Text(
                      '4721',
                      style: GoogleFonts.openSans(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: primaryBlue),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
