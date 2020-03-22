import 'package:flutter/material.dart';
import 'package:kazpost/db/database_helper.dart';
import 'package:kazpost/pages/docs/docs.dart';

class TestPageBar extends StatefulWidget {
  TestPageBar({Key key}) : super(key: key);

  @override
  _TestPageBarState createState() => _TestPageBarState();
}

class _TestPageBarState extends State<TestPageBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                child: Container(
                  child: Text(
                    "Тесты и курсы",
                    style: TextStyle(
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.bold,
                      fontSize: 32,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text(
                    "Мои курсы",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  ),
                  subtitle: Text("12 курсов"),
                  trailing: IconButton(
                    color: Colors.black,
                    padding: EdgeInsets.zero,
                    icon: Icon(Icons.arrow_forward),
                    onPressed: () {},
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 10,
                        spreadRadius: -10,
                      ),
                    ],
                  ),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(15),
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => PdfView()));
                      },
                      child: Container(
                        padding: EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Image.asset(
                                  "./assets/img/eye.png",
                                  color: Color(0xFF0157A5),
                                  width: 25,
                                ),
                                SizedBox(width: 10),
                                Text(
                                  "Курсы по мониторингу",
                                  style: TextStyle(fontSize: 17),
                                ),
                              ],
                            ),
                            SizedBox(height: 20),
                            Text(
                              "Продолжить учиться",
                              style: TextStyle(
                                fontSize: 17,
                                color: Color(0xFF4CAF50),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 10,
                        spreadRadius: -10,
                      ),
                    ],
                  ),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(15),
                      onTap: () {
                        // databaseHelper.getFiles();
                      },
                      child: Container(
                        padding: EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Image.asset(
                                  "./assets/img/calculator.png",
                                  color: Color(0xFF0157A5),
                                  width: 25,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "Курсы по учету и аудиту",
                                  style: TextStyle(fontSize: 17),
                                ),
                              ],
                            ),
                            SizedBox(height: 20),
                            Text(
                              "Продолжить учиться",
                              style: TextStyle(
                                fontSize: 17,
                                color: Color(0xFF4CAF50),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.05),
              Container(
                decoration: BoxDecoration(color: Color(0xFF0157A5)),
                padding: EdgeInsets.symmetric(
                  horizontal: 25,
                  vertical: 10,
                ),
                child: Column(
                  children: <Widget>[
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      title: Text(
                        "Мои тесты",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                      trailing: IconButton(
                        color: Colors.white,
                        padding: EdgeInsets.zero,
                        icon: Icon(Icons.arrow_forward),
                        onPressed: () {},
                      ),
                    ),
                    SizedBox(height: 20),
                    Card(
                      margin: EdgeInsets.zero,
                      color: Color(0xFF0C3D69),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(15),
                        onTap: () {},
                        child: Container(
                          padding: EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              Text(
                                "Тест по 29 декабря",
                                style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                              Text(
                                "Пройти тест",
                                style: TextStyle(
                                  fontSize: 17,
                                  color: Color(0xFF4CAF50),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
