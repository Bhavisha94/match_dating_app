import 'package:datting/screen/friends.dart';
import 'package:datting/utils/colors.dart';
import 'package:datting/utils/list.dart';
import 'package:datting/utils/size.dart';
import 'package:datting/utils/style.dart';
import 'package:datting/widget/appbar.dart';
import 'package:datting/widget/button.dart';
import 'package:datting/widget/interest_widget.dart';
import 'package:flutter/material.dart';

class Passion extends StatefulWidget {
  const Passion({super.key});

  @override
  State<Passion> createState() => _PassionState();
}

class _PassionState extends State<Passion> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtils.white,
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * .05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            appBar(
              context: context,
              action: [
                Center(
                  child: InkWell(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Friends())),
                    child: Text(
                      'Skip',
                      style: style.copyWith(
                          color: ColorUtils.red,
                          fontSize: 16,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                )
              ],
            ),
            SizeUtils.verticalSpacing(
                height: MediaQuery.of(context).size.height * .03),
            Text(
              'Your interests',
              style: style.copyWith(fontSize: 34, fontWeight: FontWeight.w700),
            ),
            SizeUtils.verticalSpacing(
                height: MediaQuery.of(context).size.height * .005),
            Text(
              'Select a few of your interests and let everyone know what you’re passionate about.',
              style: style.copyWith(color: ColorUtils.primary.withOpacity(.7)),
            ),
            SizeUtils.verticalSpacing(
                height: MediaQuery.of(context).size.height * .025),
            Expanded(
                child: GridView.builder(
              itemCount: interest.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 3.5,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10),
              itemBuilder: (context, index) {
                return InterestWidget(
                  interestModel: interest[index],
                  select: false,
                );
              },
            )),
            Button(
              text: 'Continue',
              onCallBack: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Friends())),
              width: MediaQuery.of(context).size.width,
            ),
            SizeUtils.verticalSpacing(
                height: MediaQuery.of(context).size.height * .04)
          ],
        ),
      )),
    );
  }
}
