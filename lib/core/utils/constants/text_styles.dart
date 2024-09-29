import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class TTextStyles {
  static TextStyle inter({
    required double fontSize,
    FontWeight fontWeight = FontWeight.w500,
    Color color = Colors.black,
    double? height,
  }) {
    return GoogleFonts.inter(
      fontSize: fontSize.sp,
      fontWeight: fontWeight,
      color: color,
      height: height,
    );
  }

  static TextStyle poppins({
    required double fontSize,
    FontWeight fontWeight = FontWeight.w400,
    Color color = Colors.black,
    double? height,
  }) {
    return GoogleFonts.poppins(
      fontSize: fontSize.sp,
      fontWeight: fontWeight,
      color: color,
      height: height,
    );
  }

  static TextStyle roboto({
    required double fontSize,
    FontWeight fontWeight = FontWeight.w400,
    Color color = Colors.black,
    double? height,
  }) {
    return GoogleFonts.roboto(
      fontSize: fontSize.sp,
      fontWeight: fontWeight,
      color: color,
      height: height,
    );
  }

  // Define specific text styles
  static TextStyle interMedium14_6 = inter(fontSize: 14.6);
  static TextStyle interBold14_6 =
      inter(fontSize: 14.6, fontWeight: FontWeight.bold);

  static TextStyle poppinsLight14 =
      poppins(fontSize: 14, fontWeight: FontWeight.w300);
  static TextStyle poppinsLight9 =
      poppins(fontSize: 9, fontWeight: FontWeight.w300);
  static TextStyle poppinsLight16 =
      poppins(fontSize: 16, fontWeight: FontWeight.w300);
  static TextStyle poppinsLight15 =
      poppins(fontSize: 15, fontWeight: FontWeight.w300);
  static TextStyle poppinsLight20 =
      poppins(fontSize: 20, fontWeight: FontWeight.w300);

  static TextStyle poppinsMedium10 =
      poppins(fontSize: 10, fontWeight: FontWeight.w500);
  static TextStyle poppinsMedium18 =
      poppins(fontSize: 18, fontWeight: FontWeight.w500);
  static TextStyle poppinsMedium16 =
      poppins(fontSize: 16, fontWeight: FontWeight.w500);

  static TextStyle poppinsRegular16 = poppins(fontSize: 16);
  static TextStyle poppinsRegular10 = poppins(fontSize: 10);
  static TextStyle poppinsRegular12 = poppins(fontSize: 12);
  static TextStyle poppinsRegular14 = poppins(fontSize: 14);
  static TextStyle poppinsRegular8 = poppins(fontSize: 8);

  static TextStyle poppinsSemiBold14 =
      poppins(fontSize: 14, fontWeight: FontWeight.w600);
  static TextStyle poppinsSemiBold18 =
      poppins(fontSize: 18, fontWeight: FontWeight.w600);
  static TextStyle poppinsSemiBold16 =
      poppins(fontSize: 16, fontWeight: FontWeight.w600);
  static TextStyle poppinsSemiBold10 =
      poppins(fontSize: 10, fontWeight: FontWeight.w600);
  static TextStyle poppinsSemiBold9 =
      poppins(fontSize: 9, fontWeight: FontWeight.w600);
  static TextStyle poppinsSemiBold12 =
      poppins(fontSize: 12, fontWeight: FontWeight.w600);

  static TextStyle robotoRegular14 = roboto(fontSize: 14);
  static TextStyle robotoRegular12 = roboto(fontSize: 12);
  static TextStyle robotoMedium14 =
      roboto(fontSize: 14, fontWeight: FontWeight.w500);
  static TextStyle robotoMedium36 =
      roboto(fontSize: 36, fontWeight: FontWeight.w500);

  // Note: For TE HAFS2 Tharwat Emara, you might need to use a custom font
  // static TextStyle teHafs2TharwatEmara({
  //   required double fontSize,
  //   FontWeight fontWeight = FontWeight.w400,
  //   Color color = Colors.black,
  //   double? height,
  // }) {
  //   return TextStyle(
  //     fontFamily: 'TE HAFS2 Tharwat Emara',
  //     fontSize: fontSize.sp,
  //     fontWeight: fontWeight,
  //     color: color,
  //     height: height,
  //   );
  // }

  // static TextStyle teHafs2TharwatEmaraRegular10 =
  //     teHafs2TharwatEmara(fontSize: 10, height: 1.74);

  // Initialize the text styles
  static void initialize() {
    interMedium14_6 = inter(fontSize: 14.6);
    interBold14_6 = inter(fontSize: 14.6, fontWeight: FontWeight.bold);

    poppinsLight14 = poppins(fontSize: 14, fontWeight: FontWeight.w300);
    poppinsLight9 = poppins(fontSize: 9, fontWeight: FontWeight.w300);
    poppinsLight16 = poppins(fontSize: 16, fontWeight: FontWeight.w300);
    poppinsLight15 = poppins(fontSize: 15, fontWeight: FontWeight.w300);
    poppinsLight20 = poppins(fontSize: 20, fontWeight: FontWeight.w300);

    poppinsMedium10 = poppins(fontSize: 10, fontWeight: FontWeight.w500);
    poppinsMedium18 = poppins(fontSize: 18, fontWeight: FontWeight.w500);
    poppinsMedium16 = poppins(fontSize: 16, fontWeight: FontWeight.w500);

    poppinsRegular16 = poppins(fontSize: 16);
    poppinsRegular10 = poppins(fontSize: 10);
    poppinsRegular12 = poppins(fontSize: 12);
    poppinsRegular14 = poppins(fontSize: 14);
    poppinsRegular8 = poppins(fontSize: 8);

    poppinsSemiBold14 = poppins(fontSize: 14, fontWeight: FontWeight.w600);
    poppinsSemiBold18 = poppins(fontSize: 18, fontWeight: FontWeight.w600);
    poppinsSemiBold16 = poppins(fontSize: 16, fontWeight: FontWeight.w600);
    poppinsSemiBold10 = poppins(fontSize: 10, fontWeight: FontWeight.w600);
    poppinsSemiBold9 = poppins(fontSize: 9, fontWeight: FontWeight.w600);
    poppinsSemiBold12 = poppins(fontSize: 12, fontWeight: FontWeight.w600);

    robotoRegular14 = roboto(fontSize: 14);
    robotoRegular12 = roboto(fontSize: 12);
    robotoMedium14 = roboto(fontSize: 14, fontWeight: FontWeight.w500);
    robotoMedium36 = roboto(fontSize: 36, fontWeight: FontWeight.w500);

    // teHafs2TharwatEmaraRegular10 =
    //     teHafs2TharwatEmara(fontSize: 10, height: 1.74);
  }
}
