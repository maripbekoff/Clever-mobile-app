import 'package:flutter/material.dart';

class CoursePageWidget extends StatelessWidget {
  final String title;
  final String desc;
  const CoursePageWidget(this.title, this.desc);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      hoverColor: Colors.transparent,
      onPressed: () {},
      child: Stack(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: 140,
                width: 160,
                foregroundDecoration: BoxDecoration(
                  color: Colors.black54,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10.0,
                      spreadRadius: 2.0,
                      offset: Offset(
                        10.0,
                        5.0,
                      ),
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: ExactAssetImage('./assets/img/courses.jpeg')),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 0,
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 10,
              ),
              height: 70,
              width: 160,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Text(
                    title,
                    style: TextStyle(
                      color: Color(0xFF0157A5),
                    ),
                  ),
                  Text(
                    desc,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            right: 15,
            top: 55,
            child: Container(
              width: 35,
              height: 35,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 2.0,
                    spreadRadius: 1.0,
                    offset: Offset(
                      0.0,
                      2.0,
                    ),
                  ),
                ],
              ),
              child: Icon(
                Icons.arrow_right,
                color: Color(0xFF0157A5),
                size: 35,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
