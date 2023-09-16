part of 'birthday_calendart_cubit.dart';

abstract class BirthdayCalendartState {}

class BirthdayCalendartInitial extends BirthdayCalendartState {}

class SelectedDay extends BirthdayCalendartState {
  final DateTime dateTime;
  SelectedDay({required this.dateTime});
}
