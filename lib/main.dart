import 'package:flutter/material.dart';
import 'package:tiktactoe/Tik_Tac_Toe/main.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tic Tac Toe',
      theme: ThemeData(
        
        primarySwatch: Colors.blue,
      ),
      home: TicTacToe(),
    );
  }
}

