import 'package:kazpost/models/stats.dart';

class StatisticsBloc {
  Stream<List> get quizStats async* {
    yield await statistics.quizzes();
  }
}