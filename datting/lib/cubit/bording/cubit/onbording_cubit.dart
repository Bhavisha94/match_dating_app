import 'package:flutter_bloc/flutter_bloc.dart';
part 'onbording_state.dart';

class OnbordingCubit extends Cubit<OnbordingState> {
  OnbordingCubit() : super(OnbordingInitial());

  change(int index) {
    emit(OnbordingIndex(index: index));
  }
}
