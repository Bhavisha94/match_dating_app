import 'package:flutter/material.dart';
import 'package:datting/utils/colors.dart';
import 'package:datting/utils/style.dart';

class TextButtonWidget extends StatelessWidget {
  final String text;
  final Function()? onCallBack;
  const TextButtonWidget({super.key, required this.text, this.onCallBack});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onCallBack,
        child: Text(
          text,
          style: style.copyWith(
              color: ColorUtils.red, fontWeight: FontWeight.w600),
        ));
  }
}
