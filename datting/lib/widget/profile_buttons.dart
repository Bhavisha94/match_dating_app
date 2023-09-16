import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProfileButtons extends StatelessWidget {
  final double width;
  final double height;
  final Color color;
  final Color shadowColor;
  final String icon;
  final VoidCallback? onCallBack;
  const ProfileButtons(
      {super.key,
      required this.width,
      required this.height,
      required this.color,
      required this.shadowColor,
      required this.icon,
      this.onCallBack});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onCallBack,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color,
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: shadowColor,
                blurRadius: 15.0,
                offset: const Offset(0.0, 0.75))
          ],
        ),
        child: Center(
          child: SvgPicture.asset('assets/images/$icon.svg'),
        ),
      ),
    );
  }
}
