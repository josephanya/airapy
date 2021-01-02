import 'package:airapy/theme/theme.dart';
import 'package:airapy/widgets/appbar.dart';
import 'package:flutter/material.dart';

class ProgressBreathingExercise extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: CustomSecAppBar(
        title: 'Breathing exercise',
      ),
      body: SafeArea(
        child: SingleChildScrollView(),
      ),
    );
  }
}
