import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationsManager {
  var flutterLocalNotificationsPlugin;

  NotificationsManager() {
    flutterLocalNotificationsPlugin = new FlutterLocalNotificationsPlugin();
    initNotifications();
  }

  void initNotifications() async {
    var initializationSettingsAndroid =
        new AndroidInitializationSettings('app_icon');
    var initializationSettingsIOS = IOSInitializationSettings(
        onDidReceiveLocalNotification: onDidReceiveLocalNotification);

    var initializationSettings = InitializationSettings(
        initializationSettingsAndroid, initializationSettingsIOS);

    await flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: onSelectNotification);
  }

  Future onSelectNotification(String payload) async {
    if (payload != null) {
      print('notification payload: ' + payload);
    }
  }

  Future onDidReceiveLocalNotification(
      int id, String title, String body, String payload) async {
    return Future.value(1);
  }

  getPlatformChannelSpecfics() {
    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
        'ng.lifebox.sustain', 'Sustain', 'your channel description',
        playSound: true,
        enableLights: true,
        enableVibration: true,
        importance: Importance.Max,
        priority: Priority.High,
        ticker: 'Sustain');
    var iOSPlatformChannelSpecifics = IOSNotificationDetails();
    var platformChannelSpecifics = NotificationDetails(
        androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);

    return platformChannelSpecifics;
  }

  void showNotification(
      int id, String title, String body, dynamic payload) async {
    await flutterLocalNotificationsPlugin
        .show(id, title, body, getPlatformChannelSpecfics(), payload: payload);
    print(payload);
  }

  void showNotificationDaily(
      int id, String title, String body, int hour, int minute) async {
    var time = new Time(hour, minute, 0);
    await flutterLocalNotificationsPlugin.showDailyAtTime(
        id, title, body, time, getPlatformChannelSpecfics());
    print('Notification Succesfully Scheduled at ${time.toString()}');
  }

  void showNotificationWeekly(
      int id, String title, String body, int hour, int minute) async {
    var time = new Time(hour, minute, 0);
    await flutterLocalNotificationsPlugin.showWeeklyAtDayAndTime(
        id, title, body, Day.Monday, getPlatformChannelSpecfics());
    print('Notification Succesfully Scheduled at ${time.toString()}');
  }

  void showNotificationAtintervals(int id, String title, String body) async {
    await flutterLocalNotificationsPlugin.periodicallyShow(
        id, title, body, RepeatInterval.Hourly, getPlatformChannelSpecfics());
  }

  void removeReminder(int notificationId) {
    flutterLocalNotificationsPlugin.cancel(notificationId);
  }
}
