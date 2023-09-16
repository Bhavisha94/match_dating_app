import 'package:datting/utils/colors.dart';
import 'package:datting/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class GenderSelectionWidget extends StatelessWidget {
  final String text;
  final String icon;
  final VoidCallback? onCallBack;
  final int index;
  final int genderIndex;
  const GenderSelectionWidget(
      {super.key,
      required this.text,
      required this.icon,
      this.onCallBack,
      required this.index,
      required this.genderIndex});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onCallBack,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * .06,
        decoration: BoxDecoration(
            color: index == genderIndex ? ColorUtils.red : ColorUtils.white,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: ColorUtils.border)),
        child: ListTile(
          minVerticalPadding: 0,
          dense: true,
          title: Text(
            text,
            style: style.copyWith(
                fontSize: 15,
                color: index == genderIndex
                    ? ColorUtils.white
                    : ColorUtils.primary),
          ),
          trailing: SvgPicture.asset(
            'assets/images/$icon.svg',
            color:
                index == genderIndex ? ColorUtils.white : ColorUtils.inactive,
          ),
        ),
      ),
    );
  }
}
