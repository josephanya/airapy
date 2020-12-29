import 'package:airapy/theme/theme.dart';
import 'package:airapy/utilities/margin.dart';
import 'package:flutter/material.dart';

class TaskCard extends StatelessWidget {
  final Function onPress;
  final String label;
  final String description;
  final Widget image;

  TaskCard({this.onPress, this.label, this.image, this.description});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 15.5, horizontal: 16),
        decoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.circular(13.0),
          boxShadow: [
            BoxShadow(
              color: Color(0xFFEEF4FC),
              offset: Offset(0, 0),
              blurRadius: 5.0,
              spreadRadius: 0,
            )
          ],
        ),
        margin: EdgeInsets.symmetric(
          vertical: 6.5,
        ),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Row(
                  children: <Widget>[image],
                ),
                XMargin(17),
                Row(
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          label,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w600),
                        ),
                        YMargin(5),
                        Text(
                          description,
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: grey),
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class StepsTaskCard extends StatelessWidget {
  final Function onPress;
  final String label;
  final Widget description;
  final Widget image;

  StepsTaskCard({this.onPress, this.label, this.image, this.description});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 15.5, horizontal: 16),
        decoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.circular(13.0),
          boxShadow: [
            BoxShadow(
              color: Color(0xFFEEF4FC),
              offset: Offset(0, 0),
              blurRadius: 5.0,
              spreadRadius: 0,
            )
          ],
        ),
        margin: EdgeInsets.symmetric(
          vertical: 6.5,
        ),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Row(
                  children: <Widget>[image],
                ),
                XMargin(17),
                Row(
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          label,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w600),
                        ),
                        YMargin(5),
                        description,
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
