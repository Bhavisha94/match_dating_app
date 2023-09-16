import 'package:datting/model/interest.dart';
import 'package:datting/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:datting/utils/colors.dart';
import 'package:flutter_svg/svg.dart';

class InterestWidget extends StatefulWidget {
  final InterestModel interestModel;
  bool select;
  InterestWidget(
      {super.key, required this.interestModel, required this.select});

  @override
  State<InterestWidget> createState() => _InterestWidgetState();
}

class _InterestWidgetState extends State<InterestWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (widget.select) {
          setState(() {
            widget.select = false;
          });
        } else {
          setState(() {
            widget.select = true;
          });
        }
      },
      child: Container(
          decoration: BoxDecoration(
              color: widget.select ? ColorUtils.red : ColorUtils.white,
              border: Border.all(color: ColorUtils.border),
              borderRadius: BorderRadius.circular(15)),
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: ListTile(
            contentPadding: EdgeInsets.zero,
            dense: true,
            leading: SvgPicture.asset(
              'assets/images/${widget.interestModel.image}.svg',
              color: widget.select ? ColorUtils.white : ColorUtils.red,
            ),
            horizontalTitleGap: 0,
            title: Text(
              widget.interestModel.name,
              style: style.copyWith(
                  color: widget.select ? ColorUtils.white : ColorUtils.primary),
            ),
          )),
    );
  }
}
