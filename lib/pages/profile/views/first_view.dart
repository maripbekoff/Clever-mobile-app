import 'package:flutter/material.dart';

class FirstViewProfile extends StatelessWidget {
  const FirstViewProfile({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      itemCount: 3,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Мониторинг",
                        style: TextStyle(
                          fontSize: 13,
                          color: Color(0xFF0157A5),
                        ),
                      ),
                      Text(
                        "Отлично",
                        style: TextStyle(
                          fontSize: 13,
                          color: Color(0xFF4CAF50),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    "Курсы по мониторингу",
                    style: TextStyle(fontSize: 17),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Ваш результат:",
                        style: TextStyle(fontSize: 17),
                      ),
                      Text(
                        "8/10",
                        style: TextStyle(fontSize: 26),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
