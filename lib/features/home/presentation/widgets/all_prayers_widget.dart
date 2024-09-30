import 'package:flutter/material.dart';

class AllPrayersWidget extends StatelessWidget {
  const AllPrayersWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 4),
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              side: const BorderSide(
                width: 0.50,
                strokeAlign: BorderSide.strokeAlignOutside,
              ),
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          child: const Text(
            'جميع العبادات',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFF1E1E1E),
              fontSize: 16,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,
              height: 0,
              letterSpacing: -0.30,
            ),
          ),
        ),
      ],
    );
  }
}
