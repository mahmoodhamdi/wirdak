import 'package:flutter/material.dart';
import 'package:wirdak/core/utils/constants/image_strings.dart';
import 'package:wirdak/core/utils/spacing.dart';
import 'package:wirdak/features/home/presentation/widgets/features_list_item.dart';

class FeaturesList extends StatelessWidget {
  const FeaturesList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            FeaturesListItem(
                title: "أذكار الصلاه", imagePath: ImageStrings.prayerFajr),
            FeaturesListItem(
                title: "أذكار الصباح", imagePath: ImageStrings.sabah),
            FeaturesListItem(
                title: "أذكار المساء", imagePath: ImageStrings.masaa),
          ],
        ),
        verticalSpace(20),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            FeaturesListItem(
                title: "التقويم الهجري", imagePath: ImageStrings.calendar),
            FeaturesListItem(
                title: "التسبيح", imagePath: ImageStrings.prayerBeads),
            FeaturesListItem(
                title: "جميع الأدعية", imagePath: ImageStrings.doaaa),
          ],
        ),
        verticalSpace(20),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            FeaturesListItem(
                title: "أذكار متنوعة", imagePath: ImageStrings.noteBook),
            FeaturesListItem(
                title: "أقرب المساجد", imagePath: ImageStrings.mosqueSvg),
            FeaturesListItem(
                title: "المفضلة", imagePath: ImageStrings.favorites),
          ],
        )
      ],
    );
  }
}
