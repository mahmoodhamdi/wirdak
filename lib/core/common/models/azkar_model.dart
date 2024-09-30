class ZikerModel {
  final int id;
  final String text;
  final int count;
  final String filename;

  ZikerModel({
    required this.id,
    required this.text,
    required this.count,
    required this.filename,
  });

  factory ZikerModel.fromJson(Map<String, dynamic> json) {
    return ZikerModel(
      id: json['id'],
      text: json['text'],
      count: json['count'],
      filename: json['filename'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'text': text,
      'count': count,
      'filename': filename,
    };
  }
}
