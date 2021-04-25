import 'dart:convert';

import 'package:DevQuiz/shared/models/quiz_model.dart';
import 'package:DevQuiz/shared/models/users_model.dart';
import 'package:flutter/services.dart';

class HomeRepository {
  Future<UserModal> getUsers() async {
    final response = await rootBundle.loadString("assets/database/user.json");
    final user = UserModal.fromJson(response);
    return user;
  }

  Future<List<QuizModal>> getQuizzes() async {
    final response =
        await rootBundle.loadString("assets/database/quizzes.json");
    final list = jsonDecode(response) as List;
    final quizzes = list.map((e) => QuizModal.fromMap(e)).toList();
    return quizzes;
  }
}
