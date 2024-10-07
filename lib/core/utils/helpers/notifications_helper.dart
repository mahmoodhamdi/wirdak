import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';

class NotificationsHelper {
  static Future<void> initializeLocalNotifications() async {
    await AwesomeNotifications().initialize(
        null, //'resource://drawable/res_app_icon',//
        [
          NotificationChannel(
              channelKey: 'alerts',
              channelName: 'Alerts',
              channelDescription: 'Notification tests as alerts',
              playSound: true,
              onlyAlertOnce: true,
              groupAlertBehavior: GroupAlertBehavior.Children,
              importance: NotificationImportance.High,
              defaultColor: Colors.deepPurple,
              ledColor: Colors.deepPurple),
          //scheduled notifications
          NotificationChannel(
              channelKey: 'scheduled',
              channelName: 'Scheduled Notifications',
              channelDescription:
                  'Notification tests as scheduled notifications',
              playSound: true,
              onlyAlertOnce: true,
              groupAlertBehavior: GroupAlertBehavior.Children,
              importance: NotificationImportance.High,
              defaultColor: Colors.deepPurple,
              ledColor: Colors.deepPurple),
          // repeat scheduled notifications
          NotificationChannel(
              channelKey: 'repeat',
              channelName: 'Repeat Notifications',
              channelDescription: 'Notification tests as repeat notifications',
              playSound: true,
              onlyAlertOnce: true,
              groupAlertBehavior: GroupAlertBehavior.Children,
              importance: NotificationImportance.High,
              defaultColor: Colors.deepPurple,
              ledColor: Colors.deepPurple),
        ],
        debug: true);
  }

  static Future<void> scheduleNewNotification({
    required DateTime scheduledDateTime,
    required String title,
    required String message,
    required String username,
    required bool repeatNotification,
  }) async {
    bool isAllowed = await AwesomeNotifications().isNotificationAllowed();
    if (!isAllowed) {
      await AwesomeNotifications().requestPermissionToSendNotifications();
    }

    await myNotifyScheduleInHours(
      scheduledDateTime: scheduledDateTime,
      title: title,
      msg: message,
      username: username,
      repeatNotif: repeatNotification,
    );
  }

  static Future<void> resetBadgeCounter() async {
    await AwesomeNotifications().resetGlobalBadge();
  }

  static Future<void> cancelNotifications() async {
    await AwesomeNotifications().cancelAll();
  }

  static Future<void> scheduleMinuteNotifications({
    required String title,
    required String message,
    required String username,
  }) async {
    await AwesomeNotifications().createNotification(
      schedule: NotificationCalendar(
        second: 5, // Fires at the start of every minute
        repeats: true, // Repeats every minute
      ),
      content: NotificationContent(
        id: -1, // Generates a unique ID for each notification
        channelKey: 'repeat',
        title: title,
        body: '$username, $message',
        notificationLayout: NotificationLayout.Default,
      ),
    );
  }
}

Future<void> myNotifyScheduleInHours({
  required DateTime scheduledDateTime,
  required String username,
  required String title,
  required String msg,
  bool repeatNotif = false,
}) async {
  await AwesomeNotifications().createNotification(
    schedule: NotificationCalendar(
      weekday: scheduledDateTime.weekday,
      hour: scheduledDateTime.hour,
      minute: scheduledDateTime.minute,
      second: scheduledDateTime.second,
      repeats: repeatNotif,
    ),
    content: NotificationContent(
      id: -1,
      channelKey: 'scheduled',
      title: '${Emojis.food_bowl_with_spoon} $title',
      body: '$username, $msg',
      notificationLayout: NotificationLayout.BigText,
      color: Colors.black,
      backgroundColor: Colors.black,
      payload: {'actPag': 'myAct', 'actType': 'food', 'username': username},
    ),
  );
}
