import 'package:flutter/material.dart';

class FirstView extends StatelessWidget {
  const FirstView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: <Widget>[
            // 1 строка
            Flexible(
              child: Row(
                children: <Widget>[
                  Text(
                    "01",
                    style: TextStyle(
                      fontFamily: "Montserrat",
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      color: Colors.black,
                      thickness: 2,
                    ),
                  ),
                ],
              ),
            ),
            // 1 строка

            // 2 строка
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  VerticalDivider(
                    color: Color(0xFF8465B7),
                    thickness: 2,
                  ),
                  Flexible(
                    child: Text(
                      "Как войти в аккаунт?\n\nНеужели трудно зайти в аккаунт, ведь все так интуитивно понятно. Бесите уже. Вводите свои данные которые пришли вам на почту, и вбиваете в формочки и все",
                    ),
                  ),
                ],
              ),
            ),
            // 2 строка

            // 3 строка
            Flexible(
              child: Row(
                children: <Widget>[
                  Text(
                    "02",
                    style: TextStyle(
                      fontFamily: "Montserrat",
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      color: Colors.black,
                      thickness: 2,
                    ),
                  ),
                ],
              ),
            ),
            // 3 строка

            // 3 строка
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  VerticalDivider(
                    color: Color(0xFF8465B7),
                    thickness: 2,
                  ),
                  Flexible(
                    child: Text(
                      "Как войти в аккаунт?\n\nНеужели трудно зайти в аккаунт, ведь все так интуитивно понятно. Бесите уже. Вводите свои данные которые пришли вам на почту, и вбиваете в формочки и все",
                    ),
                  ),
                ],
              ),
            ),
            // 3 строка
          ],
        ),
      ),
    );
  }
}
