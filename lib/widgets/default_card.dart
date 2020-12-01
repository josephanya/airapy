import 'package:airapy/theme/theme.dart';
import 'package:flutter/material.dart';

class DefaultCard extends StatelessWidget {
  final Function onPress;
  final Widget cardChild;

  DefaultCard({this.onPress, this.cardChild});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: 17.0, horizontal: 16),
          decoration: BoxDecoration(
            color: white,
            borderRadius: BorderRadius.circular(6.0),
            boxShadow: [
              BoxShadow(
                  color: Color(0xFFEEF4FC),
                  offset: Offset(.0, .0),
                  blurRadius: 5.0,
                  spreadRadius: 0)
            ],
          ),
          margin: EdgeInsets.symmetric(vertical: 5.0),
          child: cardChild),
    );
  }
}
