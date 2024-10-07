import 'package:flutter/material.dart';
import 'package:wirdak/app.dart';
import 'package:wirdak/core/utils/helpers/awesome_notifications_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AwesomeNotificationsHelper.initializeLocalNotifications();
  runApp(const MyApp());
}
