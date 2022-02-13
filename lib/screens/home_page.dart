// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print, unused_local_variable

import 'package:flutter/material.dart';

import '../widgets/sudoku_board.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaquery = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sudoku Generator- By :- Satyapsr'),
        actions: [
          IconButton(
            icon: const Icon(Icons.ad_units_sharp),
            tooltip: 'search',
            onPressed: () {
              // for (var i = 0; i < 9; i++) {
              //   for (var j = 0; j < 9; j++) {
              //     // block[i][j] = TextEditingController();
              //   }
              // }
              // open model bottom sheet
              showModalBottomSheet(
                context: context,
                builder: (context) => Center(
                  child: SizedBox(
                    height: mediaquery.height * 0.3,
                    child: ListView.builder(
                      itemCount: sudokublock.length,
                      itemBuilder: (ctx, index) => Text(
                        sudokublock[index].toString(),
                        style: const TextStyle(),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: SizedBox(
            height: mediaquery.height * 0.7,
            width: mediaquery.width ,
            // child: SudokuBoard()),
            child: SudokuBoard()),
      ),

      //floatingActionButton: FloatingActionButton(onPressed: (){},),
    );
  }
}

bool check() {
  for (var i = 0; i < 9; i++) {
    for (var j = 0; j < 9; j++) {
      if (sudokublock[i][j] == "0") {
        return false;
      }
    }
  }
  Map<String, int> stringToInt = {
    "1": 1,
    "2": 2,
    "3": 3,
    "4": 4,
    "5": 5,
    "6": 6,
    "7": 7,
    "8": 8,
    "9": 9,
    "0": 0,
  };
  Map<String, bool> stringTobool = {
    "1": true,
    "2": true,
    "3": true,
    "4": true,
    "5": true,
    "6": true,
    "7": true,
    "8": true,
    "9": true,
    "0": false,
  };
  bool ans = true;
  for (var i = 0; i < 9; i++) {
    for (var j = 0; j < 9; j++) {
      ans=ans & stringTobool[sudokublock[i][j]];

    }
  }

  return true;
}
