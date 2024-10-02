import 'package:equatable/equatable.dart';
import 'package:wirdak/core/utils/constants/image_strings.dart';

class Destination extends Equatable {
  final String label;
  final String iconPath;
  const Destination({
    required this.label,
    required this.iconPath,
  });
  @override
  List<Object> get props => [
        label,
        iconPath,
      ];
}

const List<Destination> destinations = [
  Destination(
    label: 'الصفحة الرئيسية',
    iconPath: ImageStrings.iconMosqueLight,
  ),
  Destination(
    label: 'مواقيت الصلاة',
    iconPath: ImageStrings.iconTimeLine,
  ),
  Destination(
    label: 'الإعدادات',
    iconPath: ImageStrings.iconSettings,
  ),
];
