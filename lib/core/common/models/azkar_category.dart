 

import 'package:wirdak/core/common/models/azkar_model.dart';

class AzkarCategory {
  final int id;
  final String category;
  final String filename;
  final List<ZikerModel> azkarList;

  AzkarCategory({
    required this.id,
    required this.category,
    required this.filename,
    required this.azkarList,
  });

  factory AzkarCategory.fromJson(Map<String, dynamic> json) {
    var azkarJson = json['array'] as List;
    List<ZikerModel> azkarList =
        azkarJson.map((i) => ZikerModel.fromJson(i)).toList();

    return AzkarCategory(
      id: json['id'],
      category: json['category'],
      filename: json['filename'],
      azkarList: azkarList,
    );
  }
}

List<AzkarCategory> azkarCategoriesFromJson(List<dynamic> jsonList) {
  return jsonList.map((json) => AzkarCategory.fromJson(json)).toList();
}
 
 