import 'dart:io';

import 'package:airapy/models/user_model.dart';
import 'package:airapy/services/auth.dart';
import 'package:airapy/theme/theme.dart';
import 'package:airapy/utilities/margin.dart';
import 'package:airapy/views/change_password.dart';
import 'package:airapy/views/edit_profile.dart';
import 'package:airapy/views/invite_friend.dart';
import 'package:airapy/views/sign_in.dart';
import 'package:airapy/widgets/appbar.dart';
import 'package:airapy/widgets/custom_flashbar.dart';
import 'package:airapy/widgets/default_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  launchURL(String url, {BuildContext context}) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      showOverlayNotification((context) {
        return CustomFlashbar(
          title: 'An error occured',
          subtitle: 'Please try again later',
          action: () {},
          color: red,
        );
      }, duration: Duration(milliseconds: 3000));
    }
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<UserModel>(context);
    return Scaffold(
      backgroundColor: background,
      appBar: CustomSecAppBar(
        title: 'Profile',
      ),
      body: SafeArea(
        child: provider == null
            ? Center(
                child: Platform.isAndroid
                    ? CircularProgressIndicator()
                    : CupertinoActivityIndicator(),
              )
            : StreamBuilder(
                stream: Firestore.instance
                    .collection('users')
                    .document(provider.userID)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: Platform.isAndroid
                          ? CircularProgressIndicator()
                          : CupertinoActivityIndicator(),
                    );
                  }
                  return SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: 13),
                    child: Column(
                      children: <Widget>[
                        YMargin(20),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 10),
                          child: Row(
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.grey[300],
                                radius: 35.0,
                                backgroundImage:
                                    snapshot.data['profilePic'] != ''
                                        ? NetworkImage(
                                            snapshot.data['profilePic'],
                                          )
                                        : AssetImage('images/blank-avatar.png'),
                              ),
                              XMargin(18),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${provider.firstName} ${provider.lastName}',
                                    style: GoogleFonts.openSans(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  YMargin(4),
                                  Text(
                                    snapshot.data['location'],
                                    style: GoogleFonts.openSans(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400,
                                      color: grey,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        YMargin(15),
                        Row(
                          children: [
                            Flexible(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                child: Text(
                                  snapshot.data['bio'],
                                  textAlign: TextAlign.start,
                                  style: GoogleFonts.openSans(
                                    fontSize: 14.3,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 15.0),
                          child: Divider(
                            color: lightGrey,
                          ),
                        ),
                        DefaultCard(
                          onPress: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => EditProfile(),
                            ),
                          ),
                          cardChild: Text(
                            'Edit profile',
                            style: GoogleFonts.openSans(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        DefaultCard(
                          onPress: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => InviteFriend(),
                            ),
                          ),
                          cardChild: Text(
                            'Invite a friend',
                            style: GoogleFonts.openSans(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        // DefaultCard(
                        //   onPress: () => Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //       builder: (context) => ChangePassword(),
                        //     ),
                        //   ),
                        //   cardChild: Text(
                        //     'Change password',
                        //     style: GoogleFonts.openSans(
                        //       fontSize: 15,
                        //       fontWeight: FontWeight.w600,
                        //     ),
                        //   ),
                        // ),
                        // DefaultCard(
                        //   onPress: () => Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //       builder: (context) => CreatePinCode(),
                        //     ),
                        //   ),
                        //   cardChild: Text(
                        //     'Pin code',
                        //     style: TextStyle(
                        //       fontSize: 15,
                        //       fontWeight: FontWeight.w600,
                        //     ),
                        //   ),
                        // ),
                        DefaultCard(
                          onPress: () {
                            const url =
                                'https://getairapy.app/terms-of-service';
                            launchURL(url, context: context);
                          },
                          cardChild: Text(
                            'Terms of service',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        DefaultCard(
                          onPress: () {
                            const url = 'https://getairapy.app/privacy-policy';
                            launchURL(url, context: context);
                          },
                          cardChild: Text(
                            'Privacy policy',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        YMargin(45),
                        DefaultCard(
                          onPress: () async {
                            Auth().signOut();
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SignIn(),
                                ),
                                ModalRoute.withName("/Home"));
                          },
                          cardChild: Text(
                            'Log out',
                            style: GoogleFonts.openSans(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: red,
                            ),
                          ),
                        ),
                        YMargin(10),
                      ],
                    ),
                  );
                },
              ),
      ),
    );
  }
}
