import 'package:flutter/material.dart';
import 'package:kazpost/db/database_helper.dart';

class NewCoursePageWidget extends StatelessWidget {
  const NewCoursePageWidget(this.index);
  final int index;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        FlatButton(
          shape: CircleBorder(),
          onPressed: () {},
          child: Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: <Color>[Color(0xFF0157A5), Color(0xFF77B9F7)],
              ),
              boxShadow: [
                BoxShadow(
                    color: Color.fromRGBO(1, 87, 165, 0.5), blurRadius: 20, offset: Offset(0, 10)),
              ],
            ),
            child: Icon(Icons.collections_bookmark, size: 30, color: Colors.white),
          ),
        ),
        SizedBox(height: 10),
        Text('${course["branches"][index]["title"]}'),
      ],
    );
  }
}
