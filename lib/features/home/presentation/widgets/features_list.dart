import 'package:flutter/material.dart';
import 'package:wirdak/core/utils/constants/image_strings.dart';
import 'package:wirdak/core/utils/helpers/spacing.dart';
import 'package:wirdak/features/home/presentation/widgets/features_list_item.dart';
import 'package:wirdak/features/reading_azkar/presentation/views/all_azkar_view.dart';
import 'package:wirdak/features/reading_azkar/presentation/views/favourite_view.dart';

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
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            FeaturesListItem(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AllAzkarView(),
                      ));
                },
                title: "أذكار متنوعة",
                imagePath: ImageStrings.noteBook),
            const FeaturesListItem(
                title: "أقرب المساجد", imagePath: ImageStrings.mosqueSvg),
            FeaturesListItem(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const FavoritesView(),
                      ));
                },
                title: "المفضلة",
                imagePath: ImageStrings.favorites),
          ],
        )
      ],
    );
  }
}
