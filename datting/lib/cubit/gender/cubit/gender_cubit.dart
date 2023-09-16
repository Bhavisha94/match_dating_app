import 'package:flutter_bloc/flutter_bloc.dart';

part 'gender_state.dart';

class GenderCubit extends Cubit<GenderState> {
  GenderCubit() : super(GenderInitial());

  select(int index) {
    emit(GenderIndex(index: index));
  }
}
