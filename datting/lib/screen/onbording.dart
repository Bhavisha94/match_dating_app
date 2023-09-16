import 'package:carousel_slider/carousel_slider.dart';
import 'package:datting/cubit/bording/cubit/onbording_cubit.dart';
import 'package:datting/screen/mobile_signup.dart';
import 'package:datting/screen/signup.dart';
import 'package:datting/utils/colors.dart';
import 'package:datting/utils/list.dart';
import 'package:datting/utils/size.dart';
import 'package:datting/utils/style.dart';
import 'package:datting/widget/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnBording extends StatefulWidget {
  const OnBording({super.key});

  @override
  State<OnBording> createState() => _OnBordingState();
}

class _OnBordingState extends State<OnBording> {
  CarouselController controller = CarouselController();
  PageController pageController = PageController();
  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtils.white,
      body: BlocConsumer<OnbordingCubit, OnbordingState>(
        listener: (context, state) {
          if (state is OnbordingIndex) {
            pageIndex = state.index;
          }
        },
        builder: (context, state) {
          return Column(
            children: [
              SizeUtils.verticalSpacing(
                  height: MediaQuery.of(context).size.height * .05),
              CarouselSlider.builder(
                itemCount: bordingList.length,
                carouselController: controller,
                options: CarouselOptions(
                  initialPage: 0,
                  height: MediaQuery.of(context).size.height * .5,
                  enableInfiniteScroll: true,
                  viewportFraction: .6,
                  enlargeCenterPage: true,
                  onPageChanged: (index, reason) {
                    context.read<OnbordingCubit>().change(index);
                  },
                ),
                itemBuilder: (context, index, _) {
                  return Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                                'assets/images/${bordingList[index].imagePath}.png'))),
                  );
                },
              ),
              SizeUtils.verticalSpacing(
                  height: MediaQuery.of(context).size.height * .03),
              Text(
                bordingList[pageIndex].title,
                style: style.copyWith(
                    color: ColorUtils.red,
                    fontWeight: FontWeight.w700,
                    fontSize: 24),
              ),
              SizeUtils.verticalSpacing(
                  height: MediaQuery.of(context).size.height * .015),
              SizedBox(
                width: 295,
                child: Text(
                  bordingList[pageIndex].description,
                  textAlign: TextAlign.center,
                  style: style.copyWith(color: ColorUtils.secondary),
                ),
              ),
              SizeUtils.verticalSpacing(
                  height: MediaQuery.of(context).size.height * .025),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: bordingList.asMap().entries.map((entry) {
                  return GestureDetector(
                    onTap: () => controller.animateToPage(entry.key),
                    child: Container(
                      width: 8.0,
                      height: 8.0,
                      margin: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 2.0),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: pageIndex == entry.key
                              ? ColorUtils.red
                              : ColorUtils.primary.withOpacity(.1)),
                    ),
                  );
                }).toList(),
              ),
              SizeUtils.verticalSpacing(
                  height: MediaQuery.of(context).size.height * .04),
              Button(
                  width: MediaQuery.of(context).size.width * .8,
                  text: 'Create an account',
                  onCallBack: () async {
                    SharedPreferences pref =
                        await SharedPreferences.getInstance();
                    pref.setBool('isLogin', false);
                    if (mounted) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignUp()));
                    }
                  }),
              SizeUtils.verticalSpacing(
                  height: MediaQuery.of(context).size.height * .03),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account?',
                    style: style.copyWith(color: ColorUtils.primary),
                  ),
                  SizeUtils.horizontalSpacing(
                      width: MediaQuery.of(context).size.width * .015),
                  InkWell(
                    onTap: () async {
                      SharedPreferences pref =
                          await SharedPreferences.getInstance();
                      pref.setBool('isLogin', true);
                      if (mounted) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const MobileSignUp()));
                      }
                    },
                    child: Text(
                      'Sign In',
                      style: style.copyWith(
                          color: ColorUtils.red, fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              )
            ],
          );
        },
      ),
    );
  }
}
