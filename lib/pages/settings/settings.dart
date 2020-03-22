import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kazpost/db/database_helper.dart';
import 'package:kazpost/pages/settings/pages/faq_settings.dart';
import 'package:kazpost/pages/settings/pages/profile.dart';
import 'package:kazpost/pages/settings/pages/security.dart';

final String faq = './assets/img/faq.png';
final String lang = './assets/img/lang.png';
final String lock = './assets/img/lock.png';
final String user = './assets/img/user.png';

class SettingsPage extends StatefulWidget {
  SettingsPage({Key key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  void initState() {
    read.avatar();
    read.name();
    read.type();
    super.initState();
  }

  final int txtColor = 0xFF8465B7;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF6F9FF),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              'Настройки',
              style: TextStyle(fontFamily: 'Montserrat', fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 20),
          Center(
            child: Column(
              children: <Widget>[
                CircleAvatar(backgroundImage: NetworkImage(databaseHelper.avatar), radius: 40),
                SizedBox(height: 15),
                Text(
                  '${databaseHelper.name}',
                  style: TextStyle(
                    fontFamily: "Montserrat",
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: Color(0xFFE4E2F4),
                    borderRadius: BorderRadius.circular(360),
                  ),
                  child: Text(
                    "${databaseHelper.type}",
                    style: TextStyle(
                      fontSize: 10,
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.bold,
                      color: Color(txtColor),
                    ),
                  ),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 35,
              ),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              child: ListView(
                physics: BouncingScrollPhysics(),
                children: <Widget>[
                  // Профиль
                  ListTile(
                    contentPadding: const EdgeInsets.all(0),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProfileSettings(),
                        ),
                      );
                    },
                    leading: Container(
                      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                      decoration: BoxDecoration(
                        color: Color(0xFF0157A5),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Image.asset(
                        user,
                        height: 25,
                        width: 25,
                      ),
                    ),
                    title: Text(
                      "Профиль",
                      style: TextStyle(fontSize: 17, color: Color(txtColor)),
                    ),
                  ),
                  // Профиль

                  // Безопасность
                  ListTile(
                    contentPadding: const EdgeInsets.all(0),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SecuritySettings(),
                        ),
                      );
                    },
                    leading: Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 5,
                        horizontal: 5,
                      ),
                      decoration: BoxDecoration(
                        color: Color(0xFF0157A5),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Image.asset(
                        lock,
                        height: 25,
                        width: 25,
                      ),
                    ),
                    title: Text(
                      "Безопасность",
                      style: TextStyle(
                        fontSize: 17,
                        color: Color(txtColor),
                      ),
                    ),
                  ),
                  // Безопасность

                  // Язак приложения
                  ListTile(
                    contentPadding: const EdgeInsets.all(0),
                    onTap: () {},
                    leading: Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 5,
                        horizontal: 5,
                      ),
                      decoration: BoxDecoration(
                        color: Color(0xFF0157A5),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Image.asset(
                        lang,
                        height: 25,
                        width: 25,
                      ),
                    ),
                    title: Text(
                      "Язык приложения",
                      style: TextStyle(
                        fontSize: 17,
                        color: Color(txtColor),
                      ),
                    ),
                  ),
                  // Язык приложения

                  Divider(
                    thickness: 1.5,
                    color: Colors.black12,
                  ),

                  // FAQ
                  ListTile(
                    contentPadding: const EdgeInsets.all(0),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FaqSettings(),
                        ),
                      );
                    },
                    leading: Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 5,
                        horizontal: 5,
                      ),
                      decoration: BoxDecoration(
                        color: Color(0xFF0157A5),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Image.asset(
                        faq,
                        height: 25,
                        width: 25,
                      ),
                    ),
                    title: Text(
                      "Поддержка. FAQ",
                      style: TextStyle(
                        fontSize: 17,
                        color: Color(txtColor),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
