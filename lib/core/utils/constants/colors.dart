import 'package:flutter/material.dart';

class TColors {
  // Primary colors
  static const Color primary = Color(0xFF005773);
  static const Color secondary = Color(0xFF01B7F1);
  static const Color black = Color(0xFF000000);
  static const Color white = Color(0xFFFFFFFF);

  // Grays
  static const Color gray100 = Color(0xFFF5F5F5);
  static const Color gray200 = Color(0xFFF2F2F2);
  static const Color gray300 = Color(0xFFD9D9D9);
  static const Color gray400 = Color(0xFFA1A1A1);
  static const Color gray500 = Color(0xFF666666);
  static const Color gray600 = Color(0xFF333333);
  static const Color gray700 = Color(0xFF2F2F2F);
  static const Color gray800 = Color(0xFF1E1E1E);

  // Blues
  static const Color lightBlue = Color(0xFFEDFBFF);
  static const Color skyBlue = Color(0xFFBEE8F1);
  static const Color deepBlue = Color(0xFF19699D);
  static const Color navyBlue = Color(0xFF1B6180);

  // Team Colors
  static const Color teamLightSelected = Color(0xFF666666);
  static const Color teamLightSecondary = Color(0xFFA1A1A1);
  static const Color teamLightPrimary = Color(0xFF333333);

  // Colors with opacity
  static const Color blackOpacity60 = Color(0x99000000);
  static const Color blackOpacity18 = Color(0x2E000000);
  static const Color whiteOpacity10 = Color(0x1AFFFFFF);
  static const Color primaryOpacity70 = Color(0xB3005773);
  static const Color primaryOpacity56 = Color(0x8F005773);
  static const Color primaryOpacity50 = Color(0x80005773);
  static const Color primaryOpacity27 = Color(0x45005773);
  static const Color secondaryOpacity50 = Color(0x8001B7F1);
  static const Color gray100Opacity80 = Color(0xCCF5F5F5);
  static const Color gray100Opacity50 = Color(0x80F5F5F5);
  static const Color gray300Opacity47 = Color(0x78D9D9D9);
  static const Color gray800Opacity50 = Color(0x801E1E1E);
  static const Color gray800Opacity35 = Color(0x591E1E1E);
  static const Color lightBlueOpacity80 = Color(0xCCEDFBFF);

  // Linear Gradient
  static const LinearGradient primaryGradient = LinearGradient(
    // You'll need to define the specific colors and stops for this gradient
    colors: [Color(0xFF000000), Color(0xFFFFFFFF)],
    stops: [0.0, 1.0],
  );
}
