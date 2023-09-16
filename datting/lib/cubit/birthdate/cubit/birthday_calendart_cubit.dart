import 'package:flutter_bloc/flutter_bloc.dart';

part 'birthday_calendar_state.dart';

class BirthdayCalendartCubit extends Cubit<BirthdayCalendartState> {
  BirthdayCalendartCubit() : super(BirthdayCalendartInitial());

  day(DateTime date) {
    emit(SelectedDay(dateTime: date));
  }
}
