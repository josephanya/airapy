import 'dart:io';
import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:airapy/services/notifications_manager.dart';
import 'package:airapy/theme/aircon_icons.dart';
import 'package:airapy/theme/theme.dart';
import 'package:airapy/views/coach_chat.dart';
import 'package:airapy/views/home.dart';
import 'package:airapy/views/lessons.dart';
import 'package:airapy/views/progress.dart';
import 'package:airapy/widgets/custom_flashbar.dart';

// import 'pages/screens/group_chat.dart';

class MyBottomNavigator extends StatefulWidget {
  @override
  _MyBottomNavigatorState createState() => _MyBottomNavigatorState();
}

class _MyBottomNavigatorState extends State<MyBottomNavigator> {
  int _selectedIndex = 0;
  static TextStyle optionStyle =
      TextStyle(fontSize: 12, fontWeight: FontWeight.w500);
  static List<Widget> _widgetOptions = <Widget>[
    Home(),
    CoachChat(),
    Progress(),
    Lessons(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (index == 1) {
        _newNotifications = false;
      }
    });
  }

  bool _newNotifications = false;

  void registerNotification() {
    FirebaseMessaging().configure(
        onMessage: (Map<String, dynamic> message) async {
      print('onMessage: $message');
      // Platform.isAndroid
      //     ? NotificationsManager().showNotification(
      //         0,
      //         message['notification']['title'].toString(),
      //         message['notification']['body'].toString(),
      //         json.encode(message['anotification']),
      //       )
      //     : NotificationsManager().showNotification(
      //         0,
      //         message['aps']['alert']['title'].toString(),
      //         message['aps']['alert']['body'].toString(),
      //         json.encode(message['aps']['alert']),
      //       );
      showOverlayNotification((context) {
        return CustomFlashbar(
          color: primaryBlue,
          title: message['notification']['title'].toString(),
          subtitle: message['notification']['body'].toString(),
          action: () {},
        );
      }, duration: Duration(milliseconds: 3000));
      setState(() {
        _newNotifications = true;
      });
    }, onResume: (Map<String, dynamic> message) async {
      print('onResume: $message');
      Platform.isAndroid
          ? NotificationsManager().showNotification(
              0,
              message['notification']['title'].toString(),
              message['notification']['body'].toString(),
              json.encode(message['anotification']),
            )
          : NotificationsManager().showNotification(
              0,
              message['aps']['alert']['title'].toString(),
              message['aps']['alert']['body'].toString(),
              json.encode(message['aps']['alert']),
            );
    }, onLaunch: (Map<String, dynamic> message) async {
      print('onLaunch: $message');
      Platform.isAndroid
          ? NotificationsManager().showNotification(
              0,
              message['notification']['title'].toString(),
              message['notification']['body'].toString(),
              json.encode(message['anotification']),
            )
          : NotificationsManager().showNotification(
              0,
              message['aps']['alert']['title'].toString(),
              message['aps']['alert']['body'].toString(),
              json.encode(message['aps']['alert']),
            );
    });
  }

  _saveDeviceToken() async {
    final user = await FirebaseAuth.instance.currentUser();
    FirebaseMessaging().getToken().then((token) {
      Firestore.instance
          .collection('users')
          .document(user.uid)
          .updateData({'pushToken': token});
    });
  }

  @override
  void initState() {
    super.initState();
    _saveDeviceToken();
    registerNotification();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: Scaffold(
        body: _widgetOptions[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Aircon.home),
              title: Text(
                'Home',
                style: TextStyle(fontSize: 13),
              ),
            ),
            BottomNavigationBarItem(
              icon: _newNotifications
                  ? Stack(
                      children: <Widget>[
                        Icon(Aircon.chat),
                        Positioned(
                          right: 0,
                          child: Container(
                            padding: EdgeInsets.all(1),
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            constraints: BoxConstraints(
                              minWidth: 13,
                              minHeight: 13,
                            ),
                            child: Text(
                              '',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 8,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        )
                      ],
                    )
                  : Icon(Aircon.chat),
              title: Text(
                'Coach',
                style: TextStyle(fontSize: 13),
              ),
            ),
            // BottomNavigationBarItem(
            //   icon: Icon(Sustcon.group),
            //   title: Text(
            //     'Group',
            //     style: TextStyle(fontSize: 13),
            //   ),
            // ),
            BottomNavigationBarItem(
              icon: Icon(Aircon.progress),
              title: Text(
                'Progress',
                style: TextStyle(fontSize: 13),
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(Aircon.lessons),
              title: Text(
                'Lessons',
                style: TextStyle(fontSize: 13),
              ),
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: primaryBlue,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
