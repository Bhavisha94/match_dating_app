import 'package:datting/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SocialIcon extends StatelessWidget {
  final VoidCallback? onCallBack;
  final String icon;
  const SocialIcon({super.key, required this.icon, this.onCallBack});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onCallBack,
      child: Container(
        width: 64,
        height: 64,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: ColorUtils.border)),
        child: Center(child: SvgPicture.asset('assets/images/$icon.svg')),
      ),
    );
  }
}
