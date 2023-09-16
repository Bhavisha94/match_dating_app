import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

part 'timer_state.dart';

class TimerCubit extends Cubit<TimerState> {
  TimerCubit() : super(TimerState(timer: 59));

  change() {
    int timerCount = 59;
    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (timerCount == 0) {
        timer.cancel();
        emit(TimerState(timer: timerCount));
      } else {
        emit(TimerState(timer: timerCount));
        timerCount--;
      }
    });
  }
}
