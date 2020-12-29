import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:airapy/models/user_model.dart';
import 'package:airapy/theme/theme.dart';
import 'package:airapy/utilities/margin.dart';
import 'package:airapy/utilities/validator.dart';
import 'package:airapy/view_models/edit_profile_vm.dart';
import 'package:airapy/widgets/appbar.dart';
import 'package:airapy/widgets/buttons.dart';
import 'package:airapy/widgets/textfield.dart';

class EditProfile extends StatefulWidget {
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      var provider = Provider.of<EditProfileViewModel>(context, listen: false);
      provider.fetchPreferences();
    });
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<UserModel>(context);
    var provider2 = Provider.of<EditProfileViewModel>(context);
    return Scaffold(
      appBar: CustomSecAppBar(
        title: 'Edit profile',
      ),
      backgroundColor: background,
      body: StreamBuilder(
        stream: Firestore.instance
            .collection('users')
            .document(provider.userID)
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Container();
          }
          return SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                YMargin(45),
                CircleAvatar(
                  radius: 45.0,
                  backgroundImage: provider2.image != null
                      ? FileImage(File(provider2.image.path))
                      : NetworkImage(snapshot.data['profilePic'] != ''
                          ? snapshot.data['profilePic']
                          : 'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png'),
                ),
                YMargin(22),
                GestureDetector(
                  child: Text(
                    'Change profile photo',
                    style: GoogleFonts.openSans(
                        fontSize: 13, fontWeight: FontWeight.w600),
                  ),
                  onTap: () => provider2.getImage(),
                ),
                YMargin(24),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 7),
                      child: Text(
                        'Bio',
                        style: GoogleFonts.openSans(
                            fontSize: 14, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
                YMargin(7),
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
                  hintText: '',
                  controller: provider2.bioTEC,
                ),
                YMargin(30),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 7),
                      child: Text(
                        'Location',
                        style: GoogleFonts.openSans(
                            fontSize: 14, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
                YMargin(7),
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
                  hintText: '',
                  controller: provider2.locationTEC,
                ),
                YMargin(100),
              ],
            ),
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: PrimaryButton(
          buttonText: 'Save',
          onPressed: () {
            provider2.updateProfile(context);
          },
        ),
      ),
    );
  }
}
