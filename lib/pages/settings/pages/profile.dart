import 'package:flutter/material.dart';
import 'package:kazpost/db/database_helper.dart';

class ProfileSettings extends StatefulWidget {
  ProfileSettings({Key key}) : super(key: key);

  @override
  _ProfileSettingsState createState() => _ProfileSettingsState();
}

class _ProfileSettingsState extends State<ProfileSettings> {
  @override
  void initState() {
    read.avatar();
    read.name();
    read.email();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF6F9FF),
      appBar: AppBar(backgroundColor: Colors.transparent, title: Text("Назад"), elevation: 0),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Профиль",
              style: TextStyle(fontFamily: "Montserrat", fontSize: 36, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            CircleAvatar(
                backgroundImage:
                    databaseHelper.avatar.isNotEmpty ? NetworkImage(databaseHelper.avatar) : null,
                radius: 30),
            SizedBox(height: 20),
            Text("Имя и фамилия: ${databaseHelper.name}\nВаш логин: ${databaseHelper.email}"),
          ],
        ),
      ),
    );
  }
}
