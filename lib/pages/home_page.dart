import 'package:croc_top/pages/event_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/logo_app.png',
            height: 100,
          ),
          const Text(
            'Hello World !',
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              fontFamily: 'Raleway',
            ),
          ),
          const Text(
            'This is my first app',
            style: TextStyle(
              fontSize: 20,
              fontFamily: 'Raleway',
            ),
            textAlign: TextAlign.center,
          ),
          const Padding(padding: EdgeInsets.all(25)),
        ],
      ),
    );
  }
}
