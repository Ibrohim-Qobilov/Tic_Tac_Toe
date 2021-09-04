import 'dart:math';

import 'package:flutter/material.dart';

class TicTacToe extends StatefulWidget {
  @override
  _TicTacToeState createState() => _TicTacToeState();
}

class _TicTacToeState extends State<TicTacToe> {
  bool onTurn = true; // bitinchi o'yinchi o
  List<String> displayX0 = [
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
  ];

  var myTextStyle = TextStyle(
    color: Colors.white,
    fontSize: 30,
  );

  int xNatija = 0;
  int oNatija = 0;
  int filledBoxes = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Tik Tac Toe",
          style: TextStyle(fontSize: 30),
        ),
        backgroundColor: Colors.grey[800],
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "O'yinchi X",
                          style: myTextStyle,
                        ),
                        Text(
                          xNatija.toString(),
                          style: myTextStyle,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "O'yinchi O",
                          style: myTextStyle,
                        ),
                        Text(
                          oNatija.toString(),
                          style: myTextStyle,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: GridView.builder(
              itemCount: 9,
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    _tapped(index);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey.shade700,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        displayX0[index],
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: Container(),
          ),
        ],
      ),
    );
  }

  void _tapped(index) {
    setState(
      () {
        if (onTurn && displayX0[index] == '') {
          displayX0[index] = 'o';
          filledBoxes += 1;
        } else if (!onTurn && displayX0[index] == '') {
          displayX0[index] = 'x';
          filledBoxes += 1;
        }
        onTurn = !onTurn;
        _checkWinner();
      },
    );
  }

  void _checkWinner() {
    // row birinchi
    if (displayX0[0] == displayX0[1] &&
        displayX0[0] == displayX0[2] &&
        displayX0[0] != '') {
      _checkWinDialog(displayX0[0]);
    }
    // row ikkinchi
    if (displayX0[3] == displayX0[4] &&
        displayX0[3] == displayX0[5] &&
        displayX0[3] != '') {
      _checkWinDialog(displayX0[3]);
    }
    // row uchunchi
    if (displayX0[6] == displayX0[7] &&
        displayX0[6] == displayX0[8] &&
        displayX0[6] != '') {
      _checkWinDialog(displayX0[6]);
    }
    // colunm 1
    if (displayX0[0] == displayX0[3] &&
        displayX0[0] == displayX0[6] &&
        displayX0[0] != '') {
      _checkWinDialog(displayX0[0]);
    }
    // colunm 2
    if (displayX0[1] == displayX0[4] &&
        displayX0[1] == displayX0[7] &&
        displayX0[1] != '') {
      _checkWinDialog(displayX0[1]);
    }
    // colunm 3
    if (displayX0[2] == displayX0[5] &&
        displayX0[2] == displayX0[8] &&
        displayX0[2] != '') {
      _checkWinDialog(displayX0[2]);
    }
    // check diagonal
    if (displayX0[6] == displayX0[4] &&
        displayX0[6] == displayX0[7] &&
        displayX0[6] != '') {
      _checkWinDialog(displayX0[6]);
    }
    // check diagonal
    if (displayX0[0] == displayX0[4] &&
        displayX0[0] == displayX0[8] &&
        displayX0[0] != '') {
      _checkWinDialog(displayX0[0]);
    } else if (filledBoxes == 9) {
      _showDrawDialog();
    }
  }

  void _checkWinDialog(winner) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          actions: [
            TextButton(
              onPressed: () {
                _clear();
                Navigator.of(context).pop();
              },
              child: Text("Qayta o'ynash"),
            ),
          ],
          title: Text(winner + " g'olib"),
        );
      },
    );

    if (winner == 'o') {
      oNatija += 1;
    } else if (winner == 'x') {
      xNatija += 1;
    }
  }

  void _showDrawDialog() {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          actions: [
            TextButton(
              onPressed: () {
                _clear();
                Navigator.of(context).pop();
              },
              child: Text("Qayta o'ynash"),
            ),
          ],
          title: Text("Kuchlar teng bo'ldi"),
        );
      },
    );
  }

  void _clear() {
    for (int i = 0; i < 9; i++) {
      setState(
        () {
          displayX0[i] = '';
        },
      );
      filledBoxes = 0;
    }
  }
}
