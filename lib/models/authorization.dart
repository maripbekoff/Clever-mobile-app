import 'package:http/http.dart' as http;
import 'package:kazpost/bloc/connection.dart';
import 'package:kazpost/db/database_helper.dart';
import 'dart:convert' show json;

class Authorization {
  bool status = true;

  Future login(String email, String password) async {
    await Connection.checkConnection();

    if (network) {
      print('network: $network');

      String url = '$api/login';

      try {
        final response = await http.post(url, body: {"email": "$email", "password": "$password"});
        status = response.body.contains('error');

        final data = json.decode(response.body);

        save.token(data["tokens"]["accessToken"]);
        save.refreshToken(data["tokens"]["refreshToken"]);
        save.name(data["user"]["name"]);
        save.uid(data["user"]["_id"]);
        save.type(data["user"]["type"]);
        save.email(data["user"]["email"]);
        save.avatar(data["user"]["avatar"]);
        save.position(data["user"]["position"]);

        read.token();
        read.refreshToken();
        read.name();
        read.uid();
        read.type();
        read.email();
        read.avatar();
        read.position();

        print('Авторизация пользователя произведена успешно');
      } catch (e) {
        print('Произошла ошибка при авторизации пользователя');
      }
    } else {
      print('network: $network');
    }
  }
}
