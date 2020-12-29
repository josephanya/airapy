import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:airapy/theme/aircon_icons.dart';
import 'package:airapy/theme/theme.dart';
import 'package:airapy/utilities/margin.dart';
import 'package:airapy/views/edit_reminder.dart';

class ReminderCard extends StatelessWidget {
  final String name, dosage, amount;
  final List<DateTime> time;
  final int index;

  ReminderCard({this.amount, this.dosage, this.name, this.time, this.index});

  String dateTimeListToString(List<DateTime> dateTime) {
    var date = dateTime.first;
    final format = DateFormat.jm(); //"6:00 AM"
    return format.format(date);
    // var timeList = tod.map((time) => time.toString());
    // var time = timeList.join('').substring(10, 15);
    // TimeOfDay remTime = TimeOfDay(
    //     hour: int.parse(time.split(":")[0]),
    //     minute: int.parse(time.split(":")[1]));
    // final now = new DateTime.now();
    // var dt =
    //     DateTime(now.year, now.month, now.day, remTime.hour, remTime.minute);
    // final format = DateFormat.jm(); //"6:00 AM"
    // return format.format(dt);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => EditMedReminder(
            index: index,
          ),
        ),
      ),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 15.5, horizontal: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6.0),
          boxShadow: [
            BoxShadow(
              color: Color(0xFFEEF4FC),
              offset: Offset(0, 0),
              blurRadius: 5.0,
              spreadRadius: 0,
            )
          ],
        ),
        margin: EdgeInsets.symmetric(
          vertical: 6.5,
        ),
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: <Widget>[
                CircleAvatar(
                  child: Icon(
                    Aircon.medicine,
                    size: 25,
                    color: primaryBlue,
                  ),
                  radius: 22,
                  backgroundColor: secondaryBlue,
                ),
              ],
            ),
            XMargin(17),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  '$name $dosage',
                  style: GoogleFonts.openSans(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                YMargin(5),
                Text(
                  'Take $amount at ${dateTimeListToString(time)}',
                  style: GoogleFonts.openSans(
                      fontSize: 14, fontWeight: FontWeight.w400, color: grey),
                )
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                // Text(
                //   dateTimeListToString(time),
                //   style: TextStyle(
                //       fontSize: 14, fontWeight: FontWeight.w400, color: grey),
                // ),
                // YMargin(18),
                // YMargin(4),
                // Container(
                //   decoration: BoxDecoration(
                //     color: primaryBlue,
                //     borderRadius: BorderRadius.circular(4.0),
                //   ),
                //   child: Padding(
                //     padding: const EdgeInsets.symmetric(
                //         horizontal: 6, vertical: 4),
                //     child: Text(
                //       'Taken',
                //       style: TextStyle(
                //           color: Colors.white,
                //           fontSize: 11,
                //           fontWeight: FontWeight.w500),
                //     ),
                //   ),
                // ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
