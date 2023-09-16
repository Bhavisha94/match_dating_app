import 'package:datting/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SettingIcon extends StatelessWidget {
  const SettingIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 52,
      height: 52,
      decoration: BoxDecoration(
          border: Border.all(color: ColorUtils.border),
          borderRadius: BorderRadius.circular(15)),
      child: Center(
        child: SvgPicture.asset('assets/images/setting.svg'),
      ),
    );
  }
}
