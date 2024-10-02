// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wirdak/core/utils/constants/image_strings.dart';
import 'package:wirdak/core/utils/helpers/spacing.dart';

class HorizontalPrayerTime extends StatelessWidget {
  const HorizontalPrayerTime(
      {super.key,
      required this.iconPath,
      required this.title,
      required this.time,
      this.isSelected = false});
  final String iconPath;
  final String title;
  final String time;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: Container(
        width: double.infinity,
        height: 40.h,
        padding: EdgeInsets.symmetric(
          horizontal: 16.w,
        ),
        decoration: ShapeDecoration(
          color: isSelected ? const Color(0xffEDFBFF) : const Color(0x7FF5F5F5),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SvgPicture.asset(
                  iconPath,
                  color: isSelected
                      ? const Color(0xff01B7F1)
                      : const Color(0x7F1E1E1E).withOpacity(0.5),
                ),
                horizontalSpace(20),
                Text(
                  title,
                  style: TextStyle(
                    color: isSelected
                        ? const Color(0xff01B7F1)
                        : const Color(0x7F1E1E1E),
                    fontSize: 14,
                    fontWeight: isSelected ? FontWeight.bold : FontWeight.w300,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                SvgPicture.asset(
                  isSelected ? ImageStrings.volume : ImageStrings.volumeMute,
                  color: isSelected
                      ? const Color(0xff01B7F1)
                      : const Color(0x7F1E1E1E).withOpacity(0.5),
                ),
                horizontalSpace(20),
                Text(
                  time,
                  style: TextStyle(
                    color: isSelected
                        ? const Color(0xff01B7F1)
                        : const Color(0x7F1E1E1E),
                    fontSize: 16,
                    fontWeight: isSelected ? FontWeight.bold : FontWeight.w300,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
