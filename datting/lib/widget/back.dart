import 'package:datting/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Back extends StatefulWidget {
  const Back({super.key});

  @override
  State<Back> createState() => _BackState();
}

class _BackState extends State<Back> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pop(context),
      child: Container(
        width: 52,
        height: 52,
        decoration: BoxDecoration(
            border: Border.all(color: ColorUtils.border),
            borderRadius: BorderRadius.circular(15)),
        child: Center(
          child: SvgPicture.asset('assets/images/back.svg'),
        ),
      ),
    );
  }
}
