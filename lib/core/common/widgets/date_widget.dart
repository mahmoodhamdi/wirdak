import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wirdak/core/utils/constants/colors.dart';

class DateWidget extends StatelessWidget {
  final String gregorianDate;
  final String hijriDate;
  final Color color;
  const DateWidget({
    super.key,
    required this.gregorianDate,
    required this.hijriDate,
    this.color = TColors.gray800,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          gregorianDate,
          style: TextStyle(
            color: TColors.gray400,
            fontSize: 12.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          hijriDate,
          style: TextStyle(
            color: color,
            fontSize: 15.sp,
            fontWeight: FontWeight.w300,
          ),
        ),
      ],
    );
  }
}
