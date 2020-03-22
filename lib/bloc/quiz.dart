import 'package:kazpost/models/quiz.dart';

class QuizBloc {
  QuizModel quizModel = QuizModel();

  Stream<List> get getQuizzes async* {
    yield await quizModel.getQuizzes();
  }

  Stream<List> get getQuiz async* {
    yield await quizModel.getQuiz();
  }
}
