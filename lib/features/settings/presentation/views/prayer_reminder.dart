import 'package:flutter/material.dart';
import 'package:wirdak/core/common/widgets/custom_app_bar.dart';

class PrayerReminderView extends StatelessWidget {
  const PrayerReminderView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: 'تنبيهات الصلاة'),
      body: Column(
        children: [
          Column(
            children: [
              PrayerTimeTile(time: 'الفجر', isActive: true, isSoundOn: true),
              PrayerTimeTile(time: 'الشروق', isActive: false, isSoundOn: false),
              PrayerTimeTile(time: 'الظهر', isActive: true, isSoundOn: true),
              PrayerTimeTile(time: 'العصر', isActive: false, isSoundOn: false),
              PrayerTimeTile(time: 'المغرب', isActive: true, isSoundOn: true),
              PrayerTimeTile(time: 'العشاء', isActive: false, isSoundOn: false),
            ],
          ),
        ],
      ),
    );
  }
}

class PrayerTimeTile extends StatelessWidget {
  final String time;
  final bool isActive;
  final bool isSoundOn;

  const PrayerTimeTile({
    super.key,
    required this.time,
    required this.isActive,
    required this.isSoundOn,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: const Color(0x80F5F5F5),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                isSoundOn ? Icons.volume_up : Icons.volume_off,
                color: isActive
                    ? const Color(0xFF01b7f1)
                    : const Color(0xFFADADAD),
              ),
              const SizedBox(width: 10),
              Text(
                time,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: isActive ? FontWeight.w600 : FontWeight.w400,
                  color: isActive
                      ? const Color(0xFF01b7f1)
                      : const Color(0xFFADADAD),
                ),
              ),
            ],
          ),
          Switch(
            value: isActive,
            onChanged: (value) {},
            activeColor: const Color(0xFF01b7f1),
          ),
        ],
      ),
    );
  }
}
