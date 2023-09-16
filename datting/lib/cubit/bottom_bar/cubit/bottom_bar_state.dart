part of 'bottom_bar_cubit.dart';

abstract class BottomBarState {}

class BottomBarInitial extends BottomBarState {}

class BottomBarIndex extends BottomBarState {
  final int index;
  BottomBarIndex({required this.index});
}
