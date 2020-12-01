import 'package:airapy/theme/aircon_icons.dart';
import 'package:airapy/theme/theme.dart';
import 'package:airapy/utilities/margin.dart';
import 'package:airapy/widgets/appbar.dart';
import 'package:flutter/material.dart';

class CoachChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
              Container(),
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
                              onTap: () {},
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
                        onPressed: () {},
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
