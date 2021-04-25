import 'package:DevQuiz/shared/models/question_modal.dart';
import 'dart:convert';

enum Level { facil, medio, dificil, perito }

extension LevelStringExt on String {
  Level get parse => {
        "facil": Level.facil,
        "medio": Level.medio,
        "dificil": Level.dificil,
        "perito": Level.perito,
      }[this]!;
}

extension LevelExt on Level {
  String get parse => {
        Level.facil: "facil",
        Level.medio: "medio",
        Level.dificil: "dificil",
        Level.perito: "perito",
      }[this]!;
}

class QuizModal {
  final String title;
  final List<QuestionModal> questions;
  final int questionAnswered;
  final String imagem;
  final Level level;

  QuizModal({
    required this.title,
    required this.questions,
    this.questionAnswered = 0,
    required this.imagem,
    required this.level,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'questions': questions.map((x) => x.toMap()).toList(),
      'questionAnswered': questionAnswered,
      'imagem': imagem,
      'level': level.parse,
    };
  }

  factory QuizModal.fromMap(Map<String, dynamic> map) {
    return QuizModal(
      title: map['title'],
      questions: List<QuestionModal>.from(
          map['questions']?.map((x) => QuestionModal.fromMap(x))),
      questionAnswered: map['questionAnswered'],
      imagem: map['imagem'],
      level: map['level'].toString().parse,
    );
  }

  String toJson() => json.encode(toMap());

  factory QuizModal.fromJson(String source) =>
      QuizModal.fromMap(json.decode(source));
}
