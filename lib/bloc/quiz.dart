import 'package:kazpost/models/quiz.dart';

class QuizBloc {
  Stream<List> get getQuizzes async* {
    yield await quizModel.getQuizzes();
  }

  Stream<List> get getQuiz async* {
    yield await quizModel.getQuiz();
  }
}
