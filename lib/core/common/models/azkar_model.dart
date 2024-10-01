import 'package:equatable/equatable.dart';

class ZikerModel extends Equatable {
  final int id;
  final String text;
  final int count;
  final String filename;

  const ZikerModel({
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

  @override
  List<Object?> get props => [id, text, count, filename];

  @override
  bool get stringify => true; // Optional for better debugging
}
