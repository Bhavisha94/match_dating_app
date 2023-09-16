import 'package:flutter_bloc/flutter_bloc.dart';

part 'filter_state.dart';

class FilterCubit extends Cubit<FilterState> {
  FilterCubit() : super(FilterInitial());

  filter(int index) {
    emit(InterestFilter(index: index));
  }

  distance(double value) {
    emit(DistanceFilter(value: value));
  }
}
