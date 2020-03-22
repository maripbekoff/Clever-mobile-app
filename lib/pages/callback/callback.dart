import 'package:flutter/material.dart';
import 'package:kazpost/bloc/connection.dart';
import 'package:kazpost/models/send_message.dart';

class CallBackPage extends StatefulWidget {
  CallBackPage({Key key}) : super(key: key);

  @override
  _CallBackPageState createState() => _CallBackPageState();
}

class _CallBackPageState extends State<CallBackPage> {
  Send send = Send();

  TextEditingController _titleController = new TextEditingController();
  TextEditingController _reviewController = new TextEditingController();

  _onPressed() async {
    await Connection.checkConnection();
    await send.callback('${_titleController.text}', '${_reviewController.text}');
    if (!network) Scaffold.of(context).showSnackBar(snackBar);
  }

  final snackBar = SnackBar(content: Text('Пожалуйста проверьте подключение к сети'));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Есть пожелания?\nОтправьте нам письмо.',
                  style: TextStyle(
                      fontFamily: 'Montserrat', fontSize: 26, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                Form(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      TextField(
                        controller: _titleController,
                        decoration: InputDecoration(
                          hintText: 'Тема обращения...',
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(
                              color: Color(0xFF0157A5),
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(
                              color: Color(0xFF0157A5),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                      TextField(
                        maxLines: 5,
                        controller: _reviewController,
                        decoration: InputDecoration(
                          hintText: 'Ваше сообщение...',
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(
                              color: Color(0xFF0157A5),
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(
                              color: Color(0xFF0157A5),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                      RaisedButton(
                        padding: EdgeInsets.symmetric(
                          vertical: 2,
                        ),
                        onPressed: () {
                          _onPressed();
                        },
                        textColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Text('Отправить письмо'),
                        color: Color(0xFF0157A5),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
