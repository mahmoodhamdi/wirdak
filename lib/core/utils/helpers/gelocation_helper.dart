import 'dart:developer';

import 'package:geolocator/geolocator.dart';

/// Determine the current position of the device.
/// Handles location permissions, logs for debugging,
/// and prompts users to enable permissions if denied permanently.
Future<Position> determinePosition() async {
  bool serviceEnabled;
  LocationPermission permission;

  // Test if location services are enabled.
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    // Log the error
    log('Location services are disabled.');
    return Future.error('Location services are disabled.');
  }

  permission = await Geolocator.checkPermission();

  // Handle denied permissions
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      // Log permission denial
      log('Location permissions are denied.');
      return Future.error('Location permissions are denied.');
    }
  }

  // Handle denied forever permissions
  if (permission == LocationPermission.deniedForever) {
    log('Location permissions are permanently denied.');
    //  _showPermissionDeniedDialog(context); // Prompts user to go to settings
    return Future.error(
        'Location permissions are permanently denied, we cannot request permissions.');
  }

  // When we reach here, permissions are granted and we can continue.
  try {
    Position position = await Geolocator.getCurrentPosition();
    log('Current position: $position'); // Log the position for debugging
    return position;
  } catch (e) {
    log('Error occurred while getting location: $e');
    return Future.error('Error occurred while getting location: $e');
  }
}
