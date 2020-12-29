import 'dart:io';

import 'package:airapy/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:airapy/theme/theme.dart';
import 'package:airapy/utilities/margin.dart';
import 'package:airapy/views/lesson_webview.dart';
import 'package:airapy/widgets/appbar.dart';

class Lessons extends StatefulWidget {
  @override
  _LessonsState createState() => _LessonsState();
}

class _LessonsState extends State<Lessons> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: CustomMainAppBar(
        title: 'Lessons',
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 13),
        child: Column(
          children: <Widget>[
            YMargin(25),
            LessonBody(),
          ],
        ),
      ),
    );
  }
}

class ResourceBody extends StatelessWidget {
  const ResourceBody({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class SingleLesson extends StatelessWidget {
  final String title, url, thumbnail;
  const SingleLesson({
    this.title,
    this.thumbnail,
    this.url,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 6),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) => LessonWebview(
                title: 'Lesson',
                selectedUrl: url,
              ),
            ),
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Image.network(
                thumbnail,
                height: 120,
              ),
              width: double.infinity,
              height: 120,
              decoration: BoxDecoration(
                color: background,
                borderRadius: BorderRadius.all(
                  Radius.circular(5),
                ),
              ),
            ),
            YMargin(12),
            Center(
              child: Text(
                title,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LessonBody extends StatelessWidget {
  const LessonBody({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<UserModel>(context);
    return Flexible(
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
                  .collection('lessons')
                  .snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(
                    child: Text(
                      'Your lessons will appear here',
                      style: GoogleFonts.openSans(fontSize: 13),
                    ),
                  );
                }
                final lessons = snapshot.data.documents;
                return GridView.builder(
                  itemCount: lessons.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 4.0,
                      mainAxisSpacing: 4.0),
                  itemBuilder: (context, index) {
                    var data = lessons[index];
                    return SingleLesson(
                      title: data['title'],
                      thumbnail: data['thumbnail'],
                      url: data['url'],
                    );
                  },
                );
              },
            ),
    );
  }
}
