import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wirdak/features/settings/presentation/cubits/prayer_reminder_cubit/prayer_reminder_state.dart';

class PrayerReminderCubit extends Cubit<PrayerReminderState> {
  PrayerReminderCubit()
      : super(PrayerReminderState(reminders: [
          PrayerReminder(time: 'الفجر', isActive: true, isSoundOn: true),
          PrayerReminder(time: 'الشروق', isActive: false, isSoundOn: false),
          PrayerReminder(time: 'الظهر', isActive: true, isSoundOn: true),
          PrayerReminder(time: 'العصر', isActive: false, isSoundOn: false),
          PrayerReminder(time: 'المغرب', isActive: true, isSoundOn: true),
          PrayerReminder(time: 'العشاء', isActive: false, isSoundOn: false),
        ]));

  void toggleActive(int index) {
    final updatedReminders = List<PrayerReminder>.from(state.reminders);
    updatedReminders[index] = updatedReminders[index]
        .copyWith(isActive: !updatedReminders[index].isActive);
    emit(PrayerReminderState(reminders: updatedReminders));
  }

  void toggleSound(int index) {
    final updatedReminders = List<PrayerReminder>.from(state.reminders);
    updatedReminders[index] = updatedReminders[index]
        .copyWith(isSoundOn: !updatedReminders[index].isSoundOn);
    emit(PrayerReminderState(reminders: updatedReminders));
  }
}
