// ignore_for_file: library_private_types_in_public_api

import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:wirdak/core/utils/formatters/formatter.dart';

class RemainingTimeWidget extends StatefulWidget {
  final DateTime nextPrayerTime;
  final String nextPrayerName;

  const RemainingTimeWidget({
    super.key,
    required this.nextPrayerTime,
    required this.nextPrayerName,
  });

  @override
  _RemainingTimeWidgetState createState() => _RemainingTimeWidgetState();
}

class _RemainingTimeWidgetState extends State<RemainingTimeWidget> {
  late Timer _timer;
  Duration _remainingTime = Duration.zero;

  @override
  void initState() {
    super.initState();
    _updateRemainingTime();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      _updateRemainingTime();
    });
  }

  void _updateRemainingTime() {
    final now = DateTime.now();
    final difference = widget.nextPrayerTime.difference(now);
    setState(() {
      _remainingTime = difference.isNegative ? Duration.zero : difference;
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            const Text(
              'الوقت المتبقي',
              style: TextStyle(
                color: Color(0x7F1E1E1E),
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            ),
            Text(
              'لصلاة ${widget.nextPrayerName}',
              style: const TextStyle(
                color: Color(0xFF01B7F1),
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        const SizedBox(width: 10),
        Text(
          TFormatter.formatDuration(_remainingTime),
          style: const TextStyle(
            color: Color(0x7F1E1E1E),
            fontSize: 20,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w300,
          ),
        ),
      ],
    );
  }
}
