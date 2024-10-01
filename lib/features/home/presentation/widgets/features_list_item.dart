import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class FeaturesListItem extends StatelessWidget {
  final String title;
  final String imagePath;
  final void Function()? onTap;
  const FeaturesListItem(
      {super.key, required this.title, required this.imagePath, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: 78.w,
            height: 77.h,
            padding: const EdgeInsets.all(4),
            decoration: ShapeDecoration(
              color: Colors.white,
              shape:
                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
              shadows: const [
                BoxShadow(
                  color: Color(0x19000000),
                  blurRadius: 19.52,
                  offset: Offset(0, 2.44),
                  spreadRadius: 0,
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SvgPicture.asset(imagePath, width: 32, height: 32),
                Text(
                  title,
                  style: TextStyle(
                    color: const Color(0xFF01B7F1),
                    fontSize: 12.sp,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
