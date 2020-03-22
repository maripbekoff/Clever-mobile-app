import 'dart:convert';

import 'package:kazpost/bloc/connection.dart';
import 'package:http/http.dart' as http;
import 'package:kazpost/db/database_helper.dart';

class Send {
  Future callback(String title, String review) async {
    await Connection.checkConnection();

    if (network) {
      print('network: $network');

      try {
        await read.token();
        await read.uid();

        if (databaseHelper.accessToken == null) {
          print('Обновите токен');
          databaseHelper.refresh();
        } else {
          String url = "$api/feedback";

          final response = await http.post(url,
              headers: {"Authorization": "${databaseHelper.accessToken}"},
              body: {"title": "$title", "text": "$review", "author": "${databaseHelper.uid}"});
        }
      } catch (e) {
        print('Произошла ошибка при отправке сообщения в службу поддержки');
      }
    } else {
      print('network: $network');
    }
  }

  Future review(int score, int i, int rating, String callback) async {
    await Connection.checkConnection();

    if (network) {
      print('network: $network');

      await read.token();
      await read.uid();

      String url = '$api/quiz/upload';

      try {
        var params = {
          "uid": '${databaseHelper.uid}',
          "qid": '${quizzes["quizzes"][i]["qid"]}',
          "right": score,
          "review": {
            "rating": rating,
            "text": '$callback',
            "author": '${databaseHelper.uid}',
          },
        };

        final response = await http.post(
          url,
          headers: {
            "Content-Type": "application/json",
            "Authorization": "${databaseHelper.accessToken}"
          },
          body: json.encode(params),
        );

        if (response.statusCode == 401) {
          print('Обновите токен');
        } else {
          print('Ваш отзыв был отправлен');
        }
      } catch (e) {
        print('Произошла ошибка при отправке отзыва на тестирование');
      }
    } else {
      print('network: $network');
    }
  }
}
