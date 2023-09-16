import 'dart:developer';

import 'package:datting/cubit/timer/cubit/timer_cubit.dart';
import 'package:datting/screen/dashboard.dart';
import 'package:datting/screen/profile_details.dart';
import 'package:datting/utils/colors.dart';
import 'package:datting/utils/size.dart';
import 'package:datting/utils/style.dart';
import 'package:datting/widget/back.dart';
import 'package:datting/widget/button.dart';
import 'package:datting/widget/otp_textfield.dart';
import 'package:datting/widget/text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  TextEditingController controller1 = TextEditingController(),
      controller2 = TextEditingController(),
      controller3 = TextEditingController(),
      controller4 = TextEditingController();
  FocusNode node1 = FocusNode(),
      node2 = FocusNode(),
      node3 = FocusNode(),
      node4 = FocusNode();

  @override
  void initState() {
    context.read<TimerCubit>().change();
    super.initState();
  }

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
            AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: const Back(),
            ),
            BlocBuilder<TimerCubit, TimerState>(
              builder: (context, state) {
                return Text(
                  '00:${state.timer}',
                  style:
                      style.copyWith(fontSize: 34, fontWeight: FontWeight.w700),
                );
              },
            ),
            SizeUtils.verticalSpacing(
                height: MediaQuery.of(context).size.height * .01),
            SizedBox(
              width: 215,
              child: Text(
                'Type the verification code we’ve sent you',
                textAlign: TextAlign.center,
                style: style.copyWith(
                    color: ColorUtils.primary.withOpacity(.7), fontSize: 16),
              ),
            ),
            SizeUtils.verticalSpacing(
                height: MediaQuery.of(context).size.height * .07),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                OtpTextfield(
                  controller: controller1,
                ),
                OtpTextfield(
                  controller: controller2,
                ),
                OtpTextfield(
                  controller: controller3,
                ),
                OtpTextfield(
                  controller: controller4,
                )
              ],
            ),
            TextButtonWidget(
              text: 'Send again',
              onCallBack: () => context.read<TimerCubit>().change(),
            ),
            const Spacer(),
            Button(
                text: 'Continue',
                onCallBack: () async {
                  SharedPreferences pref =
                      await SharedPreferences.getInstance();
                  bool? isLogin = await pref.getBool('isLogin');
                  log(isLogin.toString());
                  if (isLogin!) {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Dashboard()),
                      (route) => false,
                    );
                  } else {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ProfileDetails()));
                  }
                },
                width: MediaQuery.of(context).size.width),
            SizeUtils.verticalSpacing(
                height: MediaQuery.of(context).size.height * .04)
          ],
        ),
      )),
    );
  }
}
