import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blue,
        appBar: AppBar(
          title: const Text('Ask Me Anything'),
          backgroundColor: Colors.blue[900],
        ),
        body: const Magic8BallPage(),
      ),
    ),
  );
}

class Magic8BallPage extends StatefulWidget {
  const Magic8BallPage({Key? key}) : super(key: key);

  @override
  State<Magic8BallPage> createState() => _Magic8BallPageState();
}

class _Magic8BallPageState extends State<Magic8BallPage> {
  int _ballNumber = 1;

  void changeBall() {
    setState(() {
      _ballNumber = Random().nextInt(5) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextButton(
              style: ButtonStyle(
                padding: MaterialStateProperty.all(
                  const EdgeInsets.all(16.0),
                ),
              ),
              child: Image.asset('images/ball$_ballNumber.png'),
              onPressed: () {
                changeBall();
                print(_ballNumber);
              },
            ),
          ),
        ],
      ),
    );
  }
}
