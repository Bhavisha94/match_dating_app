part of 'filter_cubit.dart';

abstract class FilterState {}

class FilterInitial extends FilterState {}

class InterestFilter extends FilterState {
  final int index;
  InterestFilter({required this.index});
}

class DistanceFilter extends FilterState {
  final double value;
  DistanceFilter({required this.value});
}
