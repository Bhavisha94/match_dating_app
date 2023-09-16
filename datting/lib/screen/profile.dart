import 'package:datting/utils/colors.dart';
import 'package:datting/utils/list.dart';
import 'package:datting/utils/size.dart';
import 'package:datting/utils/style.dart';
import 'package:datting/widget/gallary_photos.dart';
import 'package:datting/widget/interest.dart';
import 'package:datting/widget/interest_widget.dart';
import 'package:datting/widget/like_favorite_button.dart';
import 'package:datting/widget/profile_buttons.dart';
import 'package:datting/widget/text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtils.white,
      body: Stack(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * .515,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/profile_pic.png'),
                          fit: BoxFit.fill)),
                )
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            child: Stack(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * .52,
                ),
                Positioned(
                  bottom: 0,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * .452,
                    decoration: BoxDecoration(
                        color: ColorUtils.white,
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(25),
                            topRight: Radius.circular(25))),
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * .07,
                        left: MediaQuery.of(context).size.width * .07,
                        right: MediaQuery.of(context).size.width * .07),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ListTile(
                            dense: true,
                            minVerticalPadding: 0,
                            title: Text(
                              'Jessica Parker, 23',
                              style: style.copyWith(
                                  fontSize: 24, fontWeight: FontWeight.w700),
                            ),
                            contentPadding: EdgeInsets.zero,
                            subtitle: Text(
                              'Proffesional model',
                              style: style.copyWith(
                                  color: ColorUtils.primary.withOpacity(.7)),
                            ),
                            trailing: Container(
                              width: 52,
                              height: 52,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(color: ColorUtils.border)),
                              child: Center(
                                  child: SvgPicture.asset(
                                'assets/images/send.svg',
                                color: ColorUtils.red,
                              )),
                            ),
                          ),
                          ListTile(
                            dense: true,
                            contentPadding: EdgeInsets.zero,
                            minVerticalPadding: 0,
                            title: Text(
                              'Location',
                              style: style.copyWith(
                                  fontSize: 16, fontWeight: FontWeight.w700),
                            ),
                            subtitle: Text(
                              'Chicago, IL United States',
                              style: style.copyWith(
                                  color: ColorUtils.primary.withOpacity(.7)),
                            ),
                            trailing: Container(
                              width: 61,
                              height: 34,
                              decoration: BoxDecoration(
                                  color: ColorUtils.red.withOpacity(.1),
                                  borderRadius: BorderRadius.circular(7)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                      'assets/images/location.svg'),
                                  SizeUtils.horizontalSpacing(
                                      width: MediaQuery.of(context).size.width *
                                          .01),
                                  Text(
                                    '1 km',
                                    style: style.copyWith(
                                        fontSize: 12,
                                        color: ColorUtils.red,
                                        fontWeight: FontWeight.w700),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Text(
                            'About',
                            style: style.copyWith(
                                fontSize: 16, fontWeight: FontWeight.w700),
                          ),
                          Text(
                            'My name is Jessica Parker and I enjoy meeting new people and finding ways to help them have an uplifting experience. I enjoy reading..',
                            style: style.copyWith(
                                color: ColorUtils.primary.withOpacity(.7)),
                          ),
                          SizeUtils.verticalSpacing(
                              height: MediaQuery.of(context).size.height * .02),
                          Text(
                            'Interests',
                            style: style.copyWith(
                                fontSize: 16, fontWeight: FontWeight.w700),
                          ),
                          SizeUtils.verticalSpacing(
                              height:
                                  MediaQuery.of(context).size.height * .015),
                          const InterestProfileWidget(),
                          SizeUtils.verticalSpacing(
                              height:
                                  MediaQuery.of(context).size.height * .015),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Gallery',
                                style: style.copyWith(
                                    fontSize: 16, fontWeight: FontWeight.w700),
                              ),
                              const TextButtonWidget(text: 'See all')
                            ],
                          ),
                          SizeUtils.verticalSpacing(
                              height:
                                  MediaQuery.of(context).size.height * .015),
                          const GallaryPhotos(),
                          SizeUtils.verticalSpacing(
                              height: MediaQuery.of(context).size.height * .02),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 0,
                  child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: const LikeFavoriteButtons()),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
