import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wirdak/core/common/widgets/layout_scaffold.dart';
import 'package:wirdak/core/router/routes.dart';
import 'package:wirdak/features/home/presentation/views/home_view.dart';
import 'package:wirdak/features/prayer_timer/presentation/views/prayer_times_view.dart';
import 'package:wirdak/features/reading_azkar/presentation/views/all_azkar_view.dart';
import 'package:wirdak/features/reading_azkar/presentation/views/favourite_view.dart';
import 'package:wirdak/features/settings/presentation/views/prayer_reminder_view.dart';
import 'package:wirdak/features/settings/presentation/views/settings_view.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: '_root');
final router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: Routes.home,
    routes: [
      StatefulShellRoute.indexedStack(
        branches: [
          StatefulShellBranch(routes: [
            GoRoute(
                path: Routes.home,
                builder: (context, state) => const HomeView(),
                routes: [
                  GoRoute(
                    path: Routes.allAzkar,
                    builder: (context, state) => const AllAzkarView(),
                  ),
                  GoRoute(
                    path: Routes.favourites,
                    builder: (context, state) => const FavoritesView(),
                  ),
                ]),
          ]),
          StatefulShellBranch(routes: [
            GoRoute(
              path: Routes.prayerTimes,
              builder: (context, state) => const PrayerTimesView(),
            ),
          ]),
          StatefulShellBranch(routes: [
            GoRoute(
                path: Routes.settings,
                builder: (context, state) => const SettingsView(),
                routes: [
                  GoRoute(
                    path: Routes.prayerReminder,
                    builder: (context, state) => const PrayerReminderView(),
                  ),
                ]),
          ]),
        ],
        builder: (context, state, navigationShell) => LayoutScaffold(
          shell: navigationShell,
        ),
      )
    ]);
