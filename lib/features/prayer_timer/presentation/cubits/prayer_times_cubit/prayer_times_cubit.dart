import 'dart:developer';

import 'package:adhan/adhan.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:wirdak/features/prayer_timer/models/prayer_time_info.dart';
import 'package:wirdak/features/prayer_timer/presentation/cubits/prayer_times_cubit/prayer_times_state.dart';

class PrayerTimesCubit extends Cubit<PrayerTimesState> {
  PrayerTimesCubit() : super(PrayerTimesInitial());

  Future<void> loadPrayerTimes() async {
    emit(PrayerTimesLoading());
    try {
      final position = await _determinePosition();
      final location = await _getLocationName(position);
      final prayerTimes = await _getPrayerTimes(position);
      final nextPrayerInfo = _calculateNextPrayer(prayerTimes);

      final prayerTimeInfo = PrayerTimeInfo(
          nextPrayerIndex: nextPrayerInfo.index,
          prayerTimes: prayerTimes,
          location: location,
          currentTime: DateTime.now(),
          nextPrayer: nextPrayerInfo.name,
          timeUntilNextPrayer: nextPrayerInfo.duration,
          hijriDate: getHijriDate(),
          timeUntilNextPrayerFormatted:
              timeUntilNextPrayer(nextPrayerInfo.duration));

      emit(PrayerTimesLoaded(prayerTimeInfo: prayerTimeInfo));
    } catch (e) {
      emit(PrayerTimesError(e.toString()));
    }
  }

  Future<String> _getLocationName(Position position) async {
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

  Future<Position> _determinePosition() async {
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

  Future<List<DateTime>> _getPrayerTimes(Position position) async {
    log('Prayer Times Calculation');
    final coordinates = Coordinates(position.latitude, position.longitude);
    final params = CalculationMethod.egyptian.getParameters();
    params.madhab = Madhab.hanafi;
    final prayerTimes = PrayerTimes.today(coordinates, params);

    return [
      prayerTimes.fajr.add(const Duration(minutes: 60)),
      prayerTimes.sunrise.add(const Duration(minutes: 60)),
      prayerTimes.dhuhr.add(const Duration(minutes: 60)),
      prayerTimes.asr.add(const Duration(minutes: 60)),
      prayerTimes.maghrib.add(const Duration(minutes: 60)),
      prayerTimes.isha.add(const Duration(minutes: 60))
    ];
  }
}

class _NextPrayerInfo {
  final String name;
  final Duration duration;
  final int index;

  _NextPrayerInfo(this.name, this.duration, this.index);
}
