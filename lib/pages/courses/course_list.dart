import 'package:flutter/material.dart';
import 'package:kazpost/db/database_helper.dart';
import 'package:kazpost/pages/courses/course_list_widget.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:kazpost/bloc/course.dart';

String icon1 = "./assets/img/eye.png";

class CourseList extends StatefulWidget {
  CourseList({Key key}) : super(key: key);

  @override
  _CourseListState createState() => _CourseListState();
}

class _CourseListState extends State<CourseList> {
  CourseBloc courseBloc = CourseBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Курсы",
          style: TextStyle(
            fontFamily: "Montserrat",
            fontWeight: FontWeight.bold,
            fontSize: 32,
          ),
        ),
        titleSpacing: -3,
        elevation: 0,
      ),
      body: LiquidPullToRefresh(
        onRefresh: () async {
          setState(() {
            courseBloc.getCourseList.asBroadcastStream();
          });
        },
        child: ListView(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(20),
              child: StreamBuilder<Object>(
                stream: courseBloc.getCourseList.asBroadcastStream(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Text('Произошла ошибка при получении курсов');
                  } else {
                    switch (snapshot.connectionState) {
                      case ConnectionState.none:
                      case ConnectionState.waiting:
                      case ConnectionState.active:
                        return Text('Загрузка..');
                        break;
                      case ConnectionState.done:
                        return ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: courseList["courses"].length,
                          itemBuilder: (BuildContext context, index) {
                            return CourseListWidget(
                              "${courseList["courses"][index]["title"]}",
                              icon1,
                              "${courseList["courses"][index]["description"]}",
                              index,
                            );
                          },
                        );
                        break;
                    }
                  }
                  return Offstage();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
