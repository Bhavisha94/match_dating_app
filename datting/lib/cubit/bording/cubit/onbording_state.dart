part of 'onbording_cubit.dart';

abstract class OnbordingState {}

class OnbordingInitial extends OnbordingState {}

class OnbordingIndex extends OnbordingState {
  final int index;
  OnbordingIndex({required this.index});
}
