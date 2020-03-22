import 'dart:convert';

import 'package:kazpost/bloc/connection.dart';
import 'package:kazpost/db/database_helper.dart';
import 'package:kazpost/pages/quiz/quiz.dart';
import 'package:http/http.dart' as http;

class QuizModel {
  Future getQuizzes() async {
    await Connection.checkConnection();

    if (network) {
      print('network: $network');

      await read.token();
      await read.uid();

      String url = "$api/quizzes";
      print(databaseHelper.accessToken);

      try {
        if (databaseHelper.accessToken == null) {
          print('Обновите токен');
        } else {
          final response = await http.post(url, headers: {
            "Authorization": "${databaseHelper.accessToken}",
          }, body: {
            "uid": "${databaseHelper.uid}",
          });

          var data = response.body;
          var error = response.body.contains('Некорректный');

          quizzes = json.decode(data);

          if (error) {
            print('Произошла ошибка при получении тестов: $quizzes');
          } else {
            print('Тесты были успешно доставлены');
          }
        }
      } catch (e) {
        print('Произошла ошибка при получении списка тестов');
      }
    } else {
      print('network: $network');
    }
  }

  Future getQuiz() async {
    await Connection.checkConnection();

    if (network) {
      print('network: $network');

      await read.token();

      try {
        if (databaseHelper.accessToken == null) {
          print('Обновите токен');
        } else {
          final String url = "$api/quiz";

          final response = await http.post(url,
              headers: {'Authorization': '${databaseHelper.accessToken}'}, body: {'qid': '$qid'});

          var data = response.body;
          var error = response.body.contains('error');

          quiz = json.decode(data);

          print(quiz);

          if (error) {
            print('Произошла ошибка при получении вопросов и ответов теста');
          } else {
            print('Тесты были доставлены');
          }
        }
      } catch (e) {
        print('Произошла ошибка при получении теста');
      }
    } else {
      print('network: $network');
    }
  }

  Future updateQuestion() async {
    return questionNumber++;
  }

  Future getStat() async {
    await Connection.checkConnection();

    if (network) {
      print('network: $network');

      try {
        read.token();

        if (databaseHelper.accessToken == null) {
          print('Обновите токен');
        } else {
          String url = '$api/quizzes';

          var response = await http.post(url,
              headers: {'Authorization': '${databaseHelper.accessToken}'},
              body: {'uid': '${databaseHelper.uid}'});

          var data = response.body;
          var stats = json.decode(data);
        }
      } catch (e) {
        print('Произошла ошибка при получении статистики пользователя');
      }
    } else {
      print('network: $network');
    }
  }
}
