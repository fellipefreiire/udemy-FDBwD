import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(Xylophone());
}

class Xylophone extends StatelessWidget {
  Xylophone({Key? key}) : super(key: key);

  void playSound(int noteNumber) {
    final player = AudioCache();
    player.play('note$noteNumber.wav');
  }

  Expanded buildKey({required int noteNumber, required Color color}) {
    return Expanded(
      child: TextButton(
        onPressed: () {
          playSound(noteNumber);
        },
        child: Container(
          color: color,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                buildKey(noteNumber: 1, color: Colors.red),
                buildKey(noteNumber: 2, color: Colors.orange),
                buildKey(noteNumber: 3, color: Colors.yellow),
                buildKey(noteNumber: 4, color: Colors.green),
                buildKey(noteNumber: 5, color: Colors.teal),
                buildKey(noteNumber: 6, color: Colors.blue),
                buildKey(noteNumber: 7, color: Colors.purple),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
