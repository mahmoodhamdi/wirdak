import 'package:flutter_bloc/flutter_bloc.dart';
import 'prayer_time_state.dart';

class PrayerTimeCubit extends Cubit<PrayerTimeState> {
  PrayerTimeCubit()
      : super(PrayerTimeState(prayerTimes: [
          {
            'name': 'الفجر',
            'time': '04:30',
            'period': 'صباحاً',
            'next': 'الشروق'
          },
          {
            'name': 'الشروق',
            'time': '05:50',
            'period': 'صباحاً',
            'next': 'الظهر'
          },
          {
            'name': 'الظهر',
            'time': '11:45',
            'period': 'مساءً',
            'next': 'العصر'
          },
          {
            'name': 'العصر',
            'time': '02:50',
            'period': 'مساءً',
            'next': 'المغرب'
          },
          {
            'name': 'المغرب',
            'time': '06:30',
            'period': 'مساءً',
            'next': 'العشاء'
          },
          {
            'name': 'العشاء',
            'time': '07:45',
            'period': 'مساءً',
            'next': 'الفجر'
          },
        ]));

  void selectPrayerTime(int index) {
    emit(state.copyWith(selectedIndex: index));
  }

  Map<String, String> getSelectedPrayerInfo() {
    return state.selectedIndex != null
        ? state.prayerTimes[state.selectedIndex!]
        : state.prayerTimes[2]; // Default to Dhuhr if none selected
  }

  Map<String, String> getNextPrayerInfo() {
    int nextIndex = ((state.selectedIndex ?? 2) + 1) % 6;
    return state.prayerTimes[nextIndex];
  }
}
