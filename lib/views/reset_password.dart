import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:airapy/utilities/margin.dart';
import 'package:airapy/view_models/user_auth_vm.dart';
import 'package:airapy/theme/theme.dart';
import 'package:airapy/utilities/validator.dart';
import 'package:airapy/widgets/buttons.dart';
import 'package:airapy/widgets/loader.dart';
import 'package:airapy/widgets/textfield.dart';

class ResetPassword extends StatefulWidget {
  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ResetPasswordViewModel>(context);
    return Scaffold(
      backgroundColor: background,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 55),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            YMargin(context.screenHeight(percent: 0.17)),
            Text(
              'Forgot your password',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w700,
                color: primaryBlue,
              ),
            ),
            YMargin(30),
            Text(
              'If you have forgotten your password, enter your email address and we will send you a link to reset your password',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 15),
            ),
            YMargin(50),
            Form(
              key: provider.formKey,
              child: SustainTextField(
                validator: (value) {
                  if (Validator.isEmail(value)) {
                    return null;
                  } else if (value.isEmpty) {
                    return 'This field can\'t be left empty';
                  } else {
                    return 'Please enter a valid email';
                  }
                },
                isTextArea: true,
                isPassword: false,
                autocorrect: false,
                isEmail: true,
                isPhone: false,
                isNumber: false,
                isEnabled: true,
                hintText: 'Email address',
                controller: provider.emailTEC,
              ),
            ),
            YMargin(70),
            provider.isLoading
                ? Loader()
                : PrimaryButton(
                    buttonText: 'Reset password',
                    onPressed: () {
                      if (provider.formKey.currentState.validate()) {
                        provider.resetPassword(context);
                      }
                    },
                  ),
            YMargin(context.screenHeight(percent: 0.17)),
          ],
        ),
      ),
    );
  }
}
