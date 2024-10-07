import 'package:flutter/material.dart';
import 'package:wirdak/core/utils/helpers/awesome_notifications_helper.dart';
import 'package:wirdak/core/utils/helpers/spacing.dart';
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
        SettingsListItem(
            title: "تحديث الموقع",
            icon: Row(
              children: [
                const Text(
                  'القاهرة، مصر',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0x7F1E1E1E),
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                horizontalSpace(5),
                const Icon(
                  Icons.refresh,
                  color: Color(0xff01B7F1),
                  size: 24,
                ),
              ],
            )),
        SettingsListItem(
          title: "الإنجليزية",
          icon: Switch(
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              activeColor: Colors.white,
              activeTrackColor: const Color(0xFF01B7F1),
              value: true,
              onChanged: (value) {}),
        ),
        const SettingsListItem(
          textColor: Color(0xFF01B7F1),
          color: Color(0xCCEDFBFF),
          title: "إصدار التطبيق",
          icon: Row(
            children: [
              Text(
                '1.0.0 اصدار',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0x7F01B7F1),
                  fontSize: 14,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w300,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
