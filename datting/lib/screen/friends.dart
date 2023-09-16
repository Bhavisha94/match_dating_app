import 'package:datting/screen/notification.dart';
import 'package:datting/utils/colors.dart';
import 'package:datting/utils/size.dart';
import 'package:datting/utils/style.dart';
import 'package:datting/widget/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Friends extends StatefulWidget {
  const Friends({super.key});

  @override
  State<Friends> createState() => _FriendsState();
}

class _FriendsState extends State<Friends> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtils.white,
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * .05),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                    onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const NotificationScreen())),
                    child: Text(
                      'Skip',
                      style: style.copyWith(
                          fontSize: 16,
                          color: ColorUtils.red,
                          fontWeight: FontWeight.bold),
                    )),
              ],
            ),
            SizeUtils.verticalSpacing(
                height: MediaQuery.of(context).size.height * .08),
            SvgPicture.asset('assets/images/friends.svg'),
            SizeUtils.verticalSpacing(
                height: MediaQuery.of(context).size.height * .08),
            Text(
              'Search friend’s',
              style: style.copyWith(fontSize: 24, fontWeight: FontWeight.w700),
            ),
            SizeUtils.verticalSpacing(
                height: MediaQuery.of(context).size.height * .01),
            SizedBox(
              width: 290,
              child: Text(
                'You can find friends from your contact lists to connected',
                style:
                    style.copyWith(color: ColorUtils.primary.withOpacity(.7)),
                textAlign: TextAlign.center,
              ),
            ),
            const Spacer(),
            Button(
                text: 'Access to a contact list',
                onCallBack: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const NotificationScreen())),
                width: MediaQuery.of(context).size.width),
            SizeUtils.verticalSpacing(
                height: MediaQuery.of(context).size.height * .04),
          ],
        ),
      )),
    );
  }
}
