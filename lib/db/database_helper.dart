import 'dart:convert';

import 'package:android_alarm_manager/android_alarm_manager.dart';
import 'package:kazpost/bloc/connection.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

final String api = 'http://188.225.9.250/api';

DatabaseHelper databaseHelper = DatabaseHelper();
Read read = Read();
Save save = Save();

// collection of all data, where we retain useful information
var courseList; // List of courses
var course; // Content of course
var files; // List of files
var quizzes; // List of quizzes
var quiz; // Conent of quiz
String qid; // Quiz's identification

class DatabaseHelper {
  String accessToken;
  String uid;
  String refreshToken;
  String name;
  String type;
  String avatar;
  String email;
  String position;
  int numberOfQuizzes = 0;

  Future refresh() async {
    await Connection.checkConnection();

    if (network) {
      print('network: $network');

      String url = '$api/refresh';

      try {
        var prefs = await SharedPreferences.getInstance();
        await read.refreshToken();

        if (refreshToken == null) {
          print('Пожалуйста войдите снова в аккаунт.');
        } else {
          final response = await http.post(url, body: {"refreshToken": "$refreshToken"});
          final status = response.body.contains('Некорректный токен!');

          final data = await json.decode(response.body);

          if (status) {
            print('Ошибка при обновлении токена');
          } else {
            await prefs.remove('accessToken');
            await prefs.remove('refreshToken');
            save.token(data["accessToken"]);
            save.refreshToken(data["refreshToken"]);
            print('Обновлен accessToken');
          }
        }
      } catch (e) {
        print('Произошла ошибка при обновлении токена');
      }
    } else {
      print('network: $network');
    }
  }

  logOut() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove("accessToken");
    prefs.remove("refreshToken");
    prefs.remove("name");
    prefs.remove("_id");
    prefs.remove("type");
    prefs.remove("email");
    prefs.remove("avatar");
    prefs.remove("position");
    AndroidAlarmManager.cancel(0);
    print('Пользователь вышел с аккаунта');
  }
}

class Read {
  token() async {
    var prefs = await SharedPreferences.getInstance();
    final key = 'accessToken';
    final value = prefs.getString(key) ?? '';
    if (value != '') {
      databaseHelper.accessToken = value;
      print(databaseHelper.accessToken);
      return databaseHelper.accessToken;
    }
  }

  refreshToken() async {
    var prefs = await SharedPreferences.getInstance();
    final key = 'refreshToken';
    final value = prefs.getString(key) ?? '';
    if (value != '') {
      databaseHelper.refreshToken = value;
      print(databaseHelper.refreshToken);
    }
  }

  uid() async {
    var prefs = await SharedPreferences.getInstance();
    final key = 'uid';
    final value = prefs.getString(key) ?? '';
    if (value != '') {
      databaseHelper.uid = value;
      print(databaseHelper.uid);
    }
  }

  name() async {
    var prefs = await SharedPreferences.getInstance();
    final key = 'name';
    final value = prefs.getString(key) ?? '';
    if (value != '') {
      databaseHelper.name = value;
      print(databaseHelper.name);
    }
  }

  type() async {
    var prefs = await SharedPreferences.getInstance();
    final key = 'type';
    final value = prefs.getString(key) ?? '';
    if (value != '') {
      databaseHelper.type = value;
      print(databaseHelper.type);
    }
  }

  email() async {
    var prefs = await SharedPreferences.getInstance();
    final key = 'email';
    final value = prefs.getString(key) ?? '';
    if (value != '') {
      databaseHelper.email = value;
      print(databaseHelper.email);
    }
  }

  avatar() async {
    var prefs = await SharedPreferences.getInstance();
    final key = 'avatar';
    final value = prefs.getString(key) ?? '';
    if (value != '') {
      databaseHelper.avatar = value;
      print(databaseHelper.avatar);
    }
  }

  position() async {
    var prefs = await SharedPreferences.getInstance();
    final key = 'position';
    final value = prefs.getString(key) ?? '';
    if (value != '') {
      databaseHelper.position = value;
      print(databaseHelper.position);
    }
  }

  numberOfQuizzes() async {
    var prefs = await SharedPreferences.getInstance();
    final key = 'numberOfQuizzes';
    final value = prefs.getInt(key) ?? '';
    if (value != '') {
      databaseHelper.numberOfQuizzes = value;
      print(databaseHelper.numberOfQuizzes);
    }
  }
}

// Functions to save permanent variables
class Save {
  token(String accessToken) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'accessToken';
    final value = accessToken;
    prefs.setString(key, value);
  }

  refreshToken(String refreshToken) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'refreshToken';
    final value = refreshToken;
    prefs.setString(key, value);
  }

  uid(String uid) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'uid';
    final value = uid;
    prefs.setString(key, value);
  }

  name(String name) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'name';
    final value = name;
    prefs.setString(key, value);
  }

  type(String type) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'type';
    final value = type;
    prefs.setString(key, value);
  }

  email(String email) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'email';
    final value = email;
    prefs.setString(key, value);
  }

  avatar(String avatar) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'avatar';
    final value = avatar;
    prefs.setString(key, value);
  }

  position(String position) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'position';
    final value = position;
    prefs.setString(key, value);
  }

  numberOfQuizzes(int numberOfQuizzes) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'numberOfQuizzes';
    final value = numberOfQuizzes;
    prefs.setInt(key, value);
  }
}
