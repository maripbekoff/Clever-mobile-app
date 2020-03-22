import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kazpost/db/database_helper.dart';
import 'package:kazpost/pages/methodics/methodics.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:shimmer/shimmer.dart';
import 'package:kazpost/bloc/files_manager.dart';
import 'package:kazpost/bloc/connection.dart';
import 'package:kazpost/bloc/quiz.dart';
import 'package:kazpost/models/files.dart';
import 'package:kazpost/pages/quiz/quiz.dart';
import 'package:kazpost/pages/homepage/card.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

textStyle() {
  return TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20);
}

titleStyle() {
  return TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 24);
}

class _HomePageState extends State<HomePage> {
  String urlPDFPath = '';
  
  QuizBloc quizBloc = QuizBloc();

  FilesModel filesModel = FilesModel();
  FilesManager filesManager = FilesManager();

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: LiquidPullToRefresh(
        onRefresh: () async {
          setState(() {
            quizBloc.getQuizzes.asBroadcastStream();
            filesModel.getFiles();
            Connection.checkConnection();
          });
        },
        showChildOpacityTransition: false,
        child: ListView(
          shrinkWrap: true,
          physics: BouncingScrollPhysics(),
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 10,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  network
                      ? StreamBuilder(
                          stream: quizBloc.getQuizzes.asBroadcastStream(),
                          builder: (context, snapshot) {
                            if (snapshot.hasError) {
                              return Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 10,
                                      spreadRadius: 0,
                                      color: Color.fromRGBO(0, 0, 0, 0.1),
                                    ),
                                  ],
                                ),
                                child: RaisedButton(
                                  onPressed: () {
                                    final snackBar = SnackBar(
                                      content: Text('Произошла ошибка на стороне сервера'),
                                      action: SnackBarAction(
                                        label: 'Ок',
                                        onPressed: () {},
                                      ),
                                    );
                                    Scaffold.of(context).showSnackBar(snackBar);
                                  },
                                  padding: EdgeInsets.symmetric(
                                    vertical: 18.5,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Text('Не удалось загрузить последний тест'),
                                ),
                              );
                            } else {
                              switch (snapshot.connectionState) {
                                case ConnectionState.none:
                                case ConnectionState.waiting:
                                case ConnectionState.active:
                                  return Container(
                                    padding: const EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: [
                                        BoxShadow(
                                          blurRadius: 10,
                                          spreadRadius: 0,
                                          color: Color.fromRGBO(0, 0, 0, 0.1),
                                        ),
                                      ],
                                    ),
                                    child: Shimmer.fromColors(
                                      baseColor: Colors.red[800],
                                      highlightColor: Colors.red[600],
                                      period: Duration(milliseconds: 800),
                                      child: RaisedButton(
                                        onPressed: () {},
                                        padding: EdgeInsets.symmetric(
                                          vertical: 18.5,
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                        child: Text('Загрузка..'),
                                      ),
                                    ),
                                  );
                                  break;
                                case ConnectionState.done:
                                  if (quizzes["quizzes"].length == 0) {
                                    return Offstage();
                                  } else {
                                    return Container(
                                      padding: const EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                        boxShadow: [
                                          BoxShadow(
                                            blurRadius: 10,
                                            spreadRadius: 0,
                                            color: Color.fromRGBO(0, 0, 0, 0.1),
                                          ),
                                        ],
                                      ),
                                      child: RaisedButton(
                                        onPressed: () => Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => QuizPage(
                                              i: quizzes["quizzes"].length,
                                            ),
                                          ),
                                        ),
                                        padding: EdgeInsets.symmetric(
                                          vertical: 8,
                                        ),
                                        color: Color(0xFFC83F3F),
                                        textColor: Colors.white,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: <Widget>[
                                            Icon(
                                              Icons.error_outline,
                                              size: 40,
                                            ),
                                            SizedBox(
                                              width: MediaQuery.of(context).size.width / 35,
                                            ),
                                            Text(
                                              '${quizzes["quizzes"][quizzes["quizzes"].length - 1]["title"]}',
                                              style: TextStyle(fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  }
                                  break;
                              }
                            }
                            return null;
                          },
                        )
                      : Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 10,
                                spreadRadius: 0,
                                color: Color.fromRGBO(0, 0, 0, 0.1),
                              ),
                            ],
                          ),
                          child: RaisedButton(
                            onPressed: () {
                              _showDialog();
                            },
                            padding: EdgeInsets.symmetric(
                              vertical: 18.5,
                            ),
                            color: Color(0xFFC83F3F),
                            textColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              'Нет подключения к сети',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                  ListTile(
                    enabled: network,
                    title: Text('Все курсы >'),
                    onTap: () {},
                  ),
                  GridView.count(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    mainAxisSpacing: MediaQuery.of(context).size.height * 0.025,
                    crossAxisSpacing: MediaQuery.of(context).size.width * 0.05,
                    childAspectRatio: 1.25,
                    crossAxisCount: 2,
                    children: <Widget>[
                      CardWidget(
                          "Мониторинг", 0xFF61D4B3, Icons.camera, 'assets/img/home_page/green.png'),
                      CardWidget("Учёт и аудит", 0xFFFDD365, Icons.category,
                          'assets/img/home_page/yellow.png'),
                      CardWidget("Call-менеджмент", 0xFFFB8D62, Icons.people,
                          'assets/img/home_page/orange.png'),
                      CardWidget("Инфо - системы", 0xFFC27AA8, Icons.settings,
                          'assets/img/home_page/purple.png'),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 35,
                  ),
                ],
              ),
            ),
            network
                ? StreamBuilder(
                    stream: filesManager.filesList.asBroadcastStream(),
                    builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
                      if (snapshot.hasError) {
                        return Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            child: Card(
                              elevation: 3,
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Text(
                                  'Произошла ошибка при скачивании файла',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.deepOrange,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      } else {
                        switch (snapshot.connectionState) {
                          case ConnectionState.none:
                          case ConnectionState.waiting:
                          case ConnectionState.active:
                            return Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                padding: const EdgeInsets.all(24),
                                decoration: BoxDecoration(
                                  color: Color(0xFFF5F5F5),
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(50),
                                    topRight: Radius.circular(50),
                                  ),
                                ),
                                child: Column(
                                  children: <Widget>[
                                    Row(
                                      children: <Widget>[
                                        Container(
                                          width: MediaQuery.of(context).size.width / 35,
                                          height: MediaQuery.of(context).size.width / 35,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(360),
                                            color: Color(0xFFFFE500),
                                          ),
                                        ),
                                        SizedBox(
                                          width: MediaQuery.of(context).size.width / 35,
                                        ),
                                        Text(
                                          'Загруженные материалы',
                                          style: TextStyle(
                                            color: Color(0xFFC6C6C6),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Shimmer.fromColors(
                                      baseColor: Colors.grey[300],
                                      highlightColor: Colors.grey[100],
                                      period: Duration(milliseconds: 900),
                                      child: ListView.builder(
                                        itemCount: 2,
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        physics: BouncingScrollPhysics(),
                                        itemBuilder: (BuildContext context, int index) {
                                          return Container(
                                            margin: const EdgeInsets.only(bottom: 20),
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(10),
                                              color: Color(0xFFE9E9E9),
                                            ),
                                            child: ListTile(
                                              onTap: () {},
                                              leading: null,
                                              title: Text(''),
                                              enabled: network,
                                              trailing: Container(
                                                padding: const EdgeInsets.symmetric(
                                                  vertical: 8,
                                                  horizontal: 56.5,
                                                ),
                                                decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius: BorderRadius.circular(15)),
                                                child: Text(''),
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          case ConnectionState.done:
                            return Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                padding: const EdgeInsets.all(24),
                                decoration: BoxDecoration(
                                  color: Color(0xFFF5F5F5),
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(50),
                                    topRight: Radius.circular(50),
                                  ),
                                ),
                                child: Column(
                                  children: <Widget>[
                                    Row(
                                      children: <Widget>[
                                        Container(
                                          width: MediaQuery.of(context).size.width / 35,
                                          height: MediaQuery.of(context).size.width / 35,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(360),
                                            color: Color(0xFFFDD365),
                                          ),
                                        ),
                                        SizedBox(
                                          width: MediaQuery.of(context).size.width / 35,
                                        ),
                                        Text(
                                          'Загруженные материалы',
                                          style: TextStyle(
                                            color: Color(0xFFC6C6C6),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    ListView.builder(
                                      itemCount: files["latestFiles"].length,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      physics: BouncingScrollPhysics(),
                                      itemBuilder: (BuildContext context, int index) {
                                        return Container(
                                          margin: const EdgeInsets.only(bottom: 20),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10),
                                            color: Color(0xFFE9E9E9),
                                          ),
                                          child: ListTile(
                                            enabled: network,
                                            onTap: () async {
                                              await filesModel
                                                  .downloadFile(files["latestFiles"][index]["href"],
                                                      files["latestFiles"][index]["filename"])
                                                  .then((f) {
                                                setState(() {
                                                  print(urlPDFPath);
                                                  urlPDFPath = f.path;
                                                });
                                              });
                                              Navigator.push(
                                                context,
                                                CupertinoPageRoute(
                                                  builder: (context) =>
                                                      MethodicsPage(href: urlPDFPath),
                                                ),
                                              );
                                            },
                                            leading: Container(
                                              padding: const EdgeInsets.all(10),
                                              decoration: BoxDecoration(
                                                color: Color(0xFF7A92C2),
                                                borderRadius: BorderRadius.circular(15),
                                              ),
                                              child: Image.asset(
                                                'assets/img/home_page/files/pdf.png',
                                                width: 20,
                                              ),
                                            ),
                                            title: Text(
                                              '${files["latestFiles"][index]["title"]}',
                                              style: TextStyle(
                                                color: Color(0xFF939393),
                                              ),
                                            ),
                                            trailing: Text(
                                              '${files["latestFiles"][index]["type"]}',
                                              style: TextStyle(
                                                color: Color(0xFF7A92C2),
                                                fontSize: 13,
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            );
                        }
                      }
                      return null;
                    },
                  )
                : SizedBox(),
          ],
        ),
      ),
    );
  }

  _showDialog() {
    final snackBar = SnackBar(
      content: Text('Пожалуйста проверьте своё интернет соединение.'),
      action: SnackBarAction(
        label: 'Ок',
        onPressed: () {},
      ),
    );
    Scaffold.of(context).showSnackBar(snackBar);
  }
}

class CustomSearchDelegate extends SearchDelegate {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    if (query.length < 10000) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Text(
              "В разработке",
            ),
          )
        ],
      );
    }
    return null;
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Column();
  }
}
