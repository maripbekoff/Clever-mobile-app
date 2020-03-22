import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

class MethodicsPage extends StatefulWidget {
  MethodicsPage({Key key, this.href}) : super(key: key);

  final String href;

  @override
  _MethodicsPageState createState() => new _MethodicsPageState();
}

class _MethodicsPageState extends State<MethodicsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FileName'),
      ),
      body: Stack(
        children: <Widget>[
          PDFView(
            filePath: widget.href,
            autoSpacing: true,
            enableSwipe: true,
            nightMode: true,
            onError: (e) {
              print(e);
            },
          ),
        ],
      ),
    );
  }
}
