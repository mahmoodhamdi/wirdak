import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:wirdak/core/common/widgets/schedule_notification_dialog.dart';

class AwesomeNotificationsHelper {
  static Future<void> initializeLocalNotifications() async {
    await AwesomeNotifications().initialize(
        null, //'resource://drawable/res_app_icon',//
        [
          //scheduled notifications
          NotificationChannel(
              channelKey: 'scheduled',
              channelName: 'Scheduled Notifications',
              channelDescription:
                  'Notification tests as scheduled notifications',
              playSound: true,
              soundSource: 'resource://raw/yaamsallyallaelnaby',
              onlyAlertOnce: false,
              groupAlertBehavior: GroupAlertBehavior.All,
              importance: NotificationImportance.High,
              defaultColor: Colors.deepPurple,
              ledColor: Colors.deepPurple),
          // repeat scheduled notifications
          NotificationChannel(
              soundSource: 'resource://raw/yaamsallyallaelnaby',
              channelKey: 'repeatMinute',
              channelName: 'Repeat Minute Notifications',
              channelDescription:
                  'Notification tests as repeat minute notifications',
              playSound: true,
              onlyAlertOnce: false,
              groupAlertBehavior: GroupAlertBehavior.All,
              importance: NotificationImportance.High,
              defaultColor: Colors.deepPurple,
              ledColor: Colors.deepPurple),
          NotificationChannel(
              soundSource: 'resource://raw/yaamsallyallaelnaby',
              channelKey: 'repeatHour',
              channelName: 'Repeat Hour Notifications',
              channelDescription:
                  'Notification tests as repeat hour notifications',
              playSound: true,
              onlyAlertOnce: false,
              groupAlertBehavior: GroupAlertBehavior.All,
              importance: NotificationImportance.High,
              defaultColor: Colors.deepPurple,
              ledColor: Colors.deepPurple),
          NotificationChannel(
              soundSource: 'resource://raw/yaamsallyallaelnaby',
              channelKey: 'repeatDay',
              channelName: 'Repeat Day Notifications',
              channelDescription:
                  'Notification tests as repeat day notifications',
              playSound: true,
              onlyAlertOnce: false,
              groupAlertBehavior: GroupAlertBehavior.All,
              importance: NotificationImportance.High,
              defaultColor: Colors.deepPurple,
              ledColor: Colors.deepPurple)
        ],
        debug: true);
  }

  static Future<void> cancelAllNotifications() async {
    await AwesomeNotifications().cancelAll();
  }

  static Future<void> cancelNotificationById(int id) async {
    await AwesomeNotifications().cancel(id);
  }

  static Future<void> repeatMinutelyNotifications({
    required String title,
    required String message,
  }) async {
    bool isAllowed = await AwesomeNotifications().isNotificationAllowed();
    if (!isAllowed) {
      await AwesomeNotifications().requestPermissionToSendNotifications();
    }

    await AwesomeNotifications().createNotification(
      schedule: NotificationCalendar(
        second: 1,

        repeats: true, // Repeats every minute
        allowWhileIdle: true,
      ),
      content: NotificationContent(
        id: createUniqueId(), // Generates a unique ID for each notification
        channelKey: 'repeatMinute',
        title: title,
        body: message,

        notificationLayout: NotificationLayout.BigText,
      ),
    );
  }

  static Future<void> repeatHourlyNotifications({
    required String title,
    required String message,
  }) async {
    bool isAllowed = await AwesomeNotifications().isNotificationAllowed();
    if (!isAllowed) {
      await AwesomeNotifications().requestPermissionToSendNotifications();
    }

    await AwesomeNotifications().createNotification(
      schedule: NotificationCalendar(
        minute: 1, // Fires at the start of every minute
        repeats: true, // Repeats every  hour
      ),
      content: NotificationContent(
        id: createUniqueId(), // Generates a unique ID for each notification
        channelKey: 'repeatHour',
        title: title,

        body: message,
        notificationLayout: NotificationLayout.BigText,
      ),
    );
  }

  static Future<void> repeatDailyNotifications({
    required String title,
    required String message,
  }) async {
    bool isAllowed = await AwesomeNotifications().isNotificationAllowed();
    if (!isAllowed) {
      await AwesomeNotifications().requestPermissionToSendNotifications();
    }

    await AwesomeNotifications().createNotification(
      schedule: NotificationCalendar(
        day: 1, // Fires at the start of every hour
        repeats: true, // Repeats every day
      ),
      content: NotificationContent(
        id: createUniqueId(), // Generates a unique ID for each notification
        channelKey: 'repeatDay',
        title: title,
        body: message,
        notificationLayout: NotificationLayout.BigText,
      ),
    );
  }

  static Future<void> scheduleRepeatingNotification({
    required DateTime scheduledDateTime,
    required String title,
    required String message,
    required bool repeatNotification,
    required RepeatInterval repeatInterval,
  }) async {
    bool isAllowed = await AwesomeNotifications().isNotificationAllowed();
    if (!isAllowed) {
      await AwesomeNotifications().requestPermissionToSendNotifications();
    }

    String channelKey;
    NotificationCalendar? schedule;

    if (repeatNotification) {
      switch (repeatInterval) {
        case RepeatInterval.minute:
          channelKey = 'repeatMinute';
          schedule = NotificationCalendar(
            second: 5,
            repeats: true,
          );
          break;
        case RepeatInterval.hour:
          channelKey = 'repeatHour';
          schedule = NotificationCalendar(
            minute: scheduledDateTime.minute,
            second: 0,
            repeats: true,
          );
          break;
        case RepeatInterval.day:
          channelKey = 'repeatDay';

          schedule = NotificationCalendar(
            hour: scheduledDateTime.hour,
            minute: scheduledDateTime.minute,
            second: 0,
            repeats: true,
          );
          break;
        case RepeatInterval.none:
          channelKey = 'scheduled';
          schedule = NotificationCalendar(
            hour: scheduledDateTime.hour,
            minute: scheduledDateTime.minute,
            second: 0,
            repeats: false,
          );
          break;
      }
    } else {
      channelKey = 'scheduled';
      schedule = NotificationCalendar(
        hour: scheduledDateTime.hour,
        minute: scheduledDateTime.minute,
        second: 0,
        repeats: false,
      );
    }

    await AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: createUniqueId(),
        channelKey: channelKey,
        title: title,
        body: message,
        notificationLayout: NotificationLayout.BigText,
        color: Colors.black,
        backgroundColor: Colors.black,
      ),
      schedule: schedule,
    );
  }
}

createUniqueId() {
  return DateTime.now().millisecondsSinceEpoch.remainder(10000000);
}
