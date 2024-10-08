import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wirdak/core/common/cubits/prayer_times_cubit/prayer_times_cubit.dart';
import 'package:wirdak/core/common/cubits/prayer_times_cubit/prayer_times_state.dart';
import 'package:wirdak/core/common/widgets/location_and_date_header.dart';
import 'package:wirdak/core/utils/constants/colors.dart';
import 'package:wirdak/core/utils/constants/image_strings.dart';
import 'package:wirdak/core/utils/helpers/spacing.dart';
import 'package:wirdak/features/home/presentation/widgets/all_prayers_widget.dart';
import 'package:wirdak/features/home/presentation/widgets/features_list.dart';
import 'package:wirdak/features/home/presentation/widgets/vertical_prayer_time.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PrayerTimesCubit, PrayerTimesState>(
      builder: (context, state) {
        final prayerTimesCubit = context.read<PrayerTimesCubit>();
        final selectedPrayer = state is PrayerTimesLoaded
            ? prayerTimesCubit.getSelectedPrayerInfo()
            : {'name': '', 'time': '', 'period': '', 'next': ''};
        final nextPrayer = state is PrayerTimesLoaded
            ? prayerTimesCubit.getNextPrayerInfo()
            : {'name': '', 'time': '', 'period': '', 'next': ''};

        return Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                    child: state is PrayerTimesLoaded
                        ? LocationAndDateHeader(
                            hijriDate: state.prayerTimeInfo.hijriDate,
                            locationLabel: 'المكان',
                            location: state.prayerTimeInfo.location,
                          )
                        : const LocationAndDateHeader(
                            hijriDate: "...يتم التحميل",
                            locationLabel: 'المكان',
                            location: '...يتم التحميل',
                          ),
                  ),
                  verticalSpace(8),
                  Column(
                    children: [
                      Container(
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          color: TColors.lightBlue,
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 24.0.w, vertical: 17.0.h),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              _buildPrayerTime(
                                  context,
                                  0,
                                  ImageStrings.iconMoon,
                                  ImageStrings.iconSunWhite,
                                  'الفجر',
                                  state is PrayerTimesLoaded
                                      ? state.prayerTimeInfo.prayerTimes[0]
                                      : ""),
                              _buildPrayerTime(
                                  context,
                                  1,
                                  ImageStrings.iconSunrise,
                                  ImageStrings.iconSunriseWhite,
                                  'الشروق',
                                  state is PrayerTimesLoaded
                                      ? state.prayerTimeInfo.prayerTimes[1]
                                      : ""),
                              _buildPrayerTime(
                                  context,
                                  2,
                                  ImageStrings.iconSunBold,
                                  ImageStrings.iconSunBoldWhite,
                                  'الظهر',
                                  state is PrayerTimesLoaded
                                      ? state.prayerTimeInfo.prayerTimes[2]
                                      : ""),
                              _buildPrayerTime(
                                  context,
                                  3,
                                  ImageStrings.iconCloudSun,
                                  ImageStrings.iconCloudSunWhite,
                                  'العصر',
                                  state is PrayerTimesLoaded
                                      ? state.prayerTimeInfo.prayerTimes[3]
                                      : ""),
                              _buildPrayerTime(
                                  context,
                                  4,
                                  ImageStrings.iconSunset,
                                  ImageStrings.iconSunsetWhite,
                                  'المغرب',
                                  state is PrayerTimesLoaded
                                      ? state.prayerTimeInfo.prayerTimes[4]
                                      : ""),
                              _buildPrayerTime(
                                  context,
                                  5,
                                  ImageStrings.iconMoonOutline,
                                  ImageStrings.iconMoonOutlineWhite,
                                  'العشاء',
                                  state is PrayerTimesLoaded
                                      ? state.prayerTimeInfo.prayerTimes[5]
                                      : ""),
                            ],
                          ),
                        ),
                      ),
                      verticalSpace(12),
                      Container(
                        height: 165.h,
                        width: double.infinity,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(ImageStrings.mosque),
                        )),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.6,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      selectedPrayer['name']!,
                                      style: const TextStyle(
                                        color: Color(0xFF1B617F),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          selectedPrayer['time']!,
                                          style: const TextStyle(
                                            color: Color(0xFF1B617F),
                                            fontSize: 36,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        Text(
                                          ' ${selectedPrayer['period']!}',
                                          style: const TextStyle(
                                            color: Color(0xFF1B617F),
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Text(
                                      'الصلاة التالية: ${selectedPrayer['next']!}',
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        color: Color(0xFF1B617F),
                                        fontSize: 14,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.1,
                                        ),
                                        Text(
                                          '${nextPrayer['time']!} ${nextPrayer['period']!}',
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(
                                            color: Color(0xFF1B617F),
                                            fontSize: 14,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  verticalSpace(16),
                  const AllPrayersWidget(),
                  verticalSpace(16),
                  const FeaturesList(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildPrayerTime(BuildContext context, int index, String iconPath,
      String iconPathWhite, String title, String time) {
    return BlocBuilder<PrayerTimesCubit, PrayerTimesState>(
      builder: (context, state) {
        final isSelected =
            state is PrayerTimesLoaded && state.selectedIndex == index;

        return VerticalPrayerTime(
          iconPath: iconPath,
          iconPathWhite: iconPathWhite,
          title: title,
          time: time,
          isSelected: isSelected,
          onTap: () {
            context.read<PrayerTimesCubit>().selectPrayerTime(index);
          },
        );
      },
    );
  }
}
