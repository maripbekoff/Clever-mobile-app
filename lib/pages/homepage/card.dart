import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  const CardWidget(this.title, this.color, this.icon, this.img);
  final String img;
  final String title;
  final IconData icon;
  final int color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(color: Color(color), borderRadius: BorderRadius.circular(15)),
        child: Stack(
          children: <Widget>[
            Positioned(top: 15, left: 15, child: Icon(icon, color: Colors.white, size: 25)),
            Positioned(right: 0, width: 80, child: Image.asset(img)),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  title,
                  style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
