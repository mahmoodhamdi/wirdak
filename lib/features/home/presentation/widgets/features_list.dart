import 'dart:math';

import 'package:flutter/material.dart';
import 'package:wirdak/core/common/models/azkar_category.dart';
import 'package:wirdak/core/common/widgets/random_ziker_card.dart';
import 'package:wirdak/core/utils/constants/azkar_data.dart';
import 'package:wirdak/core/utils/constants/image_strings.dart';
import 'package:wirdak/core/utils/helpers/spacing.dart';
import 'package:wirdak/features/home/presentation/widgets/features_list_item.dart';
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
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ZikerView(
                      categoryName: "الأدعية",
                      zikerList: azkarCategories.last.azkarList,
                    ),
                  ),
                );
              },
              child: const FeaturesListItem(
                  title: "الأدعية", imagePath: ImageStrings.doaaa),
            ),
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
        ),
        verticalSpace(20),
        RandomZikerCard(
          ziker: azkarCategories.last.azkarList[
              Random().nextInt(azkarCategories.last.azkarList.length)],
        )
      ],
    );
  }
}
