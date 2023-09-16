import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:datting/screen/match.dart';
import 'package:datting/utils/colors.dart';
import 'package:datting/utils/list.dart';
import 'package:datting/utils/size.dart';
import 'package:datting/utils/style.dart';
import 'package:datting/widget/back.dart';
import 'package:datting/widget/background_curv_widget.dart';
import 'package:datting/widget/filter_dialog.dart';
import 'package:datting/widget/like_favorite_button.dart';
import 'package:datting/widget/profile_buttons.dart';
import 'package:datting/widget/settings_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Discover extends StatefulWidget {
  const Discover({super.key});

  @override
  State<Discover> createState() => _DiscoverState();
}

class _DiscoverState extends State<Discover>
    with SingleTickerProviderStateMixin {
  PageController controller = PageController();
  CarouselController carouselController = CarouselController();
  ValueNotifier<Swipe> swipeNotifier = ValueNotifier(Swipe.none);
  late final AnimationController _animationController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        banner.removeLast();
        _animationController.reset();

        swipeNotifier.value = Swipe.none;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            SizeUtils.verticalSpacing(
                height: MediaQuery.of(context).size.height * .01),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * .05),
              child: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                leading: const Back(),
                centerTitle: true,
                title: Column(
                  children: [
                    Text(
                      'Discover',
                      style: style.copyWith(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: ColorUtils.primary),
                    ),
                    Text(
                      'Chicago, II',
                      style: style.copyWith(
                          fontSize: 12,
                          color: ColorUtils.primary.withOpacity(.7)),
                    )
                  ],
                ),
                actions: [
                  InkWell(
                    onTap: () => showFilterDiallog(),
                    child: const SettingIcon(),
                  ),
                ],
              ),
            ),
            SizeUtils.verticalSpacing(
                height: MediaQuery.of(context).size.height * .025),
            //CardsStackWidget(),
            Stack(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * .58,
                ),
                // Positioned(
                //   top: 0,
                //   child: SizedBox(
                //     width: MediaQuery.of(context).size.width,
                //     child: Opacity(
                //       opacity: .4,
                //       child: Container(
                //         width: 231,
                //         height: 450,
                //         decoration: BoxDecoration(
                //             borderRadius: BorderRadius.circular(15),
                //             image: const DecorationImage(
                //               image: AssetImage('assets/images/photo_bg.png'),
                //             )),
                //       ),
                //     ),
                //   ),
                // ),
                Positioned(
                  bottom: 0,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: ValueListenableBuilder(
                      valueListenable: swipeNotifier,
                      builder: (context, value, child) => SizedBox(
                        width: 295,
                        height: 450,
                        child: Stack(
                          clipBehavior: Clip.none,
                          alignment: Alignment.center,
                          children: List.generate(banner.length, (index) {
                            if (index == banner.length - 1) {
                              return PositionedTransition(
                                rect: RelativeRectTween(
                                  begin: RelativeRect.fromSize(
                                      const Rect.fromLTWH(0, 0, 580, 340),
                                      const Size(580, 340)),
                                  end: RelativeRect.fromSize(
                                      Rect.fromLTWH(
                                          value != Swipe.none
                                              ? value == Swipe.left
                                                  ? -300
                                                  : 300
                                              : 0,
                                          0,
                                          580,
                                          340),
                                      const Size(580, 340)),
                                ).animate(CurvedAnimation(
                                    parent: _animationController,
                                    curve: Curves.easeIn)),
                                child: RotationTransition(
                                  turns: Tween<double>(
                                          begin: 0,
                                          end: value != Swipe.none
                                              ? value == Swipe.left
                                                  ? -0.1 * 0.3
                                                  : 0.1 * 0.3
                                              : 0.0)
                                      .animate(
                                    CurvedAnimation(
                                      parent: _animationController,
                                      curve: const Interval(0, 0.4,
                                          curve: Curves.easeInOut),
                                    ),
                                  ),
                                  child: DragWidget(
                                    swipeNotifier: swipeNotifier,
                                    index: index,
                                    isLastCard: true,
                                  ),
                                ),
                              );
                            } else {
                              return DragWidget(
                                  index: index, swipeNotifier: swipeNotifier);
                            }
                          }),
                        ),
                      ),
                    ),
                    // child: Center(
                    //   child: InkWell(
                    //     onTap: () => Navigator.push(
                    //         context,
                    //         MaterialPageRoute(
                    //             builder: (_) => const MatchScreen())),
                    //     child: SizedBox(
                    //       width: 295,
                    //       height: 450,
                    // child: Stack(
                    //   children: [
                    //     PageView.builder(
                    //       itemCount: banner.length,
                    //       controller: controller,
                    //       scrollDirection: Axis.horizontal,
                    //       itemBuilder: (context, index) {
                    //         return Padding(
                    //           padding: EdgeInsets.only(
                    //               bottom:
                    //                   MediaQuery.of(context).size.height *
                    //                       .01),
                    //           child: Container(
                    //             width: 295,
                    //             height: 450,
                    //             decoration: BoxDecoration(
                    //                 borderRadius:
                    //                     BorderRadius.circular(15),
                    //                 image: DecorationImage(
                    //                     image: AssetImage(
                    //                         'assets/images/${banner[index]}.png'),
                    //                     fit: BoxFit.fill)),
                    //             child: Column(
                    //               mainAxisAlignment:
                    //                   MainAxisAlignment.end,
                    //               children: [
                    //                 ClipRRect(
                    //                   borderRadius:
                    //                       const BorderRadius.only(
                    //                           bottomLeft:
                    //                               Radius.circular(15),
                    //                           bottomRight:
                    //                               Radius.circular(15)),
                    //                   child: SizedBox(
                    //                     width: 295,
                    //                     height: MediaQuery.of(context)
                    //                             .size
                    //                             .height *
                    //                         .09,
                    //                     child: Center(
                    //                       child: BackdropFilter(
                    //                         filter: ImageFilter.blur(
                    //                             sigmaX: 5, sigmaY: 5),
                    //                         child: SizedBox(
                    //                           width:
                    //                               MediaQuery.of(context)
                    //                                   .size
                    //                                   .width,
                    //                           height:
                    //                               MediaQuery.of(context)
                    //                                       .size
                    //                                       .height *
                    //                                   .09,
                    //                           child: Padding(
                    //                             padding:
                    //                                 const EdgeInsets.all(
                    //                                     10.0),
                    //                             child: Column(
                    //                               crossAxisAlignment:
                    //                                   CrossAxisAlignment
                    //                                       .start,
                    //                               children: [
                    //                                 Text(
                    //                                   'Jessica Parker, 23',
                    //                                   style: style.copyWith(
                    //                                       color:
                    //                                           ColorUtils
                    //                                               .white,
                    //                                       fontWeight:
                    //                                           FontWeight
                    //                                               .w700,
                    //                                       fontSize: 21),
                    //                                 ),
                    //                                 SizeUtils.verticalSpacing(
                    //                                     height: MediaQuery.of(
                    //                                                 context)
                    //                                             .size
                    //                                             .height *
                    //                                         .002),
                    //                                 Text(
                    //                                   'Professional model',
                    //                                   style: style.copyWith(
                    //                                       color:
                    //                                           ColorUtils
                    //                                               .white),
                    //                                 )
                    //                               ],
                    //                             ),
                    //                           ),
                    //                         ),
                    //                       ),
                    //                     ),
                    //                   ),
                    //                 ),
                    //               ],
                    //             ),
                    //           ),
                    //         );
                    //       },
                    //     ),
                    //     Positioned(
                    //       top: MediaQuery.of(context).size.width * .03,
                    //       left: MediaQuery.of(context).size.height * .015,
                    //       child: Container(
                    //         width: 61,
                    //         height: 34,
                    //         decoration: BoxDecoration(
                    //             color: ColorUtils.white.withOpacity(.15),
                    //             borderRadius: BorderRadius.circular(7)),
                    //         child: Row(
                    //           mainAxisAlignment: MainAxisAlignment.center,
                    //           children: [
                    //             SvgPicture.asset(
                    //               'assets/images/location.svg',
                    //               color: ColorUtils.white,
                    //             ),
                    //             SizeUtils.horizontalSpacing(
                    //                 width: MediaQuery.of(context)
                    //                         .size
                    //                         .width *
                    //                     .01),
                    //             Text(
                    //               '1 km',
                    //               style: style.copyWith(
                    //                   fontSize: 12,
                    //                   color: ColorUtils.white),
                    //             )
                    //           ],
                    //         ),
                    //       ),
                    //     ),
                    //     Positioned(
                    //       right: 0,
                    //       top: MediaQuery.of(context).size.height * .2,
                    //       child: Container(
                    //         width: 20,
                    //         height: 76,
                    //         decoration: BoxDecoration(
                    //             color: ColorUtils.white.withOpacity(.15),
                    //             borderRadius: const BorderRadius.only(
                    //                 topLeft: Radius.circular(10),
                    //                 bottomLeft: Radius.circular(10))),
                    //         child: Center(
                    //             child: SmoothPageIndicator(
                    //           axisDirection: Axis.vertical,
                    //           controller: controller,
                    //           count: 5,
                    //           effect: WormEffect(
                    //               spacing: 6,
                    //               dotColor:
                    //                   ColorUtils.white.withOpacity(.5),
                    //               dotWidth: 4,
                    //               dotHeight: 4,
                    //               activeDotColor: ColorUtils.white),
                    //         )),
                    //       ),
                    //     )
                    //   ],
                    // ),
                    //     ),
                    //   ),
                    // ),
                  ),
                ),
                Positioned(
                  left: 0,
                  child: DragTarget<int>(
                    builder: (
                      BuildContext context,
                      List<dynamic> accepted,
                      List<dynamic> rejected,
                    ) {
                      return IgnorePointer(
                        child: Container(
                          height: 700.0,
                          width: 40.0,
                          color: Colors.transparent,
                        ),
                      );
                    },
                    onAccept: (int index) {
                      setState(() {
                        banner.removeAt(index);
                      });
                    },
                  ),
                ),
                Positioned(
                  right: 0,
                  child: DragTarget<int>(
                    builder: (
                      BuildContext context,
                      List<dynamic> accepted,
                      List<dynamic> rejected,
                    ) {
                      return IgnorePointer(
                        child: Container(
                          height: 700.0,
                          width: 40.0,
                          color: Colors.transparent,
                        ),
                      );
                    },
                    onAccept: (int index) {
                      setState(() {
                        banner.removeAt(index);
                      });
                    },
                  ),
                ),
              ],
            ),

            const Spacer(),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ProfileButtons(
                    width: 78,
                    height: 78,
                    color: ColorUtils.white,
                    shadowColor: ColorUtils.primary.withOpacity(.2),
                    icon: 'close2',
                    onCallBack: () {
                      swipeNotifier.value = Swipe.left;
                      _animationController.forward();
                    },
                  ),
                  SizeUtils.horizontalSpacing(
                      width: MediaQuery.of(context).size.width * .05),
                  ProfileButtons(
                    width: 99,
                    height: 99,
                    color: ColorUtils.red,
                    shadowColor: ColorUtils.red.withOpacity(.2),
                    icon: 'heart',
                    onCallBack: () {
                      swipeNotifier.value = Swipe.right;
                      _animationController.forward();
                    },
                  ),
                  SizeUtils.horizontalSpacing(
                      width: MediaQuery.of(context).size.width * .05),
                  ProfileButtons(
                      width: 78,
                      height: 78,
                      color: ColorUtils.white,
                      shadowColor: ColorUtils.primary.withOpacity(.2),
                      icon: 'star'),
                ],
              ),
            ),
            SizeUtils.verticalSpacing(
                height: MediaQuery.of(context).size.height * .04)
          ],
        ),
      )),
    );
  }

  showFilterDiallog() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return FilterDialog();
      },
    );
  }
}

