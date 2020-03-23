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
              //
              //
              //
              //
              //
              //
              //
              //
              //
              // Здесь крч заебашишь
            ),
          ),
        );
      },
    );
  }
}
