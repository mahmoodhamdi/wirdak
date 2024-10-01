import 'package:flutter/material.dart';
import 'package:wirdak/core/utils/constants/colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool hasBackButton;
  final bool centerTitle;
  final IconData icon;
  const CustomAppBar({
    super.key,
    this.icon = Icons.arrow_back,
    required this.title,
    this.centerTitle = false,
    this.hasBackButton = true, // Allows you to toggle the back button
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      elevation: 0,
      centerTitle: centerTitle,
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          color: TColors.white,
        ),
      ),
      title: Row(
        mainAxisAlignment:
            centerTitle ? MainAxisAlignment.center : MainAxisAlignment.start,
        children: [
          if (hasBackButton)
            IconButton(
              icon: Icon(icon),
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
