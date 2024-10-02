import 'dart:developer';

import 'package:adhan/adhan.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'package:wirdak/core/utils/helpers/gelocation_helper.dart';

void getPrayerTimes() async {
  final Position position = await determinePosition();
  log('Cairo Prayer Times');
  final Coordinates myCoordinates = Coordinates(position.latitude,
      position.longitude); // Replace with your own location lat, lng.
  final params = CalculationMethod.karachi.getParameters();
  params.madhab = Madhab.hanafi;
  final prayerTimes = PrayerTimes.today(myCoordinates, params);

  log("---Today's Prayer Times in Your Local Timezone(${prayerTimes.nextPrayer()})---");
  log(DateFormat.jm().format(prayerTimes.fajr));
  log(DateFormat.jm().format(prayerTimes.sunrise));
  log(DateFormat.jm().format(prayerTimes.dhuhr));
  log(DateFormat.jm().format(prayerTimes.asr));
  log(DateFormat.jm().format(prayerTimes.maghrib));
  log(DateFormat.jm().format(prayerTimes.isha));

  log('---');
}
