// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print, unused_local_variable

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

import '../widgets/sudoku_board.dart';

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

Map<String, int> count = {
  "1": 0,
  "2": 0,
  "3": 0,
  "4": 0,
  "5": 0,
  "6": 0,
  "7": 0,
  "8": 0,
  "9": 0,
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

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool check() {
    // for (var i = 0; i < 9; i++) {
    //   for (var j = 0; j < 9; j++) {
    //     if (sudokublock[i][j] == "0") {
    //       AwesomeDialog(
    //         context: context, showCloseIcon: true,
    //         dialogType: DialogType.INFO_REVERSED,
    //         animType: AnimType.BOTTOMSLIDE, //awesome_dialog: ^2.1.1
    //         title: 'Please fill the empty cells',
    //         // desc: 'Dialog description here.............',
    //         // btnCancelOnPress: () {},
    //         btnOkText: 'OK',
    //         btnOkColor: Theme.of(context).primaryColor,
    //         btnOkOnPress: () {},
    //       ).show();

    //       return false;
    //     }
    //   }
    // }
    // bool ans = true;
    for (var i = 0; i < 9; i++) {
      for (var j = 0; j < 9; j++) {
        // ans = ans & stringTobool[sudokublock[i][j]]!;
        count[sudokublock[i][j]] = count[sudokublock[i][j]]! + 1;
        if (count[sudokublock[i][j]]! > 1 && sudokublock[i][j] != "0") {
          // ans = false;

          AwesomeDialog(
            context: context, showCloseIcon: true,
            dialogType: DialogType.ERROR,
            animType: AnimType.BOTTOMSLIDE, //awesome_dialog: ^2.1.1
            title: 'Please check Again $i $j',
            // desc: 'Dialog description here.............',
            // btnCancelOnPress: () {},
            btnOkText: 'ok',
            btnOkColor: Theme.of(context).primaryColor,
            btnOkOnPress: () {
              setState(() {
                
              });
            },
          ).show();

          return false;
        } else {
          AwesomeDialog(
            context: context, showCloseIcon: true,
            dialogType: DialogType.INFO_REVERSED,
            animType: AnimType.BOTTOMSLIDE, //awesome_dialog: ^2.1.1
            title: 'No Worries',
            // desc: 'Dialog description here.............',
            // btnCancelOnPress: () {},
            btnOkText: 'ok',
            btnOkColor: Theme.of(context).primaryColor,
            btnOkOnPress: () {},
          ).show();

          return false;
        }
      }
      // sudokublock[i].c

    }

    return true;
  }

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
        child: Column(
          children: [
            SizedBox(
                height: mediaquery.height * 0.7,
                width: mediaquery.width,
                // child: SudokuBoard()),
                child: SudokuBoard()),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Text(
          'Submit',
          style: const TextStyle(),
        ),
        onPressed: () {
          FocusManager.instance.primaryFocus?.unfocus();
          check();
          // setState(() {});
        },
      ),
    );
  }
}
