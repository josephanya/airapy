import 'package:hive/hive.dart';

part 'reminder_model.g.dart';

@HiveType(typeId: 0)
class ReminderModel {
  @HiveField(0)
  String id;

  @HiveField(1)
  String name;

  @HiveField(2)
  String amount;

  @HiveField(3)
  String dosage;

  @HiveField(4)
  List<DateTime> time;

  @HiveField(5)
  bool isDeleted;

  ReminderModel({
    this.id,
    this.amount,
    this.name,
    this.dosage,
    this.time,
    this.isDeleted,
  });
}
