import 'package:datting/utils/colors.dart';
import 'package:datting/utils/size.dart';
import 'package:datting/utils/style.dart';
import 'package:datting/widget/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MatchScreen extends StatefulWidget {
  const MatchScreen({super.key});

  @override
  State<MatchScreen> createState() => _MatchScreenState();
}

class _MatchScreenState extends State<MatchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtils.white,
      body: SafeArea(
          child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            SizeUtils.verticalSpacing(
                height: MediaQuery.of(context).size.height * .05),
            Stack(
              children: [
                const SizedBox(
                  width: 295,
                  height: 370,
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  child: RotationTransition(
                    turns: const AlwaysStoppedAnimation(10 / 360),
                    child: Stack(
                      children: [
                        const SizedBox(
                          width: 180,
                          height: 260,
                        ),
                        Positioned(
                          right: 0,
                          top: 20,
                          child: Container(
                            width: 160,
                            height: 240,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                image: const DecorationImage(
                                    image: AssetImage(
                                        'assets/images/matches1.png'))),
                          ),
                        ),
                        Positioned(
                          top: 0,
                          child: Container(
                            width: 60,
                            height: 60,
                            padding: EdgeInsets.all(
                                MediaQuery.of(context).size.width * .037),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle, color: ColorUtils.bg),
                            child: SvgPicture.asset(
                              'assets/images/like.svg',
                              color: ColorUtils.red,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  child: RotationTransition(
                    turns: const AlwaysStoppedAnimation(-7 / 360),
                    child: Stack(
                      children: [
                        const SizedBox(
                          width: 180,
                          height: 260,
                        ),
                        Positioned(
                          right: 0,
                          top: 0,
                          child: Container(
                            width: 160,
                            height: 240,
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/matches2.png'))),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          child: Container(
                            width: 60,
                            height: 60,
                            padding: EdgeInsets.all(
                                MediaQuery.of(context).size.width * .037),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle, color: ColorUtils.bg),
                            child: SvgPicture.asset(
                              'assets/images/like.svg',
                              color: ColorUtils.red,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            SizeUtils.verticalSpacing(
                height: MediaQuery.of(context).size.height * .05),
            Text(
              'It’s a match, Jake!',
              style: style.copyWith(
                  fontSize: 34,
                  fontWeight: FontWeight.w700,
                  color: ColorUtils.red),
            ),
            Text(
              'Start a conversation now with each other',
              style: style.copyWith(color: ColorUtils.primary.withOpacity(.7)),
            ),
            const Spacer(),
            Button(
                text: 'Say hello',
                onCallBack: () {},
                width: MediaQuery.of(context).size.width * .8),
            SizeUtils.verticalSpacing(
                height: MediaQuery.of(context).size.height * .015),
            Button(
              text: 'Keep swiping',
              onCallBack: () {},
              width: MediaQuery.of(context).size.width * .8,
              color: ColorUtils.red.withOpacity(.1),
            ),
            SizeUtils.verticalSpacing(
                height: MediaQuery.of(context).size.height * .04)
          ],
        ),
      )),
    );
  }
}
