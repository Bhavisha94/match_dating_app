import 'package:datting/cubit/filter/cubit/filter_cubit.dart';
import 'package:datting/utils/colors.dart';
import 'package:datting/utils/size.dart';
import 'package:datting/utils/style.dart';
import 'package:datting/widget/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class FilterDialog extends StatefulWidget {
  const FilterDialog({super.key});

  @override
  State<FilterDialog> createState() => _FilterDialogState();
}

class _FilterDialogState extends State<FilterDialog> {
  int interestIndex = 0;
  double minValue = 0.0,
      maxValue = 10.0,
      sliderValue = 2.0,
      minAge = 20,
      maxAge = 28;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FilterCubit, FilterState>(
      listener: (context, state) {
        if (state is InterestFilter) {
          interestIndex = state.index;
        } else if (state is DistanceFilter) {
          sliderValue = state.value;
        }
      },
      builder: (context, state) {
        return Stack(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * .6,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [SvgPicture.asset('assets/images/indicator.svg')],
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * .59,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/bottom.png'),
                        fit: BoxFit.fill)),
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * .05),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppBar(
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                      centerTitle: true,
                      title: Text(
                        'Filters',
                        style: style.copyWith(
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                          color: ColorUtils.primary,
                        ),
                      ),
                      actions: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {},
                              child: Text(
                                'Clear',
                                style: style.copyWith(
                                    color: ColorUtils.red,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizeUtils.verticalSpacing(
                        height: MediaQuery.of(context).size.height * .01),
                    Text(
                      'Interested in',
                      style: style.copyWith(fontWeight: FontWeight.w700),
                    ),
                    SizeUtils.verticalSpacing(
                        height: MediaQuery.of(context).size.height * .015),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 58,
                      decoration: BoxDecoration(
                          border: Border.all(color: ColorUtils.border),
                          borderRadius: BorderRadius.circular(15)),
                      child: IntrinsicHeight(
                        child: Row(
                          children: [
                            interest(context, 'Girls', 0),
                            const VerticalDivider(
                              width: 0,
                              thickness: 2,
                              indent: 15,
                              endIndent: 15,
                            ),
                            interest(context, 'Boys', 1),
                            const VerticalDivider(
                              width: 0,
                              thickness: 2,
                              indent: 15,
                              endIndent: 15,
                            ),
                            interest(context, 'Both', 2)
                          ],
                        ),
                      ),
                    ),
                    SizeUtils.verticalSpacing(
                        height: MediaQuery.of(context).size.height * .015),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Distance',
                          style: style.copyWith(fontWeight: FontWeight.w700),
                        ),
                        Text(
                          '40km',
                          style: style.copyWith(
                              fontSize: 12,
                              color: ColorUtils.primary.withOpacity(.7)),
                        )
                      ],
                    ),
                    SizeUtils.verticalSpacing(
                        height: MediaQuery.of(context).size.height * .015),
                    Slider(
                      value: sliderValue,
                      thumbColor: ColorUtils.red,
                      inactiveColor: ColorUtils.border,
                      activeColor: ColorUtils.red,
                      onChanged: (value) {
                        context.read<FilterCubit>().distance(value);
                      },
                      min: minValue,
                      max: maxValue,
                    ),
                    SizeUtils.verticalSpacing(
                        height: MediaQuery.of(context).size.height * .015),
                    Text(
                      'Age',
                      style: style.copyWith(fontWeight: FontWeight.w700),
                    ),
                    SizeUtils.verticalSpacing(
                        height: MediaQuery.of(context).size.height * .015),
                    RangeSlider(
                      values: RangeValues(minAge, maxAge),
                      min: 15,
                      max: 60,
                      onChanged: (value) {},
                      activeColor: ColorUtils.red,
                    ),
                    const Spacer(),
                    Button(
                        text: 'Continue',
                        onCallBack: () {},
                        width: MediaQuery.of(context).size.width),
                    SizeUtils.verticalSpacing(
                        height: MediaQuery.of(context).size.height * .04),
                  ],
                ),
              ),
            )
          ],
        );
      },
    );
  }

  interest(BuildContext context, String text, int index) {
    return InkWell(
      onTap: () => context.read<FilterCubit>().filter(index),
      child: Container(
        width: MediaQuery.of(context).size.width * .298,
        decoration: BoxDecoration(
            color: interestIndex == index ? ColorUtils.red : Colors.transparent,
            borderRadius: index == 0
                ? const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    bottomLeft: Radius.circular(15))
                : index == 2
                    ? const BorderRadius.only(
                        topRight: Radius.circular(15),
                        bottomRight: Radius.circular(15))
                    : const BorderRadius.all(Radius.zero)),
        child: Center(
          child: Text(
            text,
            style: style.copyWith(
                color: interestIndex == index
                    ? ColorUtils.white
                    : ColorUtils.primary,
                fontWeight: FontWeight.w700),
          ),
        ),
      ),
    );
  }
}
