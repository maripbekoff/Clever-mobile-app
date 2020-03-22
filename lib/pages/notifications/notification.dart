import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:kazpost/pages/tests/test_list.dart';

class NotificationPage extends StatefulWidget {
  NotificationPage({Key key}) : super(key: key);

  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 20,
        ),
        physics: BouncingScrollPhysics(),
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Уведомления',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Color(0xFF4CAF50)),
                    child: Center(
                      child: Text(
                        '2',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Card(
                color: Color(0xFF6858D6),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 15,
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 10,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(360),
                            ),
                            child: Image(
                              image: AssetImage('./assets/img/eye.png'),
                              height: 30,
                              width: 30,
                              fit: BoxFit.contain,
                              color: Color(0xFF6858D6),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Вы должны пройти тест\n',
                                style: TextStyle(color: Colors.white),
                              ),
                              Text(
                                'Хотим уведомить вас о том,\nчто теперь вам доступен\nновый курс',
                                style: TextStyle(color: Colors.white),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '1 мин назад',
                            style: TextStyle(color: Colors.white),
                          ),
                          OutlineButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => TestListPage(),
                                ),
                              );
                            },
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                            padding: EdgeInsets.symmetric(
                              horizontal: 30,
                            ),
                            borderSide: BorderSide(color: Colors.white),
                            child: Text(
                              'Начать',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Card(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 15,
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 10,
                            ),
                            decoration: BoxDecoration(
                              color: Color(0xFF6858D6),
                              borderRadius: BorderRadius.circular(360),
                            ),
                            child: Image(
                              image: AssetImage('./assets/img/eye.png'),
                              height: 30,
                              width: 30,
                              fit: BoxFit.contain,
                              color: Colors.white,
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Вы должны пройти тест\n',
                                style: TextStyle(color: Colors.black),
                              ),
                              Text(
                                'Хотим уведомить вас о том,\nчто теперь вам доступен\nновый курс',
                                style: TextStyle(color: Colors.black),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '1 мин назад',
                            style: TextStyle(color: Colors.black26),
                          ),
                          OutlineButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => TestListPage()));
                            },
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                            padding: EdgeInsets.symmetric(
                              horizontal: 30,
                            ),
                            borderSide: BorderSide(color: Color(0xFF6858D6)),
                            child: Text(
                              'Начать',
                              style: TextStyle(color: Color(0xFF6858D6)),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
