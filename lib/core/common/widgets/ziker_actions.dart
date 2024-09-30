import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wirdak/core/common/models/azkar_model.dart';
import 'package:wirdak/core/utils/spacing.dart';

class ZikerActions extends StatelessWidget {
  final ZikerModel ziker;

  const ZikerActions({super.key, required this.ziker});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        shadows: const [
          BoxShadow(
            color: Color(0x19000000),
            blurRadius: 8,
            offset: Offset(0, 2),
            spreadRadius: 0,
          )
        ],
      ),
      child: Column(
        children: [
          verticalSpace(22),
          const Text(
            'من قالها حين يصبح أجير من الجن حتي يمسي ومن قالها حين يمسي أجير من الجن حتي يصبح',
            textAlign: TextAlign.right,
            style: TextStyle(
              color: Color(0xB2005773),
              fontSize: 10,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w400,
            ),
          ),
          verticalSpace(18),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {},
                iconSize: 24,
                icon: const Icon(
                  Icons.favorite,
                  color: Color(0xFF005773),
                ),
              ),
              horizontalSpace(8),
              Container(
                width: 40.w,
                height: 40.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border:
                      Border.all(color: const Color(0xFF005773), width: 1.5),
                ),
                child: Center(
                  child: Text(
                    ziker.count.toString(),
                    style: const TextStyle(
                      color: Color(0xFF01B7F1),
                      fontSize: 14,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      height: 0,
                      letterSpacing: -0.30,
                    ),
                  ),
                ),
              ),
              horizontalSpace(8),
              IconButton(
                onPressed: () {},
                iconSize: 24,
                icon: const Icon(
                  Icons.share,
                  color: Color(0xFF005773),
                ),
              ),
            ],
          ),
          verticalSpace(16),
        ],
      ),
    );
  }
}
