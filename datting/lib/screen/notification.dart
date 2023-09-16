import 'package:datting/screen/dashboard.dart';
import 'package:datting/utils/colors.dart';
import 'package:datting/utils/size.dart';
import 'package:datting/utils/style.dart';
import 'package:datting/widget/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtils.white,
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                    onPressed: () => Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Dashboard(),
                        ),
                        (route) => false),
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
            SvgPicture.asset('assets/images/chat.svg'),
            SizeUtils.verticalSpacing(
                height: MediaQuery.of(context).size.height * .08),
            Text(
              'Enable notification’s',
              style: style.copyWith(fontSize: 24, fontWeight: FontWeight.w700),
            ),
            SizeUtils.verticalSpacing(
                height: MediaQuery.of(context).size.height * .01),
            SizedBox(
              width: 290,
              child: Text(
                'Get push-notification when you get the match or receive a message.',
                style:
                    style.copyWith(color: ColorUtils.primary.withOpacity(.7)),
                textAlign: TextAlign.center,
              ),
            ),
            const Spacer(),
            Button(
                text: 'I want to be notified',
                onCallBack: () => Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => const Dashboard()),
                    (route) => false),
                width: MediaQuery.of(context).size.width * .8),
            SizeUtils.verticalSpacing(
                height: MediaQuery.of(context).size.height * .04),
          ],
        ),
      ),
    );
  }
}
