import 'package:datting/utils/colors.dart';
import 'package:datting/utils/size.dart';
import 'package:datting/widget/profile_buttons.dart';
import 'package:flutter/material.dart';

class LikeFavoriteButtons extends StatelessWidget {
  const LikeFavoriteButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ProfileButtons(
            width: 78,
            height: 78,
            color: ColorUtils.white,
            shadowColor: ColorUtils.primary.withOpacity(.2),
            icon: 'close2'),
        SizeUtils.horizontalSpacing(
            width: MediaQuery.of(context).size.width * .05),
        ProfileButtons(
            width: 99,
            height: 99,
            color: ColorUtils.red,
            shadowColor: ColorUtils.red.withOpacity(.2),
            icon: 'heart'),
        SizeUtils.horizontalSpacing(
            width: MediaQuery.of(context).size.width * .05),
        ProfileButtons(
            width: 78,
            height: 78,
            color: ColorUtils.white,
            shadowColor: ColorUtils.primary.withOpacity(.2),
            icon: 'star'),
      ],
    );
  }
}
