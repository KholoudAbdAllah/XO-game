// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names

import 'package:flutter/material.dart';

import 'board_botton.dart';

// ignore: must_be_immutable
class GameBoardScreen extends StatefulWidget {
  static const String routeName = 'game_board';

  const GameBoardScreen(
      {super.key, required String player2Name, required String player1Name});

  @override
  State<GameBoardScreen> createState() => _GameBoardScreenState();
}

class _GameBoardScreenState extends State<GameBoardScreen> {
  List<String> boardState = [
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
  int Player1Score = 0;
  int Player2Score = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('XO GAME'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Player1 (X)',
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '$Player1Score',
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Player2 (O)',
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '$Player2Score',
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                BoardButton(
                    text: boardState[0],
                    index: 0,
                    onButtonClick: onButtonClick),
                BoardButton(
                    text: boardState[1],
                    index: 1,
                    onButtonClick: onButtonClick),
                BoardButton(
                    text: boardState[2],
                    index: 2,
                    onButtonClick: onButtonClick),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                BoardButton(
                    text: boardState[3],
                    index: 3,
                    onButtonClick: onButtonClick),
                BoardButton(
                    text: boardState[4],
                    index: 4,
                    onButtonClick: onButtonClick),
                BoardButton(
                    text: boardState[5],
                    index: 5,
                    onButtonClick: onButtonClick),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                BoardButton(
                    text: boardState[6],
                    index: 6,
                    onButtonClick: onButtonClick),
                BoardButton(
                    text: boardState[7],
                    index: 7,
                    onButtonClick: onButtonClick),
                BoardButton(
                    text: boardState[8],
                    index: 8,
                    onButtonClick: onButtonClick),
              ],
            ),
          ),
        ],
      ),
    );
  }

/*
0 => x
1 => o
2 => x
3 => o
4 => x
5 => o
6 => x
7 => o
8 => x

*/
  int counter = 0;

  void onButtonClick(int index) {
    if (boardState[index].isNotEmpty) {
      return;
    }
    if (counter % 2 == 0) {
      ////x
      boardState[index] = 'X';
    } else {
      ////O
      boardState[index] = 'O';
    }
    counter++;
    if (checkWinner('X')) {
      Player1Score += 5;
      clearBoard();
    } else if (checkWinner('O')) {
      Player2Score += 5;
      clearBoard();
    } else if (counter == 9) {
      clearBoard();
    }
    setState(() {});
  }

  // i need to see who is winner x or o insted of make two fun
  // i make this fun and give it symoble to know me
  //if x winner give me result of x .. and so on
  bool checkWinner(String symbol) {
    // rows
    if (boardState[0] == symbol &&
        boardState[1] == symbol &&
        boardState[2] == symbol) {
      return true;
    }
    if (boardState[0] == symbol &&
        boardState[1] == symbol &&
        boardState[2] == symbol) {
      return true;
    }
    if (boardState[0] == symbol &&
        boardState[1] == symbol &&
        boardState[2] == symbol) {
      return true;
    }
    /*
    for(int i=0; i<9; i+=3){
      if(boardstate[i]==symbol&&
      boardstate[i+1]==symbol
      boardstate[i+2]==symbol){
        return true;
      }
    }
    */
    //coulmns
    if (boardState[0] == symbol &&
        boardState[3] == symbol &&
        boardState[6] == symbol) {
      return true;
    }
    if (boardState[1] == symbol &&
        boardState[4] == symbol &&
        boardState[7] == symbol) {
      return true;
    }
    if (boardState[2] == symbol &&
        boardState[5] == symbol &&
        boardState[8] == symbol) {
      return true;
    }
    /*
    for(int i=0; i<3; i++){
      if(boardstate[i]==symbol&&
      boardstate[i+3]==symbol
      boardstate[i+6]==symbol){
        return true;
      }
    }
    */

    //cross
    if (boardState[0] == symbol &&
        boardState[4] == symbol &&
        boardState[8] == symbol) {
      return true;
    }
    if (boardState[2] == symbol &&
        boardState[4] == symbol &&
        boardState[6] == symbol) {
      return true;
    }
    return false;
  }

  void clearBoard() {
    boardState = [
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
    counter = 0;
    setState(() {});
  }
}
