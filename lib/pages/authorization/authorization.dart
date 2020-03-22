import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kazpost/bloc/connection.dart';
import 'package:kazpost/models/authorization.dart';

class AuthPage extends StatefulWidget {
  AuthPage({Key key}) : super(key: key);

  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  Authorization authorization = Authorization();

  String msgStatus = '';

  final TextEditingController _emailController = new TextEditingController();
  final TextEditingController _passwordController = new TextEditingController();

  final _formKey = GlobalKey<FormState>();

  _onPressed() {
    setState(
      () {
        if (_emailController.text.trim().toLowerCase().isNotEmpty &&
            _passwordController.text.trim().isNotEmpty) {
          authorization
              .login(_emailController.text.trim().toLowerCase(), _passwordController.text.trim())
              .whenComplete(() {
            if (network) {
              if (authorization.status) {
                _showDialog('Не правильный логин или пароль.');
              } else {
                Navigator.pushReplacementNamed(context, '/mainpage');
              }
            } else {
              _showDialog('Отсутсвует подключение к сети.');
            }
          });
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.height;

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        floatingActionButton: SizedBox(
          width: 70,
          height: 70,
          child: FloatingActionButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Icon(
              Icons.arrow_forward,
              size: 35,
            ),
            foregroundColor: Colors.white,
            backgroundColor: Color(0xFF5A5A5A),
            onPressed: () {
              if (_formKey.currentState.validate()) {
                _onPressed();
              }
            },
          ),
        ),
        body: SafeArea(
          child: Stack(
            children: <Widget>[
              Positioned(
                top: 0,
                child: Container(
                  height: size,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: ExactAssetImage(
                        'assets/img/authorization/authorization_background.png',
                      ),
                    ),
                  ),
                ),
              ),
              ListView(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'Войти\nв систему',
                        style: TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Stack(
                        children: <Widget>[
                          Container(
                            padding: const EdgeInsets.fromLTRB(20, 40, 20, 20),
                            margin: EdgeInsets.only(top: size / 3.9),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  spreadRadius: 0,
                                  blurRadius: 10,
                                  color: Colors.black.withOpacity(0.2),
                                ),
                              ],
                            ),
                            child: Form(
                              key: _formKey,
                              child: Column(
                                children: [
                                  TextFormField(
                                    controller: _emailController,
                                    keyboardType: TextInputType.text,
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return 'Пожалуйста введите логин';
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                      hintText: 'Ваш логин',
                                      filled: true,
                                      fillColor: Color(0xFFF0F0F0),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(15),
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          style: BorderStyle.none,
                                        ),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(15),
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          style: BorderStyle.none,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  TextFormField(
                                    controller: _passwordController,
                                    keyboardType: TextInputType.text,
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return 'Пожалуйста введите пароль';
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                      hintText: 'Введите пароль',
                                      filled: true,
                                      fillColor: Color(0xFFF0F0F0),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(15),
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          style: BorderStyle.none,
                                        ),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(15),
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          style: BorderStyle.none,
                                        ),
                                      ),
                                    ),
                                    obscureText: true,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 0),
                              child: Image.asset(
                                'assets/img/authorization/welcome_girl.png',
                                height: 229,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showDialog(String error) {
    final snackBar = SnackBar(
      content: Text('$error'),
      action: SnackBarAction(
        label: 'Ок',
        onPressed: () {},
      ),
    );
    Scaffold.of(context).showSnackBar(snackBar);
  }
}
