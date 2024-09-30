import 'package:flutter/material.dart';
import 'package:wirdak/core/common/models/azkar_category.dart';
import 'package:wirdak/core/common/widgets/azkar_list.dart';
import 'package:wirdak/core/utils/constants/azkar_data.dart';
import 'package:wirdak/core/utils/constants/colors.dart';
import 'package:wirdak/core/utils/spacing.dart';

class AllAzkarView extends StatelessWidget {
  const AllAzkarView({super.key});

  @override
  Widget build(BuildContext context) {
    List<AzkarCategory> azkarCategories =
        azkarCategoriesFromJson(AzkarData.azkarList);

    return Scaffold(
      
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              color: TColors.white,
            ),
          ),
          title: Row(
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back),
                color: TColors.secondary,
                iconSize: 24,
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              horizontalSpace(4),
              const Text(
                'أذكار متنوعة',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: TColors.secondary,
                  fontSize: 18,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        body: SafeArea(child: AzkarList(azkarCategories: azkarCategories)));
  }
}
