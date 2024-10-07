import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:wirdak/core/common/models/azkar_category.dart';
import 'package:wirdak/core/common/widgets/azkar_list_item.dart';
import 'package:wirdak/core/common/widgets/schedule_notification_dialog.dart';
import 'package:wirdak/core/utils/helpers/awesome_notifications_helper.dart';
import 'package:wirdak/features/reading_azkar/presentation/views/ziker_view.dart';

class AzkarList extends StatelessWidget {
  const AzkarList({
    super.key,
    required this.azkarCategories,
  });

  final List<AzkarCategory> azkarCategories;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: azkarCategories.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return ZikerView(
                        categoryName: azkarCategories[index].category,
                        zikerList: azkarCategories[index].azkarList);
                  }));
                },
                child: AzkarListItem(
                    onPressed: () async {
                      final result = await showDialog(
                        context: context,
                        builder: (context) =>
                            const ScheduleNotificationDialog(),
                      );

                      if (result != null) {
                        if (kDebugMode) {
                          print(result);
                        }
                        await AwesomeNotificationsHelper
                            .scheduleRepeatingNotification(
                          repeatInterval: result.repeatInterval,
                          scheduledDateTime: result.scheduledDateTime,
                          repeatNotification: result.repeatNotification,
                          title: azkarCategories[index].category,
                          message: azkarCategories[index]
                              .azkarList[Random().nextInt(
                                  azkarCategories[index].azkarList.length)]
                              .text,
                        );
                      }
                    },
                    azkarCategory: azkarCategories[index])),
          );
        });
  }
}
