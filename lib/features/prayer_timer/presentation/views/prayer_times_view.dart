import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:one_clock/one_clock.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:wirdak/core/common/widgets/custom_app_bar.dart';
import 'package:wirdak/core/common/widgets/location_and_date_header.dart';
import 'package:wirdak/core/utils/constants/image_strings.dart';
import 'package:wirdak/core/utils/formatters/formatter.dart';
import 'package:wirdak/core/utils/helpers/spacing.dart';
import 'package:wirdak/features/prayer_timer/presentation/cubits/prayer_times_cubit/prayer_times_cubit.dart';
import 'package:wirdak/features/prayer_timer/presentation/cubits/prayer_times_cubit/prayer_times_state.dart';
import 'package:wirdak/features/prayer_timer/presentation/widgets/horizontal_prayer_time.dart';
import 'package:wirdak/features/prayer_timer/presentation/widgets/remaining_time_widget.dart';

class PrayerTimesView extends StatelessWidget {
  const PrayerTimesView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PrayerTimesCubit()..loadPrayerTimes(),
      child: Scaffold(
        appBar: const CustomAppBar(
          centerTitle: true,
          icon: Icons.timelapse_outlined,
          title: 'مواقيت الصلاة',
        ),
        body: BlocBuilder<PrayerTimesCubit, PrayerTimesState>(
          builder: (context, state) {
            return Stack(
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
                        padding: EdgeInsets.symmetric(
                          horizontal: 16.w,
                          vertical: 16.h,
                        ),
                        child: state is PrayerTimesLoaded
                            ? LocationAndDateHeader(
                                hijriDate: state.prayerTimeInfo.hijriDate,
                                locationLabel: 'المكان',
                                location: state.prayerTimeInfo.location,
                                color: const Color(0xff01B7F1),
                              )
                            : const LocationAndDateHeader(
                                hijriDate: "...يتم التحميل",
                                locationLabel: 'المكان',
                                location: '...يتم التحميل',
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
                            decoration: const BoxDecoration(
                              color: Colors.white,
                            ),
                            showDigitalClock: false,
                          ),
                        ),
                      ),
                      if (state is PrayerTimesLoaded) ...[
                        RemainingTimeWidget(
                          nextPrayerTime:
                              state.prayerTimeInfo.timeUntilNextPrayerFormatted,
                          nextPrayerName: state.prayerTimeInfo.nextPrayer,
                        ),
                        verticalSpace(20),
                        Column(
                        children: [
                          HorizontalPrayerTime(
                            title: 'الفجر',
                            isSelected:
                                state.prayerTimeInfo.nextPrayerIndex == 0,
                            iconPath: ImageStrings.iconSunWhite,
                            time: TFormatter.formatTime(
                                state.prayerTimeInfo.prayerTimes[0]),
                          ),
                          HorizontalPrayerTime(
                            title: 'الشروق',
                            isSelected:
                                state.prayerTimeInfo.nextPrayerIndex == 1,
                            iconPath: ImageStrings.iconSunrise,
                            time: TFormatter.formatTime(
                                state.prayerTimeInfo.prayerTimes[1]),
                          ),
                          HorizontalPrayerTime(
                            title: 'الظهر',
                            isSelected:
                                state.prayerTimeInfo.nextPrayerIndex == 2,
                            iconPath: ImageStrings.iconSunBold,
                            time: TFormatter.formatTime(
                                state.prayerTimeInfo.prayerTimes[2]),
                          ),
                          HorizontalPrayerTime(
                            title: 'العصر',
                            isSelected:
                                state.prayerTimeInfo.nextPrayerIndex == 3,
                            iconPath: ImageStrings.iconCloudSun,
                            time: TFormatter.formatTime(
                                state.prayerTimeInfo.prayerTimes[3]),
                          ),
                          HorizontalPrayerTime(
                            title: 'المغرب',
                            isSelected:
                                state.prayerTimeInfo.nextPrayerIndex == 4,
                            iconPath: ImageStrings.iconSunset,
                            time: TFormatter.formatTime(
                                state.prayerTimeInfo.prayerTimes[4]),
                          ),
                          HorizontalPrayerTime(
                            title: 'العشاء',
                            isSelected:
                                state.prayerTimeInfo.nextPrayerIndex == 5,
                            iconPath: ImageStrings.iconMoon,
                            time: TFormatter.formatTime(
                                state.prayerTimeInfo.prayerTimes[5]),
                          ),
                        ],
                                                  ),
                      ] else if (state is PrayerTimesError) ...[
                        Center(
                          child: Text(state.message),
                        ),
                      ],
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
