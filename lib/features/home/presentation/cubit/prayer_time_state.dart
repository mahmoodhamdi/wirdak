import 'package:equatable/equatable.dart';

class PrayerTimeState extends Equatable {
  final int? selectedIndex;
  final List<Map<String, String>> prayerTimes;

  const PrayerTimeState({
    this.selectedIndex,
    required this.prayerTimes,
  });

  @override
  List<Object?> get props => [selectedIndex, prayerTimes];

  PrayerTimeState copyWith({
    int? selectedIndex,
    List<Map<String, String>>? prayerTimes,
  }) {
    return PrayerTimeState(
      selectedIndex: selectedIndex ?? this.selectedIndex,
      prayerTimes: prayerTimes ?? this.prayerTimes,
    );
  }
}
