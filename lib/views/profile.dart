import 'package:airapy/theme/theme.dart';
import 'package:airapy/widgets/appbar.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: CustomSecAppBar(
        title: 'Profile',
      ),
      body: SingleChildScrollView(),
    );
  }
}
