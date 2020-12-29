import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:airapy/utilities/margin.dart';
import 'package:airapy/view_models/user_auth_vm.dart';
import 'package:airapy/theme/theme.dart';
import 'package:airapy/utilities/validator.dart';
import 'package:airapy/views/reset_password.dart';
import 'package:airapy/views/sign_up.dart';
import 'package:airapy/widgets/buttons.dart';
import 'package:airapy/widgets/loader.dart';
import 'package:airapy/widgets/textfield.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SignInViewModel>(context);
    return Scaffold(
      backgroundColor: background,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 33),
        child: Column(
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
                        return 'Please enter a password with atlest 6 characters';
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
                  YMargin(
                    context.screenHeight(percent: 0.1),
                  ),
                ],
              ),
            ),
            provider.isLoading
                ? Loader()
                : PrimaryButton(
                    buttonText: 'Log in',
                    onPressed: () {
                      if (provider.formKey.currentState.validate()) {
                        provider.signIn(context);
                      }
                    },
                  ),
            SizedBox(height: 30),
            GestureDetector(
              child: Text(
                'Forgot password?',
                style: GoogleFonts.openSans(
                    color: grey, fontSize: 14, fontWeight: FontWeight.w400),
              ),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResetPassword(),
                ),
              ),
            ),
            YMargin(context.screenHeight(percent: 0.17)),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Don’t have an account?',
              style: GoogleFonts.openSans(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: grey,
              ),
            ),
            XMargin(6),
            GestureDetector(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SignUp(),
                ),
              ),
              child: Text(
                'Sign up',
                style: GoogleFonts.openSans(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: primaryBlue,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
