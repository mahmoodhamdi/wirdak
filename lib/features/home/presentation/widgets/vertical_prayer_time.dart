import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wirdak/core/utils/constants/colors.dart';
import 'package:wirdak/core/utils/spacing.dart';

class VerticalPrayerTime extends StatelessWidget {
  final String iconPath;
  final String iconPathWhite;
  final String title;
  final String time;
  final bool isSelected;
  final VoidCallback onTap;

  const VerticalPrayerTime({
    super.key,
    required this.iconPath,
    required this.iconPathWhite,
    required this.title,
    required this.time,
    this.isSelected = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
        decoration: ShapeDecoration(
          color: isSelected ? TColors.secondary : TColors.lightBlue,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        ),
        child: Column(
          children: [
            SvgPicture.asset(
              isSelected ? iconPathWhite : iconPath,
            ),
            verticalSpace(2),
            Text(
              title,
              style: TextStyle(
                color: isSelected ? Colors.white : TColors.darkBlue,
                fontSize: 14.sp,
                fontWeight: FontWeight.w300,
              ),
            ),
            verticalSpace(2),
            Text(
              time,
              style: TextStyle(
                color: isSelected ? Colors.white : TColors.darkBlue,
                fontSize: 9.sp,
                fontWeight: FontWeight.w300,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
