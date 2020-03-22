import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:kazpost/bloc/connection.dart';
import 'package:http/http.dart' as http;
import 'package:kazpost/db/database_helper.dart';
import 'package:quill_delta/quill_delta.dart';

class CourseModel {
  Future getCourseList() async {
    await Connection.checkConnection();

    if (network) {
      print('network: $network');

      try {
        String url = '$api/course/list';

        await read.token();
        await read.uid();

        if (databaseHelper.accessToken == null) {
          print('Обновите токен.');
          databaseHelper.refresh();
        } else {
          var response = await http.post(url,
              headers: {'Authorization': databaseHelper.accessToken},
              body: {"uid": databaseHelper.uid});

          var data = response.body;
          courseList = json.decode(data);

          print('Курсы были получены');
        }
      } catch (e) {
        print('Произошла ошибка при получении курсов.');
      }
    } else
      print('network: $network');
  }

  Future getCourse(String cid) async {
    await Connection.checkConnection();

    if (network) {
      print('network: $network');

      try {
        String url = '$api/course';

        await read.token();

        if (databaseHelper.accessToken == null) {
          print('Обновите токен.');
          databaseHelper.refresh();
        } else {
          var response = await http.post(url,
              headers: {'Authorization': databaseHelper.accessToken}, body: {"cid": cid});

          var data = response.body;
          course = json.decode(data);

          print('Курс был получен');
        }
      } catch (e) {
        print('Произошла ошибка при получении курса');
        print(e);
      }
    } else
      print('network: $network');
  }
}
