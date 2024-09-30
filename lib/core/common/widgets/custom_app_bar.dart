import 'package:flutter/material.dart';
import 'package:wirdak/core/utils/constants/colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool hasBackButton;

  const CustomAppBar({
    super.key,
    required this.title,
    this.hasBackButton = true, // Allows you to toggle the back button
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      elevation: 0,
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          color: TColors.white,
        ),
      ),
      title: Row(
        children: [
          if (hasBackButton)
            IconButton(
              icon: const Icon(Icons.arrow_back),
              color: TColors.secondary,
              iconSize: 24,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          const SizedBox(width: 4),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: TColors.secondary,
              fontSize: 18,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
