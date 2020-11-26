import 'package:flutter/material.dart';
import 'package:airapy/utilities/margin.dart';

class CustomMainAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget trailing;
  final String title;
  const CustomMainAppBar({
    this.title,
    this.trailing,
    Key key,
  }) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(105);

  @override
  Widget build(BuildContext context) {
    double statusBarHeight = MediaQuery.of(context).padding.top;
    return Container(
      padding: EdgeInsets.fromLTRB(22, statusBarHeight, 22, 0),
      height: statusBarHeight + 75,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(color: Colors.black12, spreadRadius: 0, blurRadius: 2)
        ],
        color: Colors.white,
      ),
      width: MediaQuery.of(context).size.width,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
          ),
          trailing == null ? Container() : trailing,
        ],
      ),
    );
  }
}

class CustomSecAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget trailing;
  final String title;
  const CustomSecAppBar({
    this.title,
    this.trailing,
    Key key,
  }) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(90);

  @override
  Widget build(BuildContext context) {
    double statusBarHeight = MediaQuery.of(context).padding.top;
    return Container(
      padding: EdgeInsets.fromLTRB(15, statusBarHeight, 15, 0),
      height: statusBarHeight + 55,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(color: Colors.black12, spreadRadius: 0, blurRadius: 2)
        ],
        color: Colors.white,
      ),
      width: MediaQuery.of(context).size.width,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () => Navigator.maybePop(context),
            child: Icon(
              Icons.navigate_before,
              size: 35,
              color: Colors.black,
            ),
          ),
          Text(
            title,
            style: TextStyle(fontSize: 19, fontWeight: FontWeight.w700),
          ),
          trailing == null ? XMargin(35) : trailing,
        ],
      ),
    );
  }
}
