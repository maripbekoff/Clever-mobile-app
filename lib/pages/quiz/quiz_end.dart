import 'package:flutter/material.dart';
import 'package:kazpost/models/send_message.dart';
import 'package:kazpost/pages/main/main.dart';
import 'package:kazpost/pages/quiz/quiz.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class Summary extends StatelessWidget {
  Summary(this.colorOne, this.colorTwo, this.mark, this.sub, this.icon, this.i);
  final int colorOne; // первый цвет градиента
  final int colorTwo; // второй цвет градиента
  final String mark; // оценка: плохо или хорошо
  final String sub; // рекомандации под оценкой(которые серым текстом)
  final IconData icon; // иконка слево от оценки
  final int i; // индекс теста

  final TextEditingController _callbackController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    int rating;

    Send send = Send();

    void _showDialog() {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return WillPopScope(
            onWillPop: () async => null,
            child: new Dialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 25,
                  vertical: 25,
                ),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 2.5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Center(
                      child: RatingBar(
                        initialRating: 0,
                        minRating: 1,
                        direction: Axis.horizontal,
                        itemCount: 5,
                        itemBuilder: (context, _) => Icon(Icons.star, color: Colors.amber),
                        onRatingUpdate: (value) {
                          rating = value.toInt();
                          print(value);
                        },
                      ),
                    ),
                    Spacer(),
                    TextField(
                      controller: _callbackController,
                      keyboardType: TextInputType.multiline,
                      minLines: 5,
                      maxLines: 5,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              BorderSide(style: BorderStyle.solid, color: Colors.blueAccent),
                        ),
                        hintText: "Ваш отзыв...",
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                    Spacer(),
                    Center(
                      child: MaterialButton(
                        minWidth: MediaQuery.of(context).size.width / 4,
                        onPressed: () {
                          send.review(score, i, rating, _callbackController.text);
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (BuildContext context) => MainPage()));
                          questionNumber = 0;
                          score = 0;
                        },
                        color: Colors.green,
                        textColor: Colors.white,
                        child: Text("Продолжить"),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      );
    }

    return new WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: MediaQuery.of(context).size.height / 35),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Text(
                "Ваши\nрезультаты",
                style: TextStyle(
                  fontFamily: "Montserrat",
                  fontWeight: FontWeight.bold,
                  fontSize: 36,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 35),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: <Color>[Color(colorOne), Color(colorTwo)],
                      ),
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0, 5),
                          blurRadius: 5,
                          spreadRadius: 0,
                          color: Colors.black38,
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(height: MediaQuery.of(context).size.height / 35),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 28),
                          child: Text("ПРАВИЛЬНЫЕ ОТВЕТЫ",
                              style: TextStyle(
                                  fontFamily: "Montserrat", fontSize: 18, color: Colors.white)),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 28),
                          child: Text(
                            "$score",
                            style: TextStyle(
                                fontFamily: "Montserrat", fontSize: 144, color: Colors.white),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 28),
                          child: Text(
                            "баллов",
                            style: TextStyle(
                                fontFamily: "Montserrat", fontSize: 18, color: Colors.white),
                          ),
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height / 35),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(15),
                              bottomRight: Radius.circular(15),
                            ),
                          ),
                          child: ListTile(
                            contentPadding: const EdgeInsets.symmetric(horizontal: 22),
                            leading: Icon(icon, size: 45),
                            title: Text(
                              mark,
                              style: TextStyle(fontFamily: "Montserrat", fontSize: 18),
                            ),
                            subtitle: Text(
                              sub,
                              style: TextStyle(fontFamily: "Montserrat", fontSize: 18),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Spacer(),
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  center: const Alignment(-0.3, 0),
                  radius: 3,
                  colors: <Color>[Color(0xFF81D284), Color(0xFF4CAF50)],
                ),
              ),
              child: ListTile(
                onTap: () {
                  _showDialog(); // initialization of dialog menu
                },
                title: Center(
                  child: Text(
                    "ОЦЕНИТЕ НАС",
                    style: TextStyle(
                      fontFamily: "Montserrat",
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
