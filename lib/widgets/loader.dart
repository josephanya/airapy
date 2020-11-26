import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;

class Loader extends StatelessWidget {
  const Loader({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
              width: 30,
              height: 30,
              color: Colors.white,
              child: Platform.isAndroid ? CircularProgressIndicator() : CupertinoActivityIndicator()
            ),
        ],
      ),
    );
  }
}
