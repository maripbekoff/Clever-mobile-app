import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:pdf_viewer_plugin/pdf_viewer_plugin.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;

void main() => runApp(PdfView());

class PdfView extends StatefulWidget {
  @override
  _PdfViewState createState() => _PdfViewState();
}

class _PdfViewState extends State<PdfView> {
  String path;

  @override
  initState() {
    super.initState();
  }

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/teste.pdf');
  }

  Future<File> writeCounter(Uint8List stream) async {
    final file = await _localFile;

    // Write the file
    return file.writeAsBytes(stream);
  }

  Future<Uint8List> fetchPost() async {
    final response =
        await http.get('http://188.225.9.250/nginx/assets/files/file.pdf');
    final responseJson = response.bodyBytes;

    return responseJson;
  }

  loadPdf() async {
    writeCounter(await fetchPost());
    path = (await _localFile).path;

    if (!mounted) return;

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Документ'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            if (path != null)
              Expanded(
                child: Container(
                  height: 500.0,
                  child: PdfViewer(
                    filePath: path,
                  ),
                ),
              )
            else
              RaisedButton(
                color: Color(0xFF0157A5),
                textColor: Colors.white,
                child: Text("Загрузить"),
                onPressed: loadPdf,
              ),
          ],
        ),
      ),
    );
  }
}
