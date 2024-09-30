import 'package:flutter/material.dart';
import 'package:wirdak/core/common/models/azkar_category.dart';
import 'package:wirdak/core/utils/constants/colors.dart';

class AzkarListItem extends StatelessWidget {
  const AzkarListItem({
    super.key,
    required this.azkarCategory,
  });

  final AzkarCategory azkarCategory;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //    Navigator.pushNamed(context, azkarCategory.routeName);
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: ShapeDecoration(
          color: TColors.gray100,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        ),
        child: Align(
          alignment: Alignment.centerRight,
          child: Text(
            azkarCategory.category,
            style: const TextStyle(
              color: Color(0xFF1E1E1E),
              fontSize: 16,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }
}
