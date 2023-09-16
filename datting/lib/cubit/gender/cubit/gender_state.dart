part of 'gender_cubit.dart';

abstract class GenderState {}

class GenderInitial extends GenderState {}

class GenderIndex extends GenderState {
  final int index;
  GenderIndex({required this.index});
}
