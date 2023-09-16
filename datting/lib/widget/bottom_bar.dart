import 'package:datting/cubit/bottom_bar/cubit/bottom_bar_cubit.dart';
import 'package:datting/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class BottomBar extends StatelessWidget {
  final int itemIndex;
  const BottomBar({super.key, required this.itemIndex});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * .07,
      color: ColorUtils.border,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          icon(0 == itemIndex ? 'fill_home' : 'home',
              () => context.read<BottomBarCubit>().change(0)),
          icon(1 == itemIndex ? 'fill_favorite' : 'favorite',
              () => context.read<BottomBarCubit>().change(1)),
          icon(2 == itemIndex ? 'fill_message' : 'message',
              () => context.read<BottomBarCubit>().change(2)),
          icon('profile', () => context.read<BottomBarCubit>().change(3))
        ],
      ),
    );
  }

  icon(String icon, VoidCallback onTap) => InkWell(
        onTap: onTap,
        child: SvgPicture.asset(
          'assets/images/$icon.svg',
        ),
      );
}
