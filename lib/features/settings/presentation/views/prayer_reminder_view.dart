import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wirdak/core/common/widgets/custom_app_bar.dart';
import 'package:wirdak/features/settings/presentation/cubits/prayer_reminder_cubit/prayer_reminder_cubit.dart';
import 'package:wirdak/features/settings/presentation/cubits/prayer_reminder_cubit/prayer_reminder_state.dart';
import 'package:wirdak/features/settings/presentation/widgets/prayer_reminder_tile.dart';

class PrayerReminderView extends StatelessWidget {
  const PrayerReminderView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PrayerReminderCubit(),
      child: Scaffold(
        appBar: const CustomAppBar(title: 'تنبيهات الصلاة'),
        body: BlocBuilder<PrayerReminderCubit, PrayerReminderState>(
          builder: (context, state) {
            return ListView.builder(
              itemCount: state.reminders.length,
              itemBuilder: (context, index) {
                final reminder = state.reminders[index];
                return PrayerReminderTile(
                  time: reminder.time,
                  isActive: reminder.isActive,
                  isSoundOn: reminder.isSoundOn,
                  onActiveChanged: () =>
                      context.read<PrayerReminderCubit>().toggleActive(index),
                  onSoundChanged: () =>
                      context.read<PrayerReminderCubit>().toggleSound(index),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
