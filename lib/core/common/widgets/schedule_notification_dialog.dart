import 'package:flutter/material.dart';

class NotificationData {
  final DateTime scheduledDateTime;
  final bool repeatNotification;
  final RepeatInterval repeatInterval;

  const NotificationData({
    required this.scheduledDateTime,
    required this.repeatNotification,
    this.repeatInterval = RepeatInterval.none,
  });
}

enum RepeatInterval {
  none,
  minute,
  hour,
  day,
}

// schedule_notification_dialog.dart
class ScheduleNotificationDialog extends StatefulWidget {
  const ScheduleNotificationDialog({super.key});

  @override
  State<ScheduleNotificationDialog> createState() =>
      _ScheduleNotificationDialogState();
}

class _ScheduleNotificationDialogState
    extends State<ScheduleNotificationDialog> {
  final _formKey = GlobalKey<FormState>();
  TimeOfDay _selectedTime = TimeOfDay.now();
  bool _repeatNotification = false;
  RepeatInterval _repeatInterval = RepeatInterval.none;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Schedule Notification',
                style: theme.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              Card(
                elevation: 0,
                color: theme.colorScheme.surfaceContainerHighest,
                child: ListTile(
                  title: const Text('Time'),
                  subtitle: Text(
                    _selectedTime.format(context),
                    style: theme.textTheme.titleMedium,
                  ),
                  trailing: const Icon(Icons.access_time),
                  onTap: () async {
                    final TimeOfDay? picked = await showTimePicker(
                      context: context,
                      initialTime: _selectedTime,
                    );
                    if (picked != null) {
                      setState(() {
                        _selectedTime = picked;
                      });
                    }
                  },
                ),
              ),
              const SizedBox(height: 16),
              SwitchListTile(
                title: const Text('Repeat Notification'),
                subtitle: Text(
                  _repeatNotification
                      ? 'Notification will repeat'
                      : 'One-time notification',
                  style: theme.textTheme.bodyMedium,
                ),
                value: _repeatNotification,
                onChanged: (bool value) {
                  setState(() {
                    _repeatNotification = value;
                    if (!value) {
                      _repeatInterval = RepeatInterval.none;
                    }
                  });
                },
                tileColor: theme.colorScheme.surfaceContainerHighest,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              if (_repeatNotification) ...[
                const SizedBox(height: 16),
                Card(
                  elevation: 0,
                  color: theme.colorScheme.surfaceContainerHighest,
                  child: Column(
                    children: [
                      RadioListTile<RepeatInterval>(
                        title: const Text('Every Minute'),
                        value: RepeatInterval.minute,
                        groupValue: _repeatInterval,
                        onChanged: (RepeatInterval? value) {
                          setState(() {
                            _repeatInterval = value!;
                          });
                        },
                      ),
                      RadioListTile<RepeatInterval>(
                        title: const Text('Every Hour'),
                        value: RepeatInterval.hour,
                        groupValue: _repeatInterval,
                        onChanged: (RepeatInterval? value) {
                          setState(() {
                            _repeatInterval = value!;
                          });
                        },
                      ),
                      RadioListTile<RepeatInterval>(
                        title: const Text('Every Day'),
                        value: RepeatInterval.day,
                        groupValue: _repeatInterval,
                        onChanged: (RepeatInterval? value) {
                          setState(() {
                            _repeatInterval = value!;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ],
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text(
                      'Cancel',
                      style: TextStyle(color: theme.colorScheme.secondary),
                    ),
                  ),
                  const SizedBox(width: 16),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        final now = DateTime.now();
                        final scheduledDateTime = DateTime(
                          now.year,
                          now.month,
                          now.day,
                          _selectedTime.hour,
                          _selectedTime.minute,
                        );

                        Navigator.pop(
                          context,
                          NotificationData(
                            scheduledDateTime: scheduledDateTime,
                            repeatNotification: _repeatNotification,
                            repeatInterval: _repeatInterval,
                          ),
                        );
                      }
                    },
                    child: const Text('Schedule'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
