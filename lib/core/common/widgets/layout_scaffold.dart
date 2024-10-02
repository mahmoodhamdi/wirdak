import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:wirdak/core/common/models/destination.dart';

class LayoutScaffold extends StatelessWidget {
  const LayoutScaffold({Key? key, required this.shell})
      : super(key: key ?? const ValueKey<String>('LayoutScaffold'));
  final StatefulNavigationShell shell;
  @override
  Widget build(BuildContext context) => Scaffold(
        body: shell,
        bottomNavigationBar: NavigationBar(
            backgroundColor: Colors.white,
            elevation: 0,
            indicatorShape: const CircleBorder(
              eccentricity: 0.5,
              side: BorderSide.none,
            ),
            indicatorColor: Colors.white,
            labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
            selectedIndex: shell.currentIndex,
            surfaceTintColor: Colors.white,
            shadowColor: Colors.white,
            onDestinationSelected: shell.goBranch,
            destinations: destinations
                .map((destination) => NavigationDestination(
                      tooltip: destination.label,
                      icon: SvgPicture.asset(
                        width: 32.w,
                        destination.iconPath,
                        color: const Color(0xffA1A1A1),
                      ),
                      selectedIcon: SvgPicture.asset(
                        width: 32.w,
                        destination.iconPath,
                        color: const Color(0xff01B7F1),
                      ),
                      label: destination.label,
                    ))
                .toList()),
      );
}
