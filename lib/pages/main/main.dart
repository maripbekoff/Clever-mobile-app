import 'dart:ui';

import 'package:android_alarm_manager/android_alarm_manager.dart';
import 'package:flutter/material.dart';
import 'package:kazpost/db/database_helper.dart';
import 'package:kazpost/pages/homepage/home.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:kazpost/models/quiz.dart';
import 'package:kazpost/bloc/connection.dart';
import 'package:kazpost/pages/callback/callback.dart';
import 'package:kazpost/pages/courses/course_list.dart';
import 'package:kazpost/pages/profile/profile.dart';
import 'package:kazpost/pages/settings/settings.dart';
import 'package:kazpost/pages/tests/test_list.dart';
import 'package:kazpost/pages/tests/test.dart';

FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    new FlutterLocalNotificationsPlugin();

initialiseNotifications() async {
  var initializationSettingsAndroid = new AndroidInitializationSettings('mipmap/kazpost');
  var initializationSettingsIOS =
      new IOSInitializationSettings(onDidReceiveLocalNotification: (i, string1, string2, string3) {
    print("received notifications");
    return null;
  });
  var initializationSettings =
      new InitializationSettings(initializationSettingsAndroid, initializationSettingsIOS);
  await flutterLocalNotificationsPlugin.initialize(initializationSettings,
      onSelectNotification: (string) {
    print("selected notification");
    return null;
  });

  print('Инициализация плагина прошла успешно!');
}

pushNotifications() async {
  await Connection.checkConnection();

  if (network) {
    QuizModel quizModel = QuizModel();

    print('network: $network');

    read.token();
    read.numberOfQuizzes();

    if (databaseHelper.accessToken != null) {
      await quizModel.getQuizzes();

      print(
          'До условия(numberOfQuizzes): ${databaseHelper.numberOfQuizzes}\nДо условия(запрос): ${quizzes["quizzes"].length}');

      if (databaseHelper.numberOfQuizzes < quizzes["quizzes"].length) {
        var androidPlatformChannelSpecifics = AndroidNotificationDetails(
          '1',
          'SCC',
          'SCC by Code Union',
          importance: Importance.Max,
          priority: Priority.High,
          color: Colors.blue,
          style: AndroidNotificationStyle.BigText,
        );
        var iOSPlatformChannelSpecifics = IOSNotificationDetails();
        var platformChannelSpecifics =
            NotificationDetails(androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);
        await flutterLocalNotificationsPlugin.show(
            0,
            quizzes["quizzes"][quizzes["quizzes"].length - 1]["title"],
            'Вышел новый тест. На забудте его пройти\n${quizzes["quizzes"][quizzes["quizzes"].length - 1]["description"]}',
            platformChannelSpecifics,
            payload: 'item x');
        save.numberOfQuizzes(quizzes["quizzes"].length);

        print(
            'Новый тест(numberOfQuizzes): ${databaseHelper.numberOfQuizzes}\nНовый тест(запрос): ${quizzes["quizzes"].length}');

        print('Новый тест вышел');
      } else {
        databaseHelper.numberOfQuizzes = quizzes["quizzes"].length;
        save.numberOfQuizzes(databaseHelper.numberOfQuizzes);

        print(
            'Нету тестов(numberOfQuizzes): ${databaseHelper.numberOfQuizzes}\nНету тестов(запрос): ${quizzes["quizzes"].length}');
        print('Новых тестов нету');
      }
    }
  } else {
    print('network: $network');
  }
}

Future<void> initPlatformState() async {
  await initialiseNotifications();

  await AndroidAlarmManager.periodic(const Duration(seconds: 30), 0, pushNotifications);
}

