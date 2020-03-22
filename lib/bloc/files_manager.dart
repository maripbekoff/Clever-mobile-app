import 'dart:async';

import 'package:kazpost/models/files.dart';

FilesModel filesModel = FilesModel();

class FilesManager {
  Stream<List> get filesList async* {
    yield await filesModel.getFiles();
  }
}
