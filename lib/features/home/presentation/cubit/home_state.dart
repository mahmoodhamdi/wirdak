import 'package:equatable/equatable.dart';

class HomeState extends Equatable {
  final int? selectedIndex;
  final List<Map<String, String>> prayerTimes;

  const HomeState({
    this.selectedIndex,
    required this.prayerTimes,
  });

  @override
  List<Object?> get props => [selectedIndex, prayerTimes];

  HomeState copyWith({
    int? selectedIndex,
    List<Map<String, String>>? prayerTimes,
  }) {
    return HomeState(
      selectedIndex: selectedIndex ?? this.selectedIndex,
      prayerTimes: prayerTimes ?? this.prayerTimes,
    );
  }
}
