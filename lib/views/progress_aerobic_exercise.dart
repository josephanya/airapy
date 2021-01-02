import 'package:airapy/theme/theme.dart';
import 'package:airapy/widgets/appbar.dart';
import 'package:flutter/material.dart';

class ProgressAerobicExercise extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: CustomSecAppBar(
        title: 'Aerobic exercise',
      ),
      body: SafeArea(
        child: SingleChildScrollView(),
      ),
    );
  }
}
