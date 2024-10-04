import 'package:wirdak/core/common/models/prayer_time_info.dart';

abstract class PrayerTimesState {}

class PrayerTimesInitial extends PrayerTimesState {}

class PrayerTimesLoading extends PrayerTimesState {}

class PrayerTimesLoaded extends PrayerTimesState {
  final PrayerTimeInfo prayerTimeInfo;

  PrayerTimesLoaded({required this.prayerTimeInfo});
}

class PrayerTimesError extends PrayerTimesState {
  final String message;

  PrayerTimesError(this.message);
}
