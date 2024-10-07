import 'package:flutter/material.dart';
import 'package:wirdak/app.dart';
import 'package:wirdak/core/utils/helpers/notifications_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NotificationsHelper.initializeLocalNotifications();
  runApp(const MyApp());
}