class MainPage extends StatefulWidget {
  MainPage({Key key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  DatabaseHelper databaseHelper = new DatabaseHelper();

  final int newTestAlarm = 0;
  int _selectedIndex = 1;
  bool isCollapsed = false;
  final Duration _duration = Duration(milliseconds: 300);
  double screenWidth, screenHeight;

  @override
  void initState() {
    read.name();
    read.email();
    read.avatar();
    initPlatformState();
    super.initState();
  }

  static List<Widget> _widgetOptions = <Widget>[
    TestPageBar(),
    HomePage(),
    CallBackPage(),
    SettingsPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    screenWidth = size.width;
    screenHeight = size.height;

    return Scaffold(
      backgroundColor: Color(0xFFFDD365),
      body: Stack(
        children: <Widget>[
          menu(context),
          dashboard(context),
        ],
      ),
    );
  }

  Widget menu(BuildContext context) {
    final double _iconStyle = 22;
    final TextStyle _textStyle = TextStyle(fontSize: 18);
    final double _sizedBox = 25;

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 40, 0, 40),
      child: Column(
        children: <Widget>[
          Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Меню',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 34,
                ),
              )),
          Expanded(
            child: Align(
              alignment: Alignment.centerLeft,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProfilePage(),
                        ),
                      );
                    },
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.accessibility_new, size: _iconStyle),
                        SizedBox(width: 20),
                        Text('Мои данные', style: _textStyle),
                      ],
                    ),
                  ),
                  SizedBox(height: _sizedBox),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CourseList(),
                        ),
                      );
                    },
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.library_books, size: _iconStyle),
                        SizedBox(width: 20),
                        Text('Мои курсы', style: _textStyle),
                      ],
                    ),
                  ),
                  SizedBox(height: _sizedBox),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => TestListPage()),
                      );
                    },
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.extension, size: _iconStyle),
                        SizedBox(width: 20),
                        Text('Мои тесты', style: _textStyle),
                      ],
                    ),
                  ),
                  SizedBox(height: _sizedBox),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CallBackPage(),
                        ),
                      );
                    },
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.pan_tool, size: _iconStyle),
                        SizedBox(width: 20),
                        Text('Поддержка', style: _textStyle),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              padding: const EdgeInsets.all(5),
              decoration:
                  BoxDecoration(color: Color(0xFFEF5350), borderRadius: BorderRadius.circular(360)),
              child: IconButton(
                highlightColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                splashColor: Colors.transparent,
                icon: Icon(Icons.exit_to_app, color: Colors.white, size: 30),
                onPressed: () {
                  setState(() {
                    databaseHelper.logOut();
                    Navigator.pushReplacementNamed(context, "/authpage");
                  });
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget dashboard(BuildContext context) {
    QuizModel quizModel = QuizModel();

    return AnimatedPositioned(
      duration: _duration,
      top: isCollapsed ? 0 : 0.1 * screenHeight,
      left: isCollapsed ? 0 : 0.6 * screenWidth,
      bottom: isCollapsed ? 0 : 0.1 * screenHeight,
      right: isCollapsed ? 0 : -0.4 * screenWidth,
      child: ClipRRect(
        borderRadius: isCollapsed ? BorderRadius.circular(0) : BorderRadius.circular(30),
        child: AnimatedOpacity(
          duration: _duration,
          opacity: isCollapsed ? 1 : 0.5,
          child: Scaffold(
            appBar: AppBar(
              elevation: 4,
              leading: IconButton(
                icon: Icon(Icons.menu),
                onPressed: () {
                  setState(() {
                    isCollapsed = !isCollapsed;
                  });
                },
              ),
              actions: <Widget>[
                IconButton(
                  icon: Icon(Icons.notifications),
                  onPressed: () {
                    quizModel.getQuizzes();
                  },
                ),
              ],
            ),
            body: GestureDetector(
                onHorizontalDragUpdate: (details) {
                  if (details.delta.dx > 0) {
                    setState(() {
                      isCollapsed = !isCollapsed;
                    });
                    print(details.delta.dx);
                  } else if (details.delta.dx < 0) {
                    setState(() {
                      print(details.delta.dx);
                      isCollapsed = !isCollapsed;
                    });
                  }
                },
                child: Center(child: _widgetOptions.elementAt(_selectedIndex))),
            bottomNavigationBar: BottomNavigationBar(
              unselectedItemColor: Color(0xFFC4C4C4),
              iconSize: 27,
              showUnselectedLabels: false,
              selectedLabelStyle: TextStyle(fontSize: 0),
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(icon: Icon(Icons.bookmark), title: Text('')),
                BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('')),
                BottomNavigationBarItem(icon: Icon(Icons.person), title: Text('')),
                BottomNavigationBarItem(icon: Icon(Icons.settings), title: Text('')),
              ],
              currentIndex: _selectedIndex,
              selectedItemColor: Color(0xFF0157A5),
              onTap: _onItemTapped,
            ),
          ),
        ),
      ),
    );
  }
}
