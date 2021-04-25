import 'dart:convert';

class UserModal {
  final String name;
  final String photoUrl;
  final int score;

  UserModal({
    required this.name,
    required this.photoUrl,
    this.score = 0,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'photoUrl': photoUrl,
      'score': score,
    };
  }

  factory UserModal.fromMap(Map<String, dynamic> map) {
    return UserModal(
      name: map['name'],
      photoUrl: map['photoUrl'],
      score: map['score'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModal.fromJson(String source) =>
      UserModal.fromMap(json.decode(source));
}
