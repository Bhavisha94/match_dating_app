import 'package:datting/utils/colors.dart';
import 'package:datting/utils/list.dart';
import 'package:datting/utils/size.dart';
import 'package:datting/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class InterestProfileWidget extends StatelessWidget {
  const InterestProfileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 3.5,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10),
        itemCount: interestList.length,
        itemBuilder: (context, index) {
          return ProfileInterest(
            interest: false,
            text: interestList[index],
          );
        },
      ),
    );
  }
}

class ProfileInterest extends StatefulWidget {
  bool interest;
  final String text;
  ProfileInterest({super.key, required this.interest, required this.text});

  @override
  State<ProfileInterest> createState() => _ProfileInterestState();
}

class _ProfileInterestState extends State<ProfileInterest> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          widget.interest = !widget.interest;
        });
      },
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(
                color: widget.interest ? ColorUtils.red : ColorUtils.border),
            borderRadius: BorderRadius.circular(5)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            widget.interest
                ? SvgPicture.asset('assets/images/seen.svg')
                : const SizedBox(),
            SizeUtils.horizontalSpacing(width: widget.interest ? 5 : 0),
            Text(
              widget.text,
              style: style.copyWith(
                  color: widget.interest ? ColorUtils.red : ColorUtils.primary,
                  fontWeight:
                      widget.interest ? FontWeight.w700 : FontWeight.w400),
            )
          ],
        ),
      ),
    );
  }
}
