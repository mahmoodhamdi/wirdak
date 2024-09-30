import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 889),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        locale: const Locale('ar'),
        localizationsDelegates: _localizationsDelegates,
        supportedLocales: _supportedLocales,
        builder: (context, child) =>
            _buildDirectionalityWrapper(context, child),
        home: const Scaffold(
            body: Center(
                child:
                    Text('اللغة العربية - Arabic'))), // Placeholder home widget
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
