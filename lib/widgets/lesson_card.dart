import 'package:flutter/material.dart';
import 'package:airapy/theme/theme.dart';
import 'package:airapy/views/lesson_webview.dart';

class LessonCard extends StatefulWidget {
  final String lessonTitle;
  final int lessonDuration;
  final int lessonNumber;
  final String thumbnail;
  final String url;

  LessonCard(
      {this.lessonTitle,
      this.thumbnail,
      this.lessonDuration,
      this.lessonNumber,
      this.url});

  @override
  _LessonCardState createState() => _LessonCardState();
}

class _LessonCardState extends State<LessonCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (BuildContext context) => LessonWebview(
              title: 'Lesson ${widget.lessonNumber}',
              selectedUrl: widget.url,
            ),
          ),
        );
      },
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6.0),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.shade300,
                offset: Offset(.5, .5),
                blurRadius: 1.0,
                spreadRadius: 0.5)
          ],
        ),
        margin: EdgeInsets.symmetric(vertical: 6.0, horizontal: 13.0),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Image.network(
                      widget.thumbnail,
                      width: 80,
                      height: 80,
                    )
                  ],
                ),
                SizedBox(
                  width: 25,
                ),
                Row(
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Lesson ${widget.lessonNumber}',
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 13,
                              color: grey),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.6,
                          child: Text(
                            widget.lessonTitle,
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 16),
                          ),
                        ),
                        SizedBox(
                          height: 18,
                        ),
                        Text(
                          '${widget.lessonDuration} minutes',
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 13,
                              color: grey),
                        )
                      ],
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
