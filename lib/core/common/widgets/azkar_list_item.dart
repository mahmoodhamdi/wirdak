import 'package:flutter/material.dart';
import 'package:wirdak/core/common/models/azkar_category.dart';
import 'package:wirdak/core/utils/constants/colors.dart';

class AzkarListItem extends StatelessWidget {
  const AzkarListItem({
    super.key,
    required this.onPressed,
    required this.azkarCategory,
  });
  final void Function()? onPressed;
  final AzkarCategory azkarCategory;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: ShapeDecoration(
        color: TColors.gray100,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Align(
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
          IconButton(
              onPressed: onPressed,
              tooltip: 'Schedule Notification',
              icon: const Icon(Icons.alarm))
        ],
      ),
    );
  }
}
