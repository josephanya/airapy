import 'package:flutter/material.dart';

class ProgressCard extends StatelessWidget {
  final Function onPress;
  final Widget cardImage;
  final Widget label;

  ProgressCard({this.onPress, this.cardImage, this.label});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 14.0, horizontal: 13),
        decoration: BoxDecoration(
          color: Colors.white,
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
          vertical: 6,
        ),
        child: Row(
          children: <Widget>[
            cardImage,
            SizedBox(width: 20),
            label,
          ],
        ),
      ),
    );
  }
}
