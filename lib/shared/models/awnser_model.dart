import 'dart:convert';

class AwnserModal {
  final String title;
  final bool isRight;

  AwnserModal({
    required this.title,
    this.isRight = false,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'isRight': isRight,
    };
  }

  factory AwnserModal.fromMap(Map<String, dynamic> map) {
    return AwnserModal(
      title: map['title'],
      isRight: map['isRight'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory AwnserModal.fromJson(String source) =>
      AwnserModal.fromMap(json.decode(source));
}
