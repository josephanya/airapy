import 'package:airapy/models/user_model.dart';
import 'package:airapy/theme/aircon_icons.dart';
import 'package:airapy/theme/theme.dart';
import 'package:airapy/utilities/margin.dart';
import 'package:airapy/view_models/coach_chat_vm.dart';
import 'package:airapy/widgets/appbar.dart';
import 'package:airapy/widgets/message_bubble.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CoachChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<CoachChatViewModel>(context);
    var provider2 = Provider.of<UserModel>(context);
    return Scaffold(
      backgroundColor: background,
      appBar: CustomMainAppBar(
        title: 'Coach',
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () {
            FocusScopeNode currentFocus = FocusScope.of(context);
            if (!currentFocus.hasPrimaryFocus) {
              currentFocus.unfocus();
            }
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              StreamBuilder(
                stream: Firestore.instance
                    .collection('users')
                    .document(provider2.userID)
                    .collection('messages')
                    .orderBy('timestamp', descending: true)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Container();
                  }
                  final messages = snapshot.data.documents;
                  List<MessageBubble> messageWidgets = [];
                  for (var message in messages) {
                    final messageText = message.data['text'];
                    final messageSender = message.data['sender'];
                    final messageIdTo = message.data['idTo'];
                    final messageType = message.data['type'];
                    final currentUser = provider2.userID;
                    final messageWidget = MessageBubble(
                      sender: messageSender,
                      content: messageText,
                      isMe: currentUser != messageIdTo,
                      type: messageType,
                    );
                    messageWidgets.add(messageWidget);
                  }
                  return Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 10),
                      child: ListView(
                        reverse: true,
                        children: messageWidgets,
                      ),
                    ),
                  );
                },
              ),
              //input area
              Padding(
                padding: const EdgeInsets.all(7.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Flexible(
                      child: Container(
                        height: 45,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(40),
                          // border: Border.all(color: primaryBlue, width: 1),
                        ),
                        child: Row(
                          children: [
                            XMargin(13),
                            GestureDetector(
                              onTap: () {
                                provider.getImage(
                                  provider2.coachID,
                                  provider2.firstName,
                                );
                              },
                              child: Icon(
                                Aircon.attach,
                                size: 21,
                                color: grey,
                              ),
                            ),
                            XMargin(13),
                            Flexible(
                              child: TextField(
                                maxLines: null,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w400,
                                ),
                                // controller: provider.chatFieldTEC,
                                decoration: InputDecoration.collapsed(
                                  hintText: 'Type your message...',
                                  hintStyle: TextStyle(color: grey),
                                ),
                              ),
                            ),
                            XMargin(8),
                          ],
                        ),
                      ),
                    ),
                    XMargin(6),
                    Container(
                      width: 45,
                      height: 45,
                      decoration: BoxDecoration(
                          color: primaryBlue,
                          border: Border.all(
                            color: primaryBlue,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(50))),
                      child: IconButton(
                        iconSize: 23,
                        icon: Icon(Aircon.send),
                        onPressed: () {
                          provider.addChatDocument(
                            provider2.coachID,
                            provider2.firstName,
                          );
                        },
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
