import 'package:flutter/material.dart';
import 'package:kazpost/db/database_helper.dart';
import 'package:kazpost/pages/certificates/certificates.dart';
import 'package:kazpost/pages/profile/views/first_view.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    read.avatar();
    read.name();
    read.position();
    read.type();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                color: Color(0xFF0157A5),
                height: 150,
              ),
              Container(
                margin: EdgeInsets.only(top: 75),
                alignment: Alignment.center,
                child: Stack(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(360),
                        border: Border.all(color: Colors.white, width: 5),
                      ),
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(databaseHelper.avatar),
                        radius: 60,
                      ),
                    ),
                    Positioned(
                      top: 10,
                      left: 95,
                      child: Container(
                        width: 25,
                        height: 25,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 3),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              AppBar(
                elevation: 0,
                backgroundColor: Colors.transparent,
                title: Text(
                  "Назад",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                titleSpacing: -3,
                iconTheme: IconThemeData(
                  color: Colors.white,
                ),
              ),
            ],
          ),
          SizedBox(height: 30),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 15,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Color(0xFF0157A5).withOpacity(0.5),
                  blurRadius: 20.0,
                  spreadRadius: -5,
                  offset: Offset(
                    0.0,
                    20.0,
                  ),
                ),
              ],
            ),
            child: Column(
              children: <Widget>[
                Text(
                  "${databaseHelper.name}",
                  style: TextStyle(
                    color: Color(0xFF0157A5),
                    fontFamily: "Montserrat",
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  '${databaseHelper.position}',
                  style: TextStyle(
                    color: Color(0xFFC4C4C4),
                    fontSize: 13,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "${databaseHelper.type}",
                  style: TextStyle(fontSize: 24),
                ),
                SizedBox(height: 10),
                FlatButton(
                  padding: EdgeInsets.symmetric(
                    horizontal: 25,
                    vertical: 15,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  color: Color(0xFF4CAF50),
                  textColor: Colors.white,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Certificates(),
                      ),
                    );
                  },
                  child: Text(
                    "Достижения",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Flexible(
            child: DefaultTabController(
              length: 3,
              child: Scaffold(
                resizeToAvoidBottomPadding: false,
                backgroundColor: Colors.transparent,
                appBar: TabBar(
                  tabs: <Widget>[
                    Tab(
                      text: "Статистика",
                    ),
                    Tab(
                      text: "Данные",
                    ),
                    Tab(
                      text: "Поддержка",
                    ),
                  ],
                ),
                body: TabBarView(
                  children: <Widget>[
                    FirstViewProfile(),
                    Icon(Icons.access_alarm),
                    Icon(Icons.accessibility_new),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
