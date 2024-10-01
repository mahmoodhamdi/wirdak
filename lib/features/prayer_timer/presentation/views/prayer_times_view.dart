import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:one_clock/one_clock.dart';
import 'package:wirdak/core/common/widgets/custom_app_bar.dart';
import 'package:wirdak/core/common/widgets/location_and_date_header.dart';
import 'package:wirdak/core/utils/constants/image_strings.dart';
import 'package:wirdak/core/utils/helpers/spacing.dart';
import 'package:wirdak/features/prayer_timer/presentation/widgets/horizontal_prayer_time.dart';

class PrayerTimesView extends StatelessWidget {
  const PrayerTimesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
          centerTitle: true,
          icon: Icons.timelapse_outlined,
          title: 'مواقيت الصلاة'),
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Image.asset(
                ImageStrings.backgroundMasjid,
                width: double.infinity,
              ),
              verticalSpace(100)
            ],
          ),
          Positioned.fill(
            child: Column(
              children: [
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                  child: const LocationAndDateHeader(
                    gregorianDate: '12 الثلاثاء ديسمبر 2023',
                    hijriDate: 'الأحد ربيع الأول 1445',
                    locationLabel: 'المكان',
                    location: 'القاهرة، مصر',
                    color: Color(0xff01B7F1),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: SizedBox(
                    height: 150.h,
                    child: AnalogClock(
                      datetime: DateTime.now(),
                      isLive: true,
                      showAllNumbers: true,
                      textScaleFactor: 1.5,
                      decoration: const BoxDecoration(color: Colors.white),
                      showDigitalClock: false,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Column(
                      children: [
                        Text(
                          'الوقت المتبقي',
                          style: TextStyle(
                            color: Color(0x7F1E1E1E),
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          ' لصلاة الظهر',
                          style: TextStyle(
                            color: Color(0xFF01B7F1),
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    horizontalSpace(10),
                    const Text(
                      '-04:55',
                      style: TextStyle(
                        color: Color(0x7F1E1E1E),
                        fontSize: 20,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
                verticalSpace(20),
                const Column(
                  children: [
                    HorizontalPrayerTime(
                      time: '3:30',
                      iconPath: ImageStrings.iconSunWhite,
                      title: 'الفجر',
                    ),
                    HorizontalPrayerTime(
                      time: '7:30',
                      iconPath: ImageStrings.iconSunrise,
                      title: 'الشروق',
                    ),
                    HorizontalPrayerTime(
                      time: '11:30',
                      iconPath: ImageStrings.iconSunBold,
                      title: 'الظهر',
                      isSelected: true,
                    ),
                    HorizontalPrayerTime(
                      time: '15:00',
                      iconPath: ImageStrings.iconCloudSun,
                      title: 'العصر',
                    ),
                    HorizontalPrayerTime(
                      time: '19:00',
                      iconPath: ImageStrings.iconSunset,
                      title: 'المغرب',
                    ),
                    HorizontalPrayerTime(
                      time: '20:00',
                      iconPath: ImageStrings.iconMoon,
                      title: 'العشاء',
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
