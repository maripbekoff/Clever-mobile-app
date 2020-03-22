import 'dart:convert';
import 'dart:io';

import 'package:kazpost/db/database_helper.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;
import 'package:kazpost/bloc/connection.dart';

class FilesModel {
  Future getFiles() async {
    await Connection.checkConnection();

    if (network) {
      print('network: $network');

      await read.token();

      String url = "$api/getFiles";

      try {
        if (databaseHelper.accessToken == null) {
          print('Обновите токен');
          databaseHelper.refresh();
        } else {
          http.Response response = await http.post(url, headers: {
            "Content-Type": "application/json",
            "Authorization": "${databaseHelper.accessToken}",
          });

          bool status = response.body.contains('Некорректный токен!');

          String data = response.body;
          files = json.decode(data);

          if (status) {
            print('Некорректный токен!');
            databaseHelper.refresh();
          } else {
            print('Файлы были успешно доставлены');
          }
        }
      } catch (e) {
        print('Произошла ошибка при получении списка файлов');
      }
    } else {
      print('network: $network');
    }
  }

  Future<File> downloadFile(String href, String filename) async {
    await Connection.checkConnection();
    if (network) {
      print('network: $network');

      await read.token();

      try {
        if (databaseHelper.accessToken == null) {
          print('Обновите токен');
          databaseHelper.refresh();
        } else {
          var data = await http.get('$href');
          print('$href - $filename');
          var bytes = data.bodyBytes;
          var dir = await getApplicationDocumentsDirectory();
          File file = File("${dir.path}/$filename.pdf");

          File course = await file.writeAsBytes(bytes);
          return course;
        }
      } catch (e) {
        throw Exception("Ошибка при открытии файла");
      }
    } else {
      print('network: $network');
    }
  }
}
