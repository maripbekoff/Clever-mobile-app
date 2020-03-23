import 'dart:convert';

import 'package:kazpost/bloc/connection.dart';
import 'package:kazpost/db/database_helper.dart';
import 'package:http/http.dart' as http;

Statistics statistics = Statistics();

class Statistics {
  quizzes() async {
    Connection.checkConnection();

    if (network) {
      print('network: $network');

      await read.token();
      await read.uid();

      String url = '$api/getStat';

      try {
        if (databaseHelper.accessToken == null) {
          print('Обновите токен');
          databaseHelper.refresh();
        } else {
          var response = await http.post(url,
              headers: {'Authorization': '${databaseHelper.accessToken}'},
              body: {'uid': '${databaseHelper.uid}'});

          var data = response.body;
          quizStats = json.decode(data);
        }
      } catch (e) {
        print('Произошла ошибка при получении статистики пользователя');
      }
    } else {
      print('network: $network');
    }
  }
}
