import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:kazpost/bloc/quiz.dart';
import 'package:kazpost/db/database_helper.dart';
import 'package:kazpost/pages/quiz/quiz_end.dart';

class QuizPage extends StatefulWidget {
  QuizPage({Key key, @required this.i}) : super(key: key);

  final int i;

  @override
  _QuizPageState createState() => _QuizPageState();
}

int questionNumber = 0;
int score = 0;

class _QuizPageState extends State<QuizPage> {
  QuizBloc quizBloc = QuizBloc();

  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: quizBloc.getQuiz.asBroadcastStream(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: Column(
              children: <Widget>[
                CachedNetworkImage(
                  imageUrl:
                      'https://im0-tub-kz.yandex.net/i?id=35c83046d574550de0724299b2ddd189&n=13',
                ),
                Text(
                  'Нет подключения к сети..',
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
          );
        } else {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
            case ConnectionState.active:
              return Center(
                child: Scaffold(
                  backgroundColor: Colors.white,
                  body: Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
              );
            case ConnectionState.done:
              return Quiz(widget.i);
          }
        }
        return null;
      },
    );
  }
}

class Quiz extends StatefulWidget {
  final int i;
  Quiz(this.i);

  @override
  QuizState createState() => QuizState();
}

class QuizState extends State<Quiz> {
  QuizBloc quizBloc = QuizBloc();

  updateQuestion() {
    setState(() {
      if (questionNumber == quiz["questions"].length - 1) {
        if (score >= quiz["questions"].length / 2) {
          Navigator.pushReplacement(
            context,
            new MaterialPageRoute(
              builder: (context) => Summary(
                0xFF0157A5,
                0xFF77B9F7,
                "ОТЛИЧНО!",
                "Успехов!",
                Icons.beenhere,
                widget.i,
              ),
            ),
          );
        } else {
          Navigator.pushReplacement(
            context,
            new MaterialPageRoute(
              builder: (context) => Summary(
                0xFFB93D35,
                0xFFFF7043,
                "ПЛОХО!",
                "Обучайтесь лучше",
                Icons.warning,
                widget.i,
              ),
            ),
          );
        }
        print('последний вопрос: $questionNumber');
      } else {
        print('обновлен: $questionNumber');
        questionNumber++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        physics: BouncingScrollPhysics(),
        padding: const EdgeInsets.all(40),
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        children: <Widget>[
          Column(
            children: <Widget>[
              RichText(
                text: TextSpan(
                  style: TextStyle(color: Colors.black),
                  children: [
                    TextSpan(
                      text: 'Вопрос ${questionNumber + 1}/',
                      style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: '${quiz["questions"].length}',
                      style: TextStyle(fontSize: 24),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Divider(height: 2, thickness: 2),
              SizedBox(height: 20),
              Text(
                '${quiz["questions"]["$questionNumber"]["question"]}?',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 30),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xFF0157A5)),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: quiz["questions"]["$questionNumber"]["answers"].length,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context, index) {
                    return Column(
                      children: <Widget>[
                        Divider(
                          color: Color(0xFF0157A5),
                          height: 2,
                          thickness: 2,
                        ),
                        ListTile(
                          onTap: () {
                            if (quiz["questions"]["$questionNumber"]["true"].indexOf(index) != -1) {
                              print("Правильный ответ");
                              score++;
                              print(score);
                            } else {
                              print("Не правильно");
                            }
                            updateQuestion();
                          },
                          leading: Image.asset(
                            'assets/img/radioButton.png',
                            height: 20,
                          ),
                          title: Text(
                            '${quiz["questions"]["$questionNumber"]["answers"][index]}',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
