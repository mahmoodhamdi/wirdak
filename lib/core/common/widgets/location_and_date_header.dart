import 'package:flutter/material.dart';

import 'date_widget.dart'; // Import the DateWidget
import 'location_widget.dart'; // Import the LocationWidget

class LocationAndDateHeader extends StatelessWidget {
  final String gregorianDate;
  final String hijriDate;
  final String locationLabel;
  final String location;

  const LocationAndDateHeader({
    super.key,
    required this.gregorianDate,
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
            gregorianDate: gregorianDate,
            hijriDate: hijriDate,
          ),
          LocationWidget(
            label: locationLabel,
            location: location,
          ),
        ],
      ),
    );
  }
}
