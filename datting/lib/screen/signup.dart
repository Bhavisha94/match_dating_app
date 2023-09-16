import 'package:datting/screen/mobile_signup.dart';
import 'package:datting/utils/colors.dart';
import 'package:datting/utils/size.dart';
import 'package:datting/utils/style.dart';
import 'package:datting/widget/button.dart';
import 'package:datting/widget/social_icon.dart';
import 'package:datting/widget/text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtils.white,
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            SizeUtils.verticalSpacing(
                height: MediaQuery.of(context).size.height * .15),
            SvgPicture.asset('assets/images/logo.svg'),
            SizeUtils.verticalSpacing(
                height: MediaQuery.of(context).size.height * .1),
            Text(
              'Sign up to continue',
              style: style.copyWith(
                  fontWeight: FontWeight.bold, color: ColorUtils.primary),
            ),
            SizeUtils.verticalSpacing(
                height: MediaQuery.of(context).size.height * .05),
            Button(
              text: 'Continue with email',
              onCallBack: () {},
              width: MediaQuery.of(context).size.width * .8,
            ),
            SizeUtils.verticalSpacing(
                height: MediaQuery.of(context).size.height * .02),
            InkWell(
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const MobileSignUp())),
              child: Container(
                width: MediaQuery.of(context).size.width * .8,
                height: MediaQuery.of(context).size.height * .06,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                      color: ColorUtils.bg,
                    )),
                child: Center(
                  child: Text(
                    'Use phone number',
                    style: style.copyWith(
                        fontSize: 15,
                        color: ColorUtils.red,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ),
            ),
            SizeUtils.verticalSpacing(
                height: MediaQuery.of(context).size.height * .08),
            SizedBox(
              width: MediaQuery.of(context).size.width * .8,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SvgPicture.asset('assets/images/line.svg'),
                  Text(
                    'or sign up with',
                    style: style.copyWith(color: ColorUtils.primary),
                  ),
                  SvgPicture.asset('assets/images/line.svg'),
                ],
              ),
            ),
            SizeUtils.verticalSpacing(
                height: MediaQuery.of(context).size.height * .05),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SocialIcon(icon: 'fb'),
                SizeUtils.horizontalSpacing(
                    width: MediaQuery.of(context).size.width * .04),
                const SocialIcon(icon: 'google'),
                SizeUtils.horizontalSpacing(
                    width: MediaQuery.of(context).size.width * .04),
                const SocialIcon(icon: 'apple')
              ],
            ),
            SizeUtils.verticalSpacing(
                height: MediaQuery.of(context).size.height * .06),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                TextButtonWidget(text: 'Terms of use'),
                TextButtonWidget(text: 'Privacy Policy')
              ],
            )
          ],
        ),
      ),
    );
  }
}
