import 'package:flutter/material.dart';

class Certificates extends StatefulWidget {
  Certificates({Key key}) : super(key: key);

  @override
  CertificatesState createState() => CertificatesState();
}

class CertificatesState extends State<Certificates> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(0),
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Достижения',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color(0xFFC57C62)),
                      child: Center(
                        child: Text(
                          '3',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Image(
                  image: AssetImage('assets/img/certificates.png'),
                ),
                Image(
                  image: AssetImage('assets/img/certificates.png'),
                ),
                Image(
                  image: AssetImage('assets/img/certificates.png'),
                ),
                Image(
                  image: AssetImage('assets/img/certificates.png'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
