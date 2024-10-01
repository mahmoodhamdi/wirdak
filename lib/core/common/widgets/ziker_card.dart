import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wirdak/core/common/models/azkar_model.dart';
import 'package:wirdak/core/common/widgets/ziker_actions.dart';
import 'package:wirdak/core/utils/constants/image_strings.dart';
import 'package:wirdak/core/utils/helpers/spacing.dart';

class ZikerCard extends StatelessWidget {
  final ZikerModel ziker;
  final bool isFavorite;
  const ZikerCard({super.key, required this.ziker, required this.isFavorite});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Container(
        decoration: const BoxDecoration(color: Color(0xffEDFBFF)),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: 24.w,
                  height: 24.57.h,
                  decoration: const ShapeDecoration(
                    color: Color(0xFF005773),
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.only(topRight: Radius.circular(8)),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      ziker.id.toString(),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SvgPicture.asset(ImageStrings.up),
            verticalSpace(16),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                ziker.text,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Color(0xFF005773),
                  fontSize: 14,
                  fontFamily: 'TE HAFS2 Tharwat Emara',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            verticalSpace(16),
            SvgPicture.asset(ImageStrings.down),
            verticalSpace(16),
            
            ZikerActions(isFavorite: isFavorite, ziker: ziker),
          ],
        ),
      ),
    );
  }
}
