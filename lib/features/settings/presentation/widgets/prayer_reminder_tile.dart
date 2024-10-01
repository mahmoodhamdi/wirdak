import 'package:flutter/material.dart';

class PrayerReminderTile extends StatelessWidget {
  final String time;
  final bool isActive;
  final bool isSoundOn;
  final VoidCallback onActiveChanged;
  final VoidCallback onSoundChanged;

  const PrayerReminderTile({
    super.key,
    required this.time,
    required this.isActive,
    required this.isSoundOn,
    required this.onActiveChanged,
    required this.onSoundChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: const Color(0x80F5F5F5),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: onSoundChanged,
                child: Icon(
                  isSoundOn ? Icons.volume_up : Icons.volume_off,
                  color: isActive
                      ? const Color(0xFF01b7f1)
                      : const Color(0xFFADADAD),
                ),
              ),
              const SizedBox(width: 10),
              Text(
                time,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: isActive ? FontWeight.w600 : FontWeight.w400,
                  color: isActive
                      ? const Color(0xFF01b7f1)
                      : const Color(0xFFADADAD),
                ),
              ),
            ],
          ),
          Switch(
            value: isActive,
            onChanged: (_) => onActiveChanged(),
            activeTrackColor: const Color(0xFF01b7f1),
            inactiveTrackColor: Colors.grey,
            inactiveThumbColor: Colors.white,
          ),
        ],
      ),
    );
  }
}
