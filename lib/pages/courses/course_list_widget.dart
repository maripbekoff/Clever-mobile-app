import 'package:flutter/material.dart';
import 'package:kazpost/db/database_helper.dart';
import 'new_course_page.dart';

class CourseListWidget extends StatelessWidget {
  final String title;
  final String icon;
  final String description;
  final int index;
  const CourseListWidget(this.title, this.icon, this.description, this.index);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(15),
        onTap: () async {
          cid = await courseList["courses"][index]["cid"];
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => NewCoursePage(),
            ),
          );
        },
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 40,
            vertical: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Image.asset(
                    icon,
                    color: Color(0xFF0157A5),
                    width: 25,
                  ),
                  SizedBox(width: 22),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          title,
                          style: TextStyle(fontSize: 17),
                        ),
                        Text(description)
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
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
    );
  }
}
