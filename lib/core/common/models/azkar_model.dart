import 'package:equatable/equatable.dart';

class ZikerModel extends Equatable {
  final int id;
  final String text;
  final int count;

  const ZikerModel({
    required this.id,
    required this.text,
    required this.count,
  });

  factory ZikerModel.fromJson(Map<String, dynamic> json) {
    return ZikerModel(
      id: json['id'],
      text: json['text'],
      count: json['count'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'text': text,
      'count': count,
    };
  }

  @override
  List<Object?> get props => [id, text, count];

  @override
  bool get stringify => true; // Optional for better debugging
}
