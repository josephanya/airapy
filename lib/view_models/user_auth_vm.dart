import 'package:airapy/services/auth.dart';
import 'package:airapy/theme/theme.dart';
import 'package:airapy/utilities/bottom_navigator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:airapy/models/user_model.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:airapy/widgets/custom_flashbar.dart';

class SignUpViewModel with ChangeNotifier {
  Auth auth = Auth();
  var formKey1 = GlobalKey<FormState>();
  var formKey2 = GlobalKey<FormState>();

  final TextEditingController firstNameTEC = new TextEditingController();
  final TextEditingController lastNameTEC = new TextEditingController();
  final TextEditingController emailTEC = new TextEditingController();
  final TextEditingController passwordTEC = new TextEditingController();

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  set isLoading(bool val) {
    _isLoading = val;
    notifyListeners();
  }

  signUp(BuildContext context) async {
    try {
      _isLoading = true;
      notifyListeners();
      var user = await auth.signUp(emailTEC.text, passwordTEC.text);
      if (user != null) {}
      UserModel userModel = UserModel(
        userID: user.uid,
        firstName: firstNameTEC.text,
        lastName: lastNameTEC.text,
        email: emailTEC.text,
        profilePic: '',
        stepGoal: '',
        coachID: '87KgDALRWfOHZ2r3QWZcgPeZgB53',
        mealPlan: '',
        isActivated: true,
        creationDate: DateTime.now(),
      );
      await auth.createUserProfile(userModel);
      UserUpdateInfo updateInfo = UserUpdateInfo();
      updateInfo.displayName = firstNameTEC.text;
      user.updateProfile(updateInfo);
      firstNameTEC.text = '';
      lastNameTEC.text = '';
      emailTEC.text = '';
      passwordTEC.text = '';
      notifyListeners();
      if (user != null) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => MyBottomNavigator(),
          ),
        );
      }
      isLoading = false;
      notifyListeners();
    } catch (error) {
      isLoading = false;
      notifyListeners();
      print(error.toString());
      showOverlayNotification((context) {
        return CustomFlashbar(
          color: red,
          title: 'Error',
          subtitle: 'An Error has occurred',
          action: () {},
        );
      }, duration: Duration(milliseconds: 3000));
    }
  }
}

class SignInViewModel with ChangeNotifier {
  Auth auth = Auth();
  var formKey = GlobalKey<FormState>();

  final TextEditingController emailTEC = new TextEditingController();
  final TextEditingController passwordTEC = new TextEditingController();

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  set isLoading(bool val) {
    _isLoading = val;
    notifyListeners();
  }

  signIn(BuildContext context) async {
    try {
      _isLoading = true;
      notifyListeners();
      var user = await auth.signIn(emailTEC.text, passwordTEC.text);
      notifyListeners();
      if (user != null) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => MyBottomNavigator(),
          ),
        );
      }
      isLoading = false;
      notifyListeners();
      emailTEC.text = '';
      passwordTEC.text = '';
      notifyListeners();
    } catch (e) {
      isLoading = false;
      notifyListeners();
      if (e.toString().contains('ERROR_WRONG_PASSWORD')) {
        showOverlayNotification((context) {
          return CustomFlashbar(
            title: 'Invalid password',
            subtitle: 'Your password is invalid',
            action: () {},
            color: red,
          );
        }, duration: Duration(milliseconds: 3000));
      } else if (e.toString().contains('ERROR_TOO_MANY_REQUESTS')) {
        showOverlayNotification((context) {
          return CustomFlashbar(
            title: 'Error',
            subtitle: 'Too many unsuccessful login attempts',
            action: () {},
            color: red,
          );
        }, duration: Duration(milliseconds: 3000));
      } else if (e.toString().contains('ERROR_USER_NOT_FOUND')) {
        showOverlayNotification((context) {
          return CustomFlashbar(
            title: 'Error',
            subtitle: 'This User does not exist',
            action: () {},
            color: red,
          );
        }, duration: Duration(milliseconds: 3000));
      } else if (e.toString().contains('not a')) {
        showOverlayNotification((context) {
          return CustomFlashbar(
            title: 'Error',
            subtitle: e.toString() ?? '',
            action: () {},
            color: red,
          );
        }, duration: Duration(milliseconds: 3000));
      } else {
        showOverlayNotification((context) {
          return CustomFlashbar(
            title: 'Error',
            subtitle: 'An Error has occurred',
            action: () {},
            color: red,
          );
        }, duration: Duration(milliseconds: 3000));
      }
    }
  }
}

class ResetPasswordViewModel with ChangeNotifier {
  Auth auth = Auth();
  var formKey = GlobalKey<FormState>();

  final TextEditingController emailTEC = new TextEditingController();

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  set isLoading(bool val) {
    _isLoading = val;
    notifyListeners();
  }

  void resetPassword(BuildContext context) async {
    try {
      _isLoading = true;
      notifyListeners();
      auth.resetPassword(emailTEC.text);
      emailTEC.text = '';
      notifyListeners();
      Navigator.pop(context);
      showOverlayNotification((context) {
        return CustomFlashbar(
          title: 'Successfully sent!',
          subtitle:
              'You should recieve an email shortly with a link to reset your password',
          action: () {},
          color: primaryBlue,
        );
      }, duration: Duration(milliseconds: 3000));
    } catch (e) {
      isLoading = false;
      notifyListeners();
      showOverlayNotification((context) {
        return CustomFlashbar(
          color: red,
          title: 'Error',
          subtitle: 'An Error has occurred',
          action: () {},
        );
      }, duration: Duration(milliseconds: 3000));
    }
  }
}
