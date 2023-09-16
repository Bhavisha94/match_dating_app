import 'package:datting/utils/colors.dart';
import 'package:datting/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OtpTextfield extends StatefulWidget {
  final TextEditingController controller;

  const OtpTextfield({super.key, required this.controller});

  @override
  State<OtpTextfield> createState() => _OtpTextfieldState();
}

class _OtpTextfieldState extends State<OtpTextfield> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 65,
      height: 65,
      child: TextField(
        style: style.copyWith(fontSize: 34, color: Colors.white),
        controller: widget.controller,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: widget.controller.text.isEmpty
                ? BorderSide(color: ColorUtils.border)
                : BorderSide.none,
          ),
          hintText: '0',
          fillColor: ColorUtils.red,
          filled: widget.controller.text.isNotEmpty ? true : false,
          hintStyle: style.copyWith(
              color: ColorUtils.border, fontSize: 34, height: 1.8),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(color: ColorUtils.red)),
        ),
        onChanged: (p0) {
          if (p0.length == 1) {
            FocusScope.of(context).nextFocus();
            setState(() {});
          }
        },
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly
        ],
      ),
    );
  }
}
