import 'package:datting/cubit/bottom_bar/cubit/bottom_bar_cubit.dart';
import 'package:datting/screen/discover.dart';
import 'package:datting/screen/matches.dart';
import 'package:datting/screen/messages.dart';
import 'package:datting/screen/profile.dart';
import 'package:datting/utils/colors.dart';
import 'package:datting/widget/bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int index = 0;
  List<Widget> list = [
    const Discover(),
    const Matches(),
    const Messages(),
    const Profile()
  ];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BottomBarCubit, BottomBarState>(
      listener: (context, state) {
        if (state is BottomBarIndex) {
          index = state.index;
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: ColorUtils.white,
          body: list[index],
          bottomNavigationBar: BottomBar(
            itemIndex: index,
          ),
        );
      },
    );
  }
}
