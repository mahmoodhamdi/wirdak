import 'package:flutter/material.dart';
import 'package:wirdak/core/common/models/azkar_category.dart';
import 'package:wirdak/core/utils/constants/azkar_data.dart';
import 'package:wirdak/core/utils/constants/image_strings.dart';
import 'package:wirdak/core/utils/helpers/spacing.dart';
import 'package:wirdak/features/home/presentation/widgets/features_list_item.dart';
import 'package:wirdak/features/prayer_timer/presentation/views/prayer_times_view.dart';
import 'package:wirdak/features/reading_azkar/presentation/views/all_azkar_view.dart';
import 'package:wirdak/features/reading_azkar/presentation/views/favourite_view.dart';
import 'package:wirdak/features/reading_azkar/presentation/views/ziker_view.dart';

class FeaturesList extends StatelessWidget {
  const FeaturesList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<AzkarCategory> azkarCategories =
        azkarCategoriesFromJson(AzkarData.azkarList);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ZikerView(
                      categoryName: "أذكار الصلاه",
                      zikerList: azkarCategories[26].azkarList,
                    ),
                  ),
                );
              },
              child: const FeaturesListItem(
                  title: "أذكار الصلاه", imagePath: ImageStrings.prayerFajr),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ZikerView(
                      categoryName: "أذكار الصباح",
                      zikerList: azkarCategories[0].azkarList,
                    ),
                  ),
                );
              },
              child: const FeaturesListItem(
                  title: "أذكار الصباح", imagePath: ImageStrings.sabah),
            ),
            GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ZikerView(
                        categoryName: "أذكار المساء",
                        zikerList: azkarCategories[0].azkarList,
                      ),
                    ),
                  );
                },
                child: const FeaturesListItem(
                    title: "أذكار المساء", imagePath: ImageStrings.masaa)),
          ],
        ),
        verticalSpace(20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const FeaturesListItem(
                title: "التقويم الهجري", imagePath: ImageStrings.calendar),
            const FeaturesListItem(
                title: "التسبيح", imagePath: ImageStrings.prayerBeads),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PrayerTimesView(),
                  ),
                );
              },
              child: const FeaturesListItem(
                  title: "جميع الأدعية", imagePath: ImageStrings.doaaa),
            ),
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
