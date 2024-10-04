class PrayerTimeInfo {
  final List<String> prayerTimes;
  final String location;
  final DateTime currentTime;
  final String nextPrayer;
  final Duration timeUntilNextPrayer;
  final String hijriDate;
  final int nextPrayerIndex;
  final DateTime timeUntilNextPrayerFormatted;

  PrayerTimeInfo({
    required this.nextPrayerIndex,
    required this.hijriDate,
    required this.timeUntilNextPrayerFormatted,
    required this.prayerTimes,
    required this.location,
    required this.currentTime,
    required this.nextPrayer,
    required this.timeUntilNextPrayer,
  });
}
