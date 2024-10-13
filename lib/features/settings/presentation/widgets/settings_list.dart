import 'package:flutter/material.dart';
import 'package:wirdak/core/utils/helpers/awesome_notifications_helper.dart';
import 'package:wirdak/features/settings/presentation/views/prayer_reminder_view.dart';
import 'package:wirdak/features/settings/presentation/widgets/settings_list_item.dart';

class SettingsList extends StatelessWidget {
  const SettingsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return const PrayerReminderView();
            }));
          },
          child: const SettingsListItem(
            title: "تنبيهات الصلاة",
            icon: Icon(
              Icons.alarm,
            ),
          ),
        ),
        GestureDetector(
          onTap: () async {
            await AwesomeNotificationsHelper.cancelAllNotifications();
          },
          child: const SettingsListItem(
            title: "الغي تنبيهات الأذكار",
            icon: Icon(
              Icons.alarm_off_rounded,
            ),
          ),
        ),
      ],
    );
  }
}
