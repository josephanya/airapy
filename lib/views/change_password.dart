import 'package:airapy/widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:airapy/theme/theme.dart';
import 'package:airapy/utilities/margin.dart';
import 'package:airapy/view_models/change_password_vm.dart';
import 'package:airapy/widgets/buttons.dart';
import 'package:airapy/widgets/textfield.dart';

class ChangePassword extends StatefulWidget {
  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ChangePasswordViewModel>(context);
    return Scaffold(
      appBar: CustomSecAppBar(
        title: 'Change password',
      ),
      backgroundColor: background,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            YMargin(30),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 7),
                  child: Text(
                    'Current password',
                    style: GoogleFonts.openSans(
                        fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
            YMargin(7),
            SustainTextField(
              validator: (value) {
                if (value.isNotEmpty) {
                  return null;
                } else {
                  return 'This field can\'t be left empty';
                }
              },
              isTextArea: true,
              isPassword: false,
              autocorrect: false,
              isEmail: false,
              isPhone: false,
              isNumber: false,
              isEnabled: true,
              hintText: '',
              controller: provider.oldpassTEC,
            ),
            YMargin(30),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 7),
                  child: Text(
                    'New password',
                    style: GoogleFonts.openSans(
                        fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
            YMargin(7),
            SustainTextField(
              validator: (value) {
                if (value.isNotEmpty) {
                  return null;
                } else {
                  return 'This field can\'t be left empty';
                }
              },
              isTextArea: true,
              isPassword: false,
              autocorrect: false,
              isEmail: false,
              isPhone: false,
              isNumber: false,
              isEnabled: true,
              hintText: '',
              controller: provider.newpassTEC,
            ),
            YMargin(50),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: PrimaryButton(
          buttonText: 'Save',
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
