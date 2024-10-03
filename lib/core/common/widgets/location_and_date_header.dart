import 'package:flutter/material.dart';
import 'package:wirdak/core/utils/constants/colors.dart';

import 'date_widget.dart'; // Import the DateWidget
import 'location_widget.dart'; // Import the LocationWidget

class LocationAndDateHeader extends StatelessWidget {
   final String hijriDate;
  final String locationLabel;
  final String location;
  final Color color;
  const LocationAndDateHeader({
    super.key,
    this.color = TColors.gray800,
     required this.hijriDate,
    required this.locationLabel,
    required this.location,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          DateWidget(
            color: color,
            hijriDate: hijriDate,
          ),
          LocationWidget(
            color: color,
            label: locationLabel,
            location: location,
          ),
        ],
      ),
    );
  }
}
