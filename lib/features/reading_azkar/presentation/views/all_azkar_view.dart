import 'package:flutter/material.dart';
import 'package:wirdak/core/common/models/azkar_category.dart';
import 'package:wirdak/core/common/widgets/azkar_list.dart';
import 'package:wirdak/core/common/widgets/custom_app_bar.dart';
import 'package:wirdak/core/utils/constants/azkar_data.dart';

class AllAzkarView extends StatelessWidget {
  const AllAzkarView({super.key});

  @override
  Widget build(BuildContext context) {
    List<AzkarCategory> azkarCategories =
        azkarCategoriesFromJson(AzkarData.azkarList);

    return Scaffold(
        appBar: const CustomAppBar(title: "أذكار متنوعة"),
        body: SafeArea(child: AzkarList(azkarCategories: azkarCategories)));
  }
}
