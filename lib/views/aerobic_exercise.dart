import 'package:airapy/widgets/appbar.dart';
import 'package:flutter/material.dart';

class AerobicExercise extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomSecAppBar(
        title: 'Aerobic exercise',
      ),
      body: SingleChildScrollView(),
    );
  }
}
