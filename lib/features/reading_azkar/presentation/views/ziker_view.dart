import 'package:flutter/material.dart';
import 'package:wirdak/core/common/models/azkar_model.dart';
import 'package:wirdak/core/common/widgets/custom_app_bar.dart';
import 'package:wirdak/core/common/widgets/ziker_card.dart';

class ZikerView extends StatelessWidget {
  const ZikerView(
      {super.key, required this.categoryName, required this.zikerList});
  final String categoryName;
  final List<ZikerModel> zikerList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: categoryName),
      body: ListView.builder(
        itemCount: zikerList.length,
        itemBuilder: (context, index) {
          return ZikerCard(ziker: zikerList[index]);
        },
      ),
    );
  }
}
