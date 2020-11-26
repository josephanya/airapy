import 'package:flutter/material.dart';
import 'package:airapy/theme/theme.dart';

class CustomFlashbar extends StatelessWidget {
  final String title, subtitle;
  final Function action;
  final Color color;

  const CustomFlashbar({
    this.title,
    this.subtitle,
    this.action,
    this.color,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 50),
      child: Card(
        color: color,
        margin: const EdgeInsets.symmetric(horizontal: 4),
        child: GestureDetector(
          onTap: action,
          child: ListTile(
            title: Text(
              title,
              style: TextStyle(
                fontSize: 15,
                color: white,
                fontWeight: FontWeight.w600,
              ),
            ),
            subtitle: Text(
              subtitle,
              style: TextStyle(
                fontSize: 13,
                color: white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
