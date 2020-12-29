import 'dart:io';

import 'package:airapy/models/user_model.dart';
import 'package:airapy/services/auth.dart';
import 'package:airapy/theme/theme.dart';
import 'package:airapy/utilities/margin.dart';
import 'package:airapy/views/change_password.dart';
import 'package:airapy/views/sign_in.dart';
import 'package:airapy/widgets/appbar.dart';
import 'package:airapy/widgets/default_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
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
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  YMargin(4),
                                  Text(
                                    snapshot.data['location'],
                                    style: TextStyle(
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
                        YMargin(13),
                        Row(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5),
                              child: snapshot.data['bio'] == ''
                                  ? Text(
                                      'Edit your profile to add a bio',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: grey,
                                      ),
                                    )
                                  : Text(
                                      snapshot.data['bio'],
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: Divider(
                            color: grey,
                          ),
                        ),
                        DefaultCard(
                          onPress: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SignIn(),
                            ),
                          ),
                          cardChild: Text(
                            'Edit profile',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        DefaultCard(
                          onPress: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SignIn(),
                            ),
                          ),
                          cardChild: Text(
                            'Invite a friend',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        DefaultCard(
                          onPress: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ChangePassword(),
                            ),
                          ),
                          cardChild: Text(
                            'Change password',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
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
                        // DefaultCard(
                        //   onPress: () {
                        //     const url =
                        //         'https://sustain.lifebox.ng/terms-of-service';
                        //     launchURL(url, context: context);
                        //   },
                        //   cardChild: Text(
                        //     'Terms of service',
                        //     style: TextStyle(
                        //       fontSize: 16,
                        //       fontWeight: FontWeight.w600,
                        //     ),
                        //   ),
                        // ),
                        // DefaultCard(
                        //   onPress: () {
                        //     const url =
                        //         'https://sustain.lifebox.ng/privacy-policy';
                        //     launchURL(url, context: context);
                        //   },
                        //   cardChild: Text(
                        //     'Privacy policy',
                        //     style: TextStyle(
                        //       fontSize: 15,
                        //       fontWeight: FontWeight.w600,
                        //     ),
                        //   ),
                        // ),
                        YMargin(50),
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
                            style: TextStyle(
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
