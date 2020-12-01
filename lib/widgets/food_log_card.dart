import 'package:flutter/material.dart';
import 'package:airapy/theme/theme.dart';
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
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              Text(
                DateFormat.yMMMd().format(date),
                style: TextStyle(
                    fontSize: 12, color: grey, fontWeight: FontWeight.w500),
              ),
            ],
          ),
          SizedBox(height: 8),
          Text(
            meal,
            style: TextStyle(
                fontSize: 15, color: Colors.black, fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 13,
          ),
          Row(
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'HEALTHINESS',
                    style: TextStyle(
                        fontSize: 12, color: grey, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    healthiness,
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                        fontWeight: FontWeight.w600),
                  )
                ],
              ),
              SizedBox(
                width: 90,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'PORTION SIZE',
                    style: TextStyle(
                        fontSize: 12, color: grey, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    portionSize,
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                        fontWeight: FontWeight.w600),
                  )
                ],
              ),
            ],
          ),
          SizedBox(
            height: 14,
          ),
          Divider(
            height: 14,
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            'COACH’S NOTES',
            style: TextStyle(
                fontSize: 12, color: grey, fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 6,
          ),
          Text(
            coachNote,
            style: TextStyle(
                fontSize: 15, color: Colors.black, fontWeight: FontWeight.w600),
          )
        ],
      ),
    );
  }
}
