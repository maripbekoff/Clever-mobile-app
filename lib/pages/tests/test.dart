import 'package:flutter/material.dart';
import 'package:kazpost/pages/tests/test_card.dart';

class TestsScreen extends StatefulWidget {
  TestsScreen({Key key}) : super(key: key);

  @override
  _TestsScreenState createState() => _TestsScreenState();
}

class _TestsScreenState extends State<TestsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ListTile(
                contentPadding: EdgeInsets.zero,
                title: Text(
                  "Тестирование",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 2.8,
                child: ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text("Все тесты", style: TextStyle(fontSize: 22)),
                  trailing: Icon(Icons.arrow_forward_ios,
                      color: Colors.black, size: 16),
                ),
              ),
            ],
          ),
          TestCard(title: "Тест №1"),
        ],
      ),
    );
  }
}
