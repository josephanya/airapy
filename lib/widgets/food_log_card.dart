import 'package:airapy/utilities/margin.dart';
import 'package:flutter/material.dart';
import 'package:airapy/theme/theme.dart';
import 'package:google_fonts/google_fonts.dart';
import 'default_card.dart';
import 'package:intl/intl.dart';

class FoodLogCard extends StatelessWidget {
  final String mealType;
  final String meal;
  final String healthiness;
  final String portionSize;
  final String coachNote;
  final String imageLink;
  final DateTime date;

  const FoodLogCard(
      {this.coachNote,
      this.mealType,
      this.portionSize,
      this.healthiness,
      this.meal,
      this.imageLink,
      this.date});

  @override
  Widget build(BuildContext context) {
    return DefaultCard(
      cardChild: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                mealType,
                style: GoogleFonts.openSans(
                    fontSize: 16, fontWeight: FontWeight.w600),
              ),
              Text(
                DateFormat.yMMMd().format(date),
                style: GoogleFonts.openSans(
                    fontSize: 12, color: grey, fontWeight: FontWeight.w500),
              ),
            ],
          ),
          YMargin(7),
          Text(
            meal,
            style: GoogleFonts.openSans(
                fontSize: 15, color: Colors.black, fontWeight: FontWeight.w600),
          ),
          YMargin(
            13,
          ),
          Row(
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'HEALTHINESS',
                    style: GoogleFonts.openSans(
                        fontSize: 12, color: grey, fontWeight: FontWeight.w500),
                  ),
                  YMargin(
                    5,
                  ),
                  Text(
                    healthiness,
                    style: GoogleFonts.openSans(
                        fontSize: 15,
                        color: Colors.black,
                        fontWeight: FontWeight.w600),
                  )
                ],
              ),
              XMargin(
                90,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'PORTION SIZE',
                    style: GoogleFonts.openSans(
                        fontSize: 12, color: grey, fontWeight: FontWeight.w500),
                  ),
                  YMargin(
                    5,
                  ),
                  Text(
                    portionSize,
                    style: GoogleFonts.openSans(
                        fontSize: 15,
                        color: Colors.black,
                        fontWeight: FontWeight.w600),
                  )
                ],
              ),
            ],
          ),
          YMargin(
            14,
          ),
          Divider(
            height: 14,
          ),
          YMargin(
            5,
          ),
          Text(
            'COACH’S NOTES',
            style: GoogleFonts.openSans(
                fontSize: 12, color: grey, fontWeight: FontWeight.w500),
          ),
          YMargin(
            6,
          ),
          Text(
            coachNote,
            style: GoogleFonts.openSans(
                fontSize: 15, color: Colors.black, fontWeight: FontWeight.w600),
          )
        ],
      ),
    );
  }
}
