import 'package:flutter/material.dart';
import 'package:wirdak/app.dart';
import 'package:wirdak/core/utils/helpers/adhan_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  getPrayerTimes();
  runApp(const MyApp());
}
