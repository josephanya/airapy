import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:airapy/models/user_model.dart';
import 'package:airapy/theme/theme.dart';
import 'package:airapy/utilities/margin.dart';
import 'package:airapy/widgets/appbar.dart';
import 'package:airapy/widgets/buttons.dart';
import 'package:social_share/social_share.dart';

class InviteFriend extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<UserModel>(context);
    return Scaffold(
      backgroundColor: background,
      appBar: CustomSecAppBar(
        title: 'Invite a friend',
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                YMargin(
                  context.screenHeight(percent: 0.14),
                ),
                Image.asset(
                  'images/gift.png',
                  width: 120.0,
                ),
                YMargin(50),
                Text(
                  'Invite a friend',
                  style: GoogleFonts.openSans(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                YMargin(20),
                Text(
                  'Get two weeks of free Airapy subscription for every friend who signs up and pays for Airapy',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.openSans(
                      fontSize: 15, fontWeight: FontWeight.w400),
                ),
                YMargin(20),
                Divider(
                  height: 20,
                  color: grey,
                ),
                YMargin(8),
                Text(
                  'Your invite code',
                  style: GoogleFonts.openSans(
                      color: grey, fontSize: 16, fontWeight: FontWeight.bold),
                ),
                YMargin(6),
                Text(
                  '${provider.referralID}',
                  style: GoogleFonts.openSans(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                YMargin(8),
                Divider(
                  height: 20,
                  color: grey,
                ),
                YMargin(
                  context.screenHeight(percent: 0.2),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: PrimaryButton(
                buttonText: 'Share on WhatsApp',
                onPressed: () {
                  SocialShare.shareWhatsapp(
                      'Sign up with my invite code - ${provider.referralID} and get this digital medicine for type 2 diabetes and hypertension free for one month. https://sustain.lifebox.ng');
                },
              ),
            ),
            YMargin(10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: PrimaryButton(
                buttonText: 'More options',
                onPressed: () {
                  SocialShare.shareOptions(
                      'Sign up with my invite code - ${provider.referralID} and get this digital medicine for type 2 diabetes and hypertension free for one month. https://sustain.lifebox.ng');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
