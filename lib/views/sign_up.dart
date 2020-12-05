import 'package:airapy/utilities/bottom_navigator.dart';
import 'package:airapy/views/home.dart';
import 'package:airapy/widgets/loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:airapy/theme/theme.dart';
import 'package:airapy/utilities/margin.dart';
import 'package:airapy/utilities/validator.dart';
import 'package:airapy/view_models/user_auth_vm.dart';
import 'package:airapy/widgets/buttons.dart';
import 'package:airapy/widgets/textfield.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SignUpViewModel>(context);
    return Scaffold(
      backgroundColor: background,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 33),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            YMargin(context.screenHeight(percent: 0.2)),
            SvgPicture.asset(
              "images/logo.svg",
              color: primaryBlue,
              width: 140,
            ),
            YMargin(50),
            Form(
              key: provider.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
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
                    hintText: 'First name',
                    controller: provider.firstNameTEC,
                  ),
                  YMargin(25),
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
                    hintText: 'Last name',
                    controller: provider.lastNameTEC,
                  ),
                  YMargin(25),
                  SustainTextField(
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
                  YMargin(25),
                  SustainTextField(
                    validator: (value) {
                      if (Validator.isPassword(value)) {
                        return null;
                      } else if (value.isEmpty) {
                        return 'This field can\'t be left empty';
                      } else {
                        return 'Please enter a password with at least 6 characters';
                      }
                    },
                    isTextArea: true,
                    isPassword: true,
                    autocorrect: false,
                    isEmail: false,
                    isPhone: false,
                    isNumber: false,
                    isEnabled: true,
                    hintText: 'Password',
                    controller: provider.passwordTEC,
                  ),
                  YMargin(context.screenHeight(percent: 0.1)),
                ],
              ),
            ),
            provider.isLoading
                ? Loader()
                : PrimaryButton(
                    buttonText: 'Sign up',
                    onPressed: () {
                      if (provider.formKey.currentState.validate()) {
                        provider.signUp(context);
                      }
                    },
                  ),
            YMargin(60),
          ],
        ),
      ),
    );
  }
}
