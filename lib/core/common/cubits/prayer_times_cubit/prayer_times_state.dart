import 'package:wirdak/core/common/models/prayer_time_info.dart';

abstract class PrayerTimesState {
  const PrayerTimesState();
}

class PrayerTimesInitial extends PrayerTimesState {}

class PrayerTimesLoading extends PrayerTimesState {}

class PrayerTimesLoaded extends PrayerTimesState {
  final PrayerTimeInfo prayerTimeInfo;
  final int? selectedIndex;

  const PrayerTimesLoaded({
    required this.prayerTimeInfo,
    this.selectedIndex,
  });

  PrayerTimesLoaded copyWith({
    PrayerTimeInfo? prayerTimeInfo,
    int? selectedIndex,
  }) {
    return PrayerTimesLoaded(
      prayerTimeInfo: prayerTimeInfo ?? this.prayerTimeInfo,
      selectedIndex: selectedIndex ?? this.selectedIndex,
    );
  }
}

class PrayerTimesError extends PrayerTimesState {
  final String message;

  const PrayerTimesError(this.message);
}