class DragWidget extends StatelessWidget {
  final int index;
  final bool isLastCard;
  const DragWidget(
      {super.key,
      required this.swipeNotifier,
      required this.index,
      this.isLastCard = false});

  final ValueNotifier<Swipe> swipeNotifier;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Draggable<int>(
        data: index,
        onDragUpdate: (DragUpdateDetails dragUpdateDetails) {
          if (dragUpdateDetails.delta.dx > 0 &&
              dragUpdateDetails.globalPosition.dx >
                  MediaQuery.of(context).size.width / 2) {
            swipeNotifier.value = Swipe.right;
          }
          if (dragUpdateDetails.delta.dx < 0 &&
              dragUpdateDetails.globalPosition.dx <
                  MediaQuery.of(context).size.width / 2) {
            swipeNotifier.value = Swipe.left;
          }
        },
        onDragEnd: (drag) {
          swipeNotifier.value = Swipe.none;
        },
        childWhenDragging: Container(
          color: Colors.transparent,
        ),
        feedback: Material(
          type: MaterialType.transparency,
          child: ValueListenableBuilder(
            valueListenable: swipeNotifier,
            builder: (context, value, child) {
              return RotationTransition(
                turns: swipeNotifier.value != Swipe.none
                    ? swipeNotifier.value == Swipe.left
                        ? const AlwaysStoppedAnimation(-25 / 360)
                        : AlwaysStoppedAnimation(25 / 360)
                    : const AlwaysStoppedAnimation(0),
                child: Stack(
                  children: [
                    ProfileCard(index: index),
                    swipeNotifier.value != Swipe.none
                        ? swipeNotifier.value == Swipe.right
                            ? Positioned(
                                top: 40,
                                left: 20,
                                child: ProfileButtons(
                                    width: 78,
                                    height: 78,
                                    color: ColorUtils.red,
                                    shadowColor:
                                        ColorUtils.primary.withOpacity(.2),
                                    icon: 'heart'),
                              )
                            : Positioned(
                                top: 40,
                                right: 24,
                                child: ProfileButtons(
                                    width: 78,
                                    height: 78,
                                    color: ColorUtils.white,
                                    shadowColor: ColorUtils.red.withOpacity(.2),
                                    icon: 'close2'),
                              )
                        : const SizedBox.shrink(),
                  ],
                ),
              );
            },
          ),
        ),
        child: ValueListenableBuilder(
          valueListenable: swipeNotifier,
          builder: (context, value, child) {
            return Stack(
              children: [
                ProfileCard(index: index),
                value != Swipe.none && isLastCard
                    ? value == Swipe.right
                        ? Positioned(
                            top: 40,
                            right: 20,
                            child: ProfileButtons(
                                width: 78,
                                height: 78,
                                color: ColorUtils.red,
                                shadowColor: ColorUtils.primary.withOpacity(.2),
                                icon: 'heart'),
                          )
                        : Positioned(
                            top: 40,
                            left: 24,
                            child: ProfileButtons(
                                width: 78,
                                height: 78,
                                color: ColorUtils.white,
                                shadowColor: ColorUtils.red.withOpacity(.2),
                                icon: 'close2'),
                          )
                    : const SizedBox.shrink()
              ],
            );
          },
        ),
      ),
    );
  }
}

class ProfileCard extends StatelessWidget {
  final int index;
  const ProfileCard({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 295,
      height: 450,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          image: DecorationImage(
              image: AssetImage('assets/images/${banner[index]}.png'),
              fit: BoxFit.fill)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15)),
            child: SizedBox(
              width: 295,
              height: MediaQuery.of(context).size.height * .09,
              child: Center(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * .09,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Jessica Parker, 23',
                            style: style.copyWith(
                                color: ColorUtils.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 21),
                          ),
                          SizeUtils.verticalSpacing(
                              height:
                                  MediaQuery.of(context).size.height * .002),
                          Text(
                            'Professional model',
                            style: style.copyWith(color: ColorUtils.white),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
