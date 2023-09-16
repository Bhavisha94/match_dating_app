import 'package:datting/utils/colors.dart';
import 'package:datting/utils/style.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String text;
  final VoidCallback? onCallBack;
  final double width;
  final Color? color;
  const Button(
      {super.key,
      required this.text,
      required this.onCallBack,
      required this.width,
      this.color});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onCallBack,
      child: Container(
        width: width,
        height: MediaQuery.of(context).size.height * .06,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: color ?? ColorUtils.red),
        child: Center(
          child: Text(
            text,
            style: style.copyWith(
                color: color == null ? ColorUtils.white : ColorUtils.red,
                fontWeight: FontWeight.w700,
                fontSize: 15),
          ),
        ),
      ),
    );
  }
}
