import 'package:android_alarm_manager/android_alarm_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kazpost/db/database_helper.dart';
import 'package:kazpost/pages/authorization/authorization.dart';
import 'package:kazpost/pages/main/main.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AndroidAlarmManager.initialize();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Colors.grey[700]));
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'KazPost',
      theme: ThemeData(
        primaryColor: Colors.white,
        fontFamily: 'ProximaNova',
      ),
      routes: <String, WidgetBuilder>{
        "/mainpage": (BuildContext context) => Scaffold(body: MainPage()),
        "/authpage": (BuildContext context) => Scaffold(body: AuthPage()),
      },
      home: FutureBuilder(
        future: read.token(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Scaffold(
              body: MainPage(),
            );
          } else {
            return Scaffold(
              body: AuthPage(),
            );
          }
        },
      ),
    );
  }
}
