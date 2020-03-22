import 'package:flutter/material.dart';
import 'package:kazpost/bloc/course.dart';
import 'package:kazpost/db/database_helper.dart';
import 'package:kazpost/pages/courses/new_course_page_widget.dart';

String cid;

class NewCoursePage extends StatefulWidget {
  NewCoursePage({Key key}) : super(key: key);

  @override
  _NewCoursePageState createState() => _NewCoursePageState();
}

class _NewCoursePageState extends State<NewCoursePage> {
  CourseBloc courseBloc = CourseBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: <Widget>[
          StreamBuilder<Object>(
            stream: courseBloc.getCourse.asBroadcastStream(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Text('Ошибка при получении курса');
              } else {
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                  case ConnectionState.waiting:
                  case ConnectionState.active:
                    return Text('Загрузка');
                    break;
                  case ConnectionState.done:
                    return GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: course["branches"].length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                      itemBuilder: (BuildContext context, index) {
                        return NewCoursePageWidget(index);
                      },
                    );
                    break;
                }
              }
              return null;
            },
          ),
        ],
      ),
    );
  }
}
