import 'package:equatable/equatable.dart';

class PrayerReminder {
  final String time;
  final bool isActive;
  final bool isSoundOn;

  PrayerReminder(
      {required this.time, required this.isActive, required this.isSoundOn});

  PrayerReminder copyWith({bool? isActive, bool? isSoundOn}) {
    return PrayerReminder(
      time: time,
      isActive: isActive ?? this.isActive,
      isSoundOn: isSoundOn ?? this.isSoundOn,
    );
  }
}

class PrayerReminderState extends Equatable {
  final List<PrayerReminder> reminders;

  const PrayerReminderState({required this.reminders});

  @override
  List<Object> get props => [reminders];
}
