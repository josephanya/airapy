import 'package:flutter/material.dart';

class ChangePasswordViewModel with ChangeNotifier {
  final TextEditingController oldpassTEC = new TextEditingController();
  final TextEditingController newpassTEC = new TextEditingController();
}
