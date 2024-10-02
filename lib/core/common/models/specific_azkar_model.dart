class SpecificAzkarModel {
  String category;
  int count;
  String content;

  SpecificAzkarModel({
    required this.category,
    required this.count,
    required this.content,
  });

  // Factory method to create an Azkar instance from a map
  factory SpecificAzkarModel.fromMap(Map<String, dynamic> map) {
    return SpecificAzkarModel(
      category: map['category'],
      count: map['count'],
      content: map['content'],
    );
  }
}
