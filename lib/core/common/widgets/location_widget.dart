import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wirdak/core/utils/constants/colors.dart';

class LocationWidget extends StatelessWidget {
  final String label;
  final String location;

  const LocationWidget({
    super.key,
    required this.label,
    required this.location,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            color: TColors.gray400,
            fontSize: 12.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(height: 1),
        Text(
          location,
          style: TextStyle(
            color: TColors.gray800,
            fontSize: 18.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
