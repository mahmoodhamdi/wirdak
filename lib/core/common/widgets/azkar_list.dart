import 'package:flutter/material.dart';
import 'package:wirdak/core/common/models/azkar_category.dart';
import 'package:wirdak/core/common/widgets/azkar_list_item.dart';

class AzkarList extends StatelessWidget {
  const AzkarList({
    super.key,
    required this.azkarCategories,
  });

  final List<AzkarCategory> azkarCategories;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: azkarCategories.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: AzkarListItem(azkarCategory: azkarCategories[index]),
          );
        });
  }
}
