import 'package:datting/screen/otp_screen.dart';
import 'package:datting/utils/colors.dart';
import 'package:datting/utils/size.dart';
import 'package:datting/utils/style.dart';
import 'package:datting/widget/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MobileSignUp extends StatefulWidget {
  const MobileSignUp({super.key});

  @override
  State<MobileSignUp> createState() => _MobileSignUpState();
}

class _MobileSignUpState extends State<MobileSignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtils.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * .1),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizeUtils.verticalSpacing(
                  height: MediaQuery.of(context).size.height * .1),
              Text(
                'My mobile',
                style: style.copyWith(
                  fontSize: 34,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizeUtils.verticalSpacing(
                  height: MediaQuery.of(context).size.height * .005),
              Text(
                'Please enter your valid phone number. We will send you a 4-digit code to verify your account. ',
                style:
                    style.copyWith(color: ColorUtils.primary.withOpacity(.7)),
              ),
              SizeUtils.verticalSpacing(
                  height: MediaQuery.of(context).size.height * .05),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * .06,
                decoration: BoxDecoration(
                    border: Border.all(color: ColorUtils.border),
                    borderRadius: BorderRadius.circular(15)),
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: IntrinsicHeight(
                  child: Row(
                    children: [
                      SvgPicture.asset('assets/images/flag.svg'),
                      SizeUtils.horizontalSpacing(
                          width: MediaQuery.of(context).size.width * .015),
                      SizedBox(
                          width: MediaQuery.of(context).size.width * .12,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '(+1)',
                                style: style,
                              ),
                              Icon(
                                Icons.keyboard_arrow_down_outlined,
                                color: ColorUtils.inactive,
                                size: 20,
                              )
                            ],
                          )),
                      VerticalDivider(
                        color: ColorUtils.border,
                        thickness: 1,
                      ),
                      Expanded(
                          child: TextField(
                        style: style,
                        keyboardType: TextInputType.phone,
                        decoration: const InputDecoration(
                            border: UnderlineInputBorder(
                                borderSide: BorderSide.none)),
                      ))
                    ],
                  ),
                ),
              ),
              SizeUtils.verticalSpacing(
                  height: MediaQuery.of(context).size.height * .08),
              Button(
                  width: MediaQuery.of(context).size.width * .8,
                  text: 'Continue',
                  onCallBack: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const OtpScreen())))
            ],
          ),
        ),
      ),
    );
  }
}
