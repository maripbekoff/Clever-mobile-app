import 'package:flutter/material.dart';

class SecuritySettings extends StatelessWidget {
  const SecuritySettings({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF6F9FF),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text("Назад"),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Безопасность",
              style: TextStyle(
                fontFamily: "Montserrat",
                fontSize: 36,
                fontWeight: FontWeight.bold,
              ),
            ),
            FlatButton(
              onPressed: () {},
              child: Text("Изменить пароль"),
              color: Colors.transparent,
            ),
          ],
        ),
      ),
    );
  }
}
