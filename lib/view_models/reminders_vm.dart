import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:airapy/models/reminder_model.dart';
import 'package:airapy/services/notifications_manager.dart';

class ReminderViewModel with ChangeNotifier {
  var formKey = GlobalKey<FormState>();

  List<DateTime> scheduledTimes = [];
  List<ReminderModel> reminders = [];

  final TextEditingController nameTEC = new TextEditingController();
  final TextEditingController dosageTEC = new TextEditingController();
  final TextEditingController amountTEC = new TextEditingController();

  void addTime(TimeOfDay addedTime) {
    final dt = DateTime(1969, 1, 1, addedTime.hour, addedTime.minute);
    if (scheduledTimes.length < 1) {
      scheduledTimes.add(dt);
    }
    notifyListeners();
  }

  void removeTime(TimeOfDay time) {
    final dt = DateTime(1969, 1, 1, time.hour, time.minute);
    if (scheduledTimes.contains(dt)) {
      scheduledTimes.remove(dt);
    }
    notifyListeners();
  }

  static String toStrings(List<DateTime> args) =>
      args.map((e) => e.toIso8601String()).join(',');

  static List<DateTime> fromString(String args) =>
      args.split(',').map((e) => DateTime.parse(e)).toList();

  void addReminder(context) async {
    final newReminder = ReminderModel(
      id: DateTime.now().toString(),
      amount: amountTEC.text,
      name: nameTEC.text,
      dosage: dosageTEC.text,
      time: scheduledTimes,
      isDeleted: false,
    );
    Box<ReminderModel> reminderBox = Hive.box<ReminderModel>('reminders');
    final id = await reminderBox.add(newReminder);
    print(id);
    for (DateTime times in newReminder.time) {
      NotificationsManager().showNotificationDaily(
        id,
        'Hello, it\'s time to take your medicine',
        'Take ${amountTEC.text} of ${nameTEC.text} now',
        times.hour,
        times.minute,
      );
    }
    nameTEC.text = '';
    amountTEC.text = '';
    dosageTEC.text = '';
    scheduledTimes = [];
    notifyListeners();
    Navigator.of(context).pop();
  }

  void fetchReminder(int key) {
    Box<ReminderModel> reminderBox = Hive.box<ReminderModel>('reminders');
    final reminder = reminderBox.getAt(key);
    nameTEC.text = reminder.name;
    amountTEC.text = reminder.amount;
    dosageTEC.text = reminder.dosage;
    scheduledTimes = reminder.time;
    notifyListeners();
  }

  void updateReminder(int key, context) async {
    final newReminder = ReminderModel(
      id: DateTime.now().toString(),
      amount: amountTEC.text,
      name: nameTEC.text,
      dosage: dosageTEC.text,
      time: scheduledTimes,
      isDeleted: false,
    );
    Box<ReminderModel> reminderBox = Hive.box<ReminderModel>('reminders');
    await reminderBox.putAt(key, newReminder);
    nameTEC.text = '';
    amountTEC.text = '';
    dosageTEC.text = '';
    scheduledTimes = [];
    notifyListeners();
    Navigator.of(context).pop();
  }

  void deleteReminder(int key, context) async {
    final newReminder = ReminderModel(
      id: DateTime.now().toString(),
      amount: amountTEC.text,
      name: nameTEC.text,
      dosage: dosageTEC.text,
      time: scheduledTimes,
      isDeleted: true,
    );
    Box<ReminderModel> reminderBox = Hive.box<ReminderModel>('reminders');
    await reminderBox.putAt(key, newReminder);
    nameTEC.text = '';
    amountTEC.text = '';
    dosageTEC.text = '';
    scheduledTimes = [];
    notifyListeners();
    NotificationsManager().removeReminder(key);
    Navigator.of(context).pop();
  }
}
