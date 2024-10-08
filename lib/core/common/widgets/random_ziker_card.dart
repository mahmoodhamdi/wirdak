import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wirdak/core/common/models/azkar_model.dart';
import 'package:wirdak/core/utils/constants/image_strings.dart';
import 'package:wirdak/core/utils/helpers/spacing.dart';

class RandomZikerCard extends StatelessWidget {
  final ZikerModel ziker;

  const RandomZikerCard({
    super.key,
    required this.ziker,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Container(
        decoration: const BoxDecoration(color: Color(0xffEDFBFF)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            verticalSpace(16),
            SvgPicture.asset(ImageStrings.up),
            verticalSpace(16),
            Text(
              ziker.text.split('.').first.trim(),
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Color(0xFF005773),
                fontSize: 14,
                fontFamily: 'TE HAFS2 Tharwat Emara',
                fontWeight: FontWeight.w500,
              ),
            ),
            verticalSpace(16),
            SvgPicture.asset(ImageStrings.down),
            verticalSpace(16),
          ],
        ),
      ),
    );
  }
}
