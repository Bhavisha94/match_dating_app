import 'dart:developer';

import 'package:datting/cubit/birthdate/cubit/birthday_calendart_cubit.dart';
import 'package:datting/screen/gender.dart';
import 'package:datting/utils/colors.dart';
import 'package:datting/utils/size.dart';
import 'package:datting/utils/style.dart';
import 'package:datting/widget/button.dart';
import 'package:datting/widget/textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:table_calendar/table_calendar.dart';

class ProfileDetails extends StatefulWidget {
  const ProfileDetails({super.key});

  @override
  State<ProfileDetails> createState() => _ProfileDetailsState();
}

class _ProfileDetailsState extends State<ProfileDetails> {
  DateTime today = DateTime.now();
  String selectedDay = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtils.white,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * .05),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                    onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Gender())),
                    child: Text('Skip',
                        style: style.copyWith(color: ColorUtils.red)))
              ],
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Text(
                'Profile details',
                style:
                    style.copyWith(fontSize: 34, fontWeight: FontWeight.w700),
              ),
            ),
            SizeUtils.verticalSpacing(
                height: MediaQuery.of(context).size.height * .1),
            Stack(
              children: [
                const SizedBox(
                  width: 101,
                  height: 106,
                ),
                Positioned(
                  top: 0,
                  left: 0,
                  child: Container(
                    width: 99,
                    height: 99,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: const DecorationImage(
                            image: AssetImage('assets/images/profile.png'),
                            fit: BoxFit.fill)),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    width: 34,
                    height: 34,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: ColorUtils.white, width: 2),
                        color: ColorUtils.red),
                    child: Center(
                      child: SvgPicture.asset('assets/images/camera.svg'),
                    ),
                  ),
                )
              ],
            ),
            SizeUtils.verticalSpacing(
                height: MediaQuery.of(context).size.height * .05),
            const TextFieldWidget(label: 'First name'),
            SizeUtils.verticalSpacing(
                height: MediaQuery.of(context).size.height * .015),
            const TextFieldWidget(label: 'Last name'),
            SizeUtils.verticalSpacing(
                height: MediaQuery.of(context).size.height * .015),
            InkWell(
              onTap: () => showModelBottomSheet(),
              child:
                  BlocConsumer<BirthdayCalendartCubit, BirthdayCalendartState>(
                listener: (context, state) {
                  if (state is SelectedDay) {
                    selectedDay =
                        '${state.dateTime.day}/${state.dateTime.month}/${state.dateTime.year}';
                  }
                },
                builder: (context, state) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * .06,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: ColorUtils.red.withOpacity(.1)),
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      children: [
                        SvgPicture.asset('assets/images/calendar.svg'),
                        SizeUtils.horizontalSpacing(
                            width: MediaQuery.of(context).size.width * .04),
                        Text(
                          selectedDay == ''
                              ? 'Choose birthday date'
                              : selectedDay,
                          style: style.copyWith(
                              color: ColorUtils.red,
                              fontWeight: FontWeight.w700),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
            const Spacer(),
            Button(
              text: 'Confirm',
              onCallBack: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Gender())),
              width: MediaQuery.of(context).size.width,
            ),
            SizeUtils.verticalSpacing(
                height: MediaQuery.of(context).size.height * .04),
          ],
        ),
      )),
    );
  }

  showModelBottomSheet() {
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return Stack(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * .64,
            ),
            Positioned(
              bottom: 0,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * .63,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/bottom.png'),
                        fit: BoxFit.fill)),
                child: Column(
                  children: [
                    SizeUtils.verticalSpacing(
                        height: MediaQuery.of(context).size.height * .02),
                    StatefulBuilder(
                      builder: (context, setState) {
                        return TableCalendar(
                          locale: 'en_US',
                          focusedDay: today,
                          firstDay: DateTime.utc(1990, 12, 31),
                          lastDay: DateTime.utc(2050, 12, 31),
                          daysOfWeekVisible: false,
                          onDaySelected: (selectedDay, focusedDay) {
                            setState(() {
                              today = selectedDay;
                            });
                          },
                          selectedDayPredicate: (day) {
                            return isSameDay(today, day);
                          },
                          calendarStyle: CalendarStyle(
                            selectedDecoration: BoxDecoration(
                              color: ColorUtils.red,
                              shape: BoxShape.circle,
                            ),
                            todayDecoration: const BoxDecoration(
                              color: Colors.transparent,
                              shape: BoxShape.circle,
                            ),
                          ),
                          headerStyle: HeaderStyle(
                              titleCentered: true,
                              formatButtonVisible: false,
                              titleTextStyle:
                                  style.copyWith(color: ColorUtils.red)),
                          availableGestures: AvailableGestures.all,
                        );
                      },
                    ),
                    SizeUtils.verticalSpacing(
                        height: MediaQuery.of(context).size.height * .02),
                    Button(
                      text: 'Save',
                      onCallBack: () {
                        context.read<BirthdayCalendartCubit>().day(today);
                        Navigator.pop(context);
                      },
                      width: MediaQuery.of(context).size.width * .8,
                    ),
                    SizeUtils.verticalSpacing(
                        height: MediaQuery.of(context).size.height * .04)
                  ],
                ),
              ),
            ),
            Positioned(
              top: 0,
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: SvgPicture.asset('assets/images/indicator.svg'),
              ),
            )
          ],
        );
      },
    );
  }
}
