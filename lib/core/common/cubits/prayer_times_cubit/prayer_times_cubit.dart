import 'dart:developer';

import 'package:adhan/adhan.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:wirdak/core/common/cubits/prayer_times_cubit/prayer_times_state.dart';
import 'package:wirdak/core/common/models/prayer_time_info.dart';
import 'package:wirdak/core/utils/formatters/formatter.dart';

class PrayerTimesCubit extends Cubit<PrayerTimesState> {
  PrayerTimesCubit() : super(PrayerTimesInitial());
  // Prayer names in Arabic
  final List<String> prayerNames = [
    'الفجر',
    'الشروق',
    'الظهر',
    'العصر',
    'المغرب',
    'العشاء'
  ];
  void selectPrayerTime(int index) {
    if (state is PrayerTimesLoaded) {
      final currentState = state as PrayerTimesLoaded;
      emit(currentState.copyWith(selectedIndex: index));
    }
  }

  Map<String, String> getSelectedPrayerInfo() {
    if (state is PrayerTimesLoaded) {
      final currentState = state as PrayerTimesLoaded;
      final selectedIndex = currentState.selectedIndex ??
          currentState.prayerTimeInfo.nextPrayerIndex;

      return {
        'name': prayerNames[selectedIndex],
        'time': currentState.prayerTimeInfo.prayerTimes[selectedIndex],
        'period': _determinePeriod(
            currentState.prayerTimeInfo.prayerTimes[selectedIndex]),
        'next': prayerNames[(selectedIndex + 1) % 6]
      };
    }
    return {'name': '', 'time': '', 'period': '', 'next': ''};
  }

  Map<String, String> getNextPrayerInfo() {
    if (state is PrayerTimesLoaded) {
      final currentState = state as PrayerTimesLoaded;
      final selectedIndex = currentState.selectedIndex ??
          currentState.prayerTimeInfo.nextPrayerIndex;
      final nextIndex = (selectedIndex + 1) % 6;

      return {
        'name': prayerNames[nextIndex],
        'time': currentState.prayerTimeInfo.prayerTimes[nextIndex],
        'period': _determinePeriod(
            currentState.prayerTimeInfo.prayerTimes[nextIndex]),
        'next': prayerNames[(nextIndex + 1) % 6]
      };
    }
    return {'name': '', 'time': '', 'period': '', 'next': ''};
  }

  String _determinePeriod(String time) {
    final hour = int.parse(time.split(':')[0]);
    return (hour <= 12) ? 'مساءً' : 'صباحاً';
  }

  Future<void> loadPrayerTimes() async {
    emit(PrayerTimesLoading());
    try {
      final position = await determinePosition();
      final location = await getLocationName(position);
      final prayerTimes = await _getPrayerTimes(position);
      final nextPrayerInfo = _calculateNextPrayer(prayerTimes.prayerTimes);

      final prayerTimeInfo = PrayerTimeInfo(
          nextPrayerIndex: nextPrayerInfo.index,
          prayerTimes: prayerTimes.prayersStringTimes,
          location: location,
          currentTime: DateTime.now(),
          nextPrayer: nextPrayerInfo.name,
          timeUntilNextPrayer: nextPrayerInfo.duration,
          hijriDate: getHijriDate(),
          timeUntilNextPrayerFormatted:
              timeUntilNextPrayer(nextPrayerInfo.duration));

      emit(PrayerTimesLoaded(
        prayerTimeInfo: prayerTimeInfo,
        selectedIndex:
            nextPrayerInfo.index, // Set initial selection to next prayer
      ));
    } catch (e) {
      emit(PrayerTimesError(e.toString()));
    }
  }

 static Future<String> getLocationName(Position position) async {
    try {
      final placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );
      if (placemarks.isNotEmpty) {
        final place = placemarks.first;
        return '${place.locality}, ${place.country}';
      }
      return 'Unknown Location';
    } catch (e) {
      log('Error getting location name: $e');
      return 'Unknown Location';
    }
  }

  String getHijriDate() {
    HijriCalendar.setLocal('ar'); // Set locale to Arabic for Hijri dates

    final hijri = HijriCalendar.now();

    return '${hijri.hDay} ${hijri.longMonthName} ${hijri.hYear}'; // Returns the date in Arabic
  }

  // Updated method to return the name, duration, and index of the next prayer
  _NextPrayerInfo _calculateNextPrayer(List<DateTime> prayerTimes) {
    final now = DateTime.now();
    DateTime? nextPrayerTime;
    String nextPrayerName = '';
    int nextPrayerIndex = -1; // Initialize index
    final prayerNames = [
      'الفجر',
      'الشروق',
      'الظهر',
      'العصر',
      'المغرب',
      'العشاء'
    ];

    for (var i = 0; i < prayerTimes.length; i++) {
      if (prayerTimes[i].isAfter(now)) {
        nextPrayerTime = prayerTimes[i];
        nextPrayerName = prayerNames[i];
        nextPrayerIndex = i; // Set the index of the next prayer
        break;
      }
    }

    if (nextPrayerTime == null) {
      // If no next prayer found today, use first prayer of next day
      nextPrayerTime = prayerTimes[0].add(const Duration(days: 1));
      nextPrayerName = prayerNames[0];
      nextPrayerIndex = 0; // Reset to first prayer index
    }

    return _NextPrayerInfo(
        nextPrayerName, nextPrayerTime.difference(now), nextPrayerIndex);
  }

  DateTime timeUntilNextPrayer(Duration duration) {
    final hours = duration.inHours;
    final minutes = duration.inMinutes % 60;

    return DateTime.now().add(Duration(hours: hours, minutes: minutes));
  }

  Future<Position> determinePosition() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    return await Geolocator.getCurrentPosition();
  }

  Future<_GetPrayerTimes> _getPrayerTimes(Position position) async {
    log('Prayer Times Calculation');
    final coordinates = Coordinates(position.latitude, position.longitude);
    final params = CalculationMethod.egyptian.getParameters();
    params.madhab = Madhab.hanafi;
    final prayerTimes = PrayerTimes.today(coordinates, params);

    return _GetPrayerTimes(
      prayerTimes: [
        prayerTimes.fajr,
        prayerTimes.sunrise,
        prayerTimes.dhuhr,
        prayerTimes.asr,
        prayerTimes.maghrib,
        prayerTimes.isha,
      ],
      prayersStringTimes: [
        TFormatter.formatTime(prayerTimes.fajr),
        TFormatter.formatTime(prayerTimes.sunrise),
        TFormatter.formatTime(prayerTimes.dhuhr),
        TFormatter.formatTime(prayerTimes.asr),
        TFormatter.formatTime(prayerTimes.maghrib),
        TFormatter.formatTime(prayerTimes.isha)
      ],
    );
  }
}

// helper class
class _GetPrayerTimes {
  final List<DateTime> prayerTimes;
  final List<String> prayersStringTimes;
  _GetPrayerTimes(
      {required this.prayerTimes, required this.prayersStringTimes});
}

class _NextPrayerInfo {
  final String name;
  final Duration duration;
  final int index;

  _NextPrayerInfo(this.name, this.duration, this.index);
}
