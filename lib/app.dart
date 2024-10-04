import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wirdak/core/common/cubits/favorites_cubit/favorites_cubit.dart';
import 'package:wirdak/core/common/cubits/prayer_times_cubit/prayer_times_cubit.dart';
import 'package:wirdak/core/router/router.dart';
import 'package:wirdak/core/utils/theme/theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 889),
      minTextAdapt: true,
      builder: (_, child) => MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => FavoritesCubit()),
          BlocProvider(
              create: (context) => PrayerTimesCubit()..loadPrayerTimes()),
        ],
        child: MaterialApp.router(
          routerConfig: router,
          theme: TTheme.lightTheme,
          debugShowCheckedModeBanner: false,
          locale: const Locale('ar'),
          localizationsDelegates: _localizationsDelegates,
          supportedLocales: _supportedLocales,
          builder: (context, child) =>
              _buildDirectionalityWrapper(context, child),
        ),
      ),
    );
  }

  static const List<LocalizationsDelegate<dynamic>> _localizationsDelegates = [
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
  ];

  static const List<Locale> _supportedLocales = [
    Locale('en', ''),
    Locale('ar', ''),
  ];

  Widget _buildDirectionalityWrapper(BuildContext context, Widget? child) {
    final textDirection = Localizations.localeOf(context).languageCode == 'ar'
        ? TextDirection.rtl
        : TextDirection.ltr;

    return Directionality(
      textDirection: textDirection,
      child: child ??
          const SizedBox.shrink(), // Use SizedBox.shrink() if child is null
    );
  }
}
