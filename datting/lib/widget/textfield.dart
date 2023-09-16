import 'package:datting/utils/colors.dart';
import 'package:datting/utils/style.dart';
import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final String label;
  const TextFieldWidget({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .06,
      child: TextField(
        decoration: InputDecoration(
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(color: ColorUtils.border)),
            label: Text(
              label,
              style: style.copyWith(color: ColorUtils.primary.withOpacity(.4)),
            ),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(color: ColorUtils.border))),
      ),
    );
  }
}
