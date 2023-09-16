import 'package:datting/cubit/birthdate/cubit/birthday_calendart_cubit.dart';
import 'package:datting/cubit/bording/cubit/onbording_cubit.dart';
import 'package:datting/cubit/bottom_bar/cubit/bottom_bar_cubit.dart';
import 'package:datting/cubit/filter/cubit/filter_cubit.dart';
import 'package:datting/cubit/gender/cubit/gender_cubit.dart';
import 'package:datting/cubit/image_fullscreen/cubit/fullscreen_image_cubit.dart';
import 'package:datting/cubit/timer/cubit/timer_cubit.dart';
import 'package:datting/screen/dashboard.dart';
import 'package:datting/screen/onbording.dart';
import 'package:datting/screen/profile_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<OnbordingCubit>(create: (_) => OnbordingCubit()),
        BlocProvider<TimerCubit>(create: (_) => TimerCubit()),
        BlocProvider<GenderCubit>(create: (_) => GenderCubit()),
        BlocProvider<BottomBarCubit>(create: (_) => BottomBarCubit()),
        BlocProvider<FullscreenImageCubit>(
            create: (_) => FullscreenImageCubit()),
        BlocProvider<BirthdayCalendartCubit>(
            create: (_) => BirthdayCalendartCubit()),
        BlocProvider<FilterCubit>(create: (_) => FilterCubit())
      ],
      child: MaterialApp(
        title: 'Match',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const OnBording(),
      ),
    );
  }
}
