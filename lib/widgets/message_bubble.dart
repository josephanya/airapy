import 'dart:io';
import 'package:airapy/theme/theme.dart';
import 'package:airapy/views/full_photo.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:overlay_support/overlay_support.dart';

class MessageBubble extends StatelessWidget {
  final String sender;
  final String content;
  final bool isMe;
  final DateTime time;
  final int type;

  MessageBubble({this.sender, this.content, this.isMe, this.time, this.type});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: Column(
        crossAxisAlignment:
            isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: <Widget>[
          Material(
            borderRadius: isMe
                ? BorderRadius.only(
                    topLeft: Radius.circular(9),
                    topRight: Radius.circular(9),
                    bottomLeft: Radius.circular(9),
                    bottomRight: Radius.circular(0),
                  )
                : BorderRadius.only(
                    topLeft: Radius.circular(9),
                    topRight: Radius.circular(9),
                    bottomLeft: Radius.circular(0),
                    bottomRight: Radius.circular(9),
                  ),
            color: isMe ? primaryBlue : white,
            child: (type == 1)
                ? Container(
                    child: FlatButton(
                      child: Material(
                        child: CachedNetworkImage(
                          placeholder: (context, url) => Container(
                            child: Platform.isAndroid
                                ? CircularProgressIndicator()
                                : CupertinoActivityIndicator(),
                            width: 150.0,
                            height: 150.0,
                            padding: EdgeInsets.all(70.0),
                            decoration: BoxDecoration(
                              color: grey,
                              borderRadius: BorderRadius.all(
                                Radius.circular(8.0),
                              ),
                            ),
                          ),
                          errorWidget: (context, url, error) => Material(
                            child: Image.asset(
                              'images/img_not_available.jpeg',
                              width: 150.0,
                              height: 150.0,
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(8.0),
                            ),
                            clipBehavior: Clip.hardEdge,
                          ),
                          imageUrl: content,
                          width: 150.0,
                          height: 150.0,
                          fit: BoxFit.cover,
                        ),
                        borderRadius: isMe
                            ? BorderRadius.only(
                                topLeft: Radius.circular(9),
                                topRight: Radius.circular(9),
                                bottomLeft: Radius.circular(9),
                                bottomRight: Radius.circular(0),
                              )
                            : BorderRadius.only(
                                topLeft: Radius.circular(9),
                                topRight: Radius.circular(9),
                                bottomLeft: Radius.circular(0),
                                bottomRight: Radius.circular(9),
                              ),
                        clipBehavior: Clip.hardEdge,
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => FullPhoto(url: content),
                          ),
                        );
                      },
                      padding: EdgeInsets.all(0),
                    ),
                    margin: EdgeInsets.only(left: 0.0),
                  )
                : GestureDetector(
                    onLongPress: () {
                      Clipboard.setData(new ClipboardData(text: content))
                          .then((_) {
                        toast('Text copied to clipboard');
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      child: Text(
                        '$content',
                        style: GoogleFonts.openSans(
                            color: isMe ? Colors.white : Colors.black87,
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
