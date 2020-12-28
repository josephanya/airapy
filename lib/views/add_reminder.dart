import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:airapy/utilities/margin.dart';
import 'package:airapy/view_models/reminders_vm.dart';
import 'package:airapy/theme/theme.dart';
import 'package:airapy/widgets/appbar.dart';
import 'package:airapy/widgets/buttons.dart';
import 'package:airapy/widgets/textfield.dart';

class AddMedReminder extends StatefulWidget {
  @override
  _AddMedReminderState createState() => _AddMedReminderState();
}

class _AddMedReminderState extends State<AddMedReminder> {
  DateTime timeToDateTime(TimeOfDay time) {
    return DateTime(1969, 1, 1, time.hour, time.minute);
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ReminderViewModel>(context);
    return Scaffold(
      backgroundColor: background,
      appBar: CustomSecAppBar(
        title: 'Add medicine reminder',
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          key: provider.formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              YMargin(30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 7),
                child: Text(
                  'Medicine name',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                ),
              ),
              YMargin(7),
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
                hintText: '',
                controller: provider.nameTEC,
              ),
              YMargin(30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 7),
                child: Text(
                  'Dosage',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                ),
              ),
              YMargin(7),
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
                hintText: 'eg. 250mg',
                controller: provider.dosageTEC,
              ),
              YMargin(30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 7),
                child: Text(
                  'Amount',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                ),
              ),
              YMargin(7),
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
                hintText: 'eg. 2 tablets',
                controller: provider.amountTEC,
              ),
              YMargin(30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 7),
                child: Text(
                  'Scheduled time',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                ),
              ),
              YMargin(7),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Wrap(
                  children: provider.scheduledTimes
                      .map(
                        (scheduledTime) => new ScheduledTime(
                          time: TimeOfDay.fromDateTime(scheduledTime),
                        ),
                      )
                      .toList(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: GestureDetector(
                  child: Chip(
                    backgroundColor: background,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      side: BorderSide(color: primaryBlue),
                    ),
                    label: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Icon(
                          Icons.add,
                          size: 20,
                          color: primaryBlue,
                        ),
                        XMargin(3),
                        Text(
                          'Add',
                          style: TextStyle(
                              color: primaryBlue, fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  ),
                  onTap: () {
                    showTimePicker(
                      initialTime: TimeOfDay.now(),
                      context: context,
                    ).then((value) => provider.addTime(value));
                  },
                ),
              ),
              YMargin(100),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: PrimaryButton(
          buttonText: 'Save',
          onPressed: () {
            if (provider.formKey.currentState.validate()) {
              provider.addReminder(context);
            }
          },
        ),
      ),
    );
  }
}

class ScheduledTime extends StatelessWidget {
  final TimeOfDay time;

  ScheduledTime({this.time});

  String formatTimeOfDay(TimeOfDay tod) {
    final now = new DateTime.now();
    final dt = DateTime(now.year, now.month, now.day, tod.hour, tod.minute);
    final format = DateFormat.jm(); //"6:00 AM"
    return format.format(dt);
  }

  @override
  Widget build(BuildContext context) {
    var reminderProvider = Provider.of<ReminderViewModel>(context);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Chip(
          label: Text(
            formatTimeOfDay(time),
            style: TextStyle(
              color: primaryBlue,
              fontWeight: FontWeight.w500,
            ),
          ),
          backgroundColor: secondaryBlue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(5),
            ),
          ),
          deleteIcon: Icon(Icons.cancel),
          onDeleted: () {
            reminderProvider.removeTime(time);
          },
          deleteIconColor: primaryBlue,
        ),
        SizedBox(
          width: 15,
        ),
      ],
    );
  }
}
