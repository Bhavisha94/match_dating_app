import 'dart:ui';

import 'package:datting/utils/colors.dart';
import 'package:datting/utils/list.dart';
import 'package:datting/utils/size.dart';
import 'package:datting/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Matches extends StatefulWidget {
  const Matches({super.key});

  @override
  State<Matches> createState() => _MatchesState();
}

class _MatchesState extends State<Matches> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * .05),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Matches',
                  style:
                      style.copyWith(fontSize: 34, fontWeight: FontWeight.w700),
                ),
                Container(
                  width: 52,
                  height: 52,
                  decoration: BoxDecoration(
                      border: Border.all(color: ColorUtils.border),
                      borderRadius: BorderRadius.circular(15)),
                  child: Center(
                    child: SvgPicture.asset('assets/images/sort.svg'),
                  ),
                )
              ],
            ),
            SizeUtils.verticalSpacing(
                height: MediaQuery.of(context).size.height * .01),
            Text(
              'This is a list of people who have liked you and your matches.',
              style: style.copyWith(
                  color: ColorUtils.primary.withOpacity(.7), fontSize: 16),
            ),
            SizeUtils.verticalSpacing(
                height: MediaQuery.of(context).size.height * .015),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SvgPicture.asset('assets/images/line_2.svg'),
                Text(
                  'Today',
                  style:
                      style.copyWith(color: ColorUtils.primary.withOpacity(.7)),
                ),
                SvgPicture.asset('assets/images/line_2.svg')
              ],
            ),
            SizeUtils.verticalSpacing(
                height: MediaQuery.of(context).size.height * .015),
            Expanded(
                child: GridView.builder(
              itemCount: matchesList.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: .75),
              itemBuilder: (context, index) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                          image: AssetImage(
                              'assets/images/${matchesList[index].image}.png'),
                          fit: BoxFit.fill)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.symmetric(
                            horizontal:
                                MediaQuery.of(context).size.width * .02),
                        child: Text(
                          matchesList[index].name,
                          textAlign: TextAlign.start,
                          style: style.copyWith(
                              color: ColorUtils.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                      SizeUtils.verticalSpacing(
                          height: MediaQuery.of(context).size.height * .015),
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(15),
                            bottomRight: Radius.circular(15)),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                          child: Container(
                            height: MediaQuery.of(context).size.height * .045,
                            decoration: const BoxDecoration(),
                            child: IntrinsicHeight(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  SvgPicture.asset('assets/images/close.svg'),
                                  VerticalDivider(
                                    color: ColorUtils.white,
                                    thickness: 1,
                                  ),
                                  SvgPicture.asset('assets/images/like.svg')
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ))
          ],
        ),
      )),
    );
  }
}
