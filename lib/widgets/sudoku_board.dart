// // ignore_for_file: prefer_const_constructors, must_be_immutable

// import 'package:flutter/material.dart';
// // import 'package:flutter/services.dart';

// // import '../models/variables.dart';

// List<String> sudokublock = [
//   "00000000",
//   "00000000",
//   "00000000",
//   "00000000",
//   "00000000",
//   "00000000",
//   "00000000",
//   "00000000",
//   "00000009",
// ];
// List<TextEditingController> controller = [
//   for (int i = 0; i < 81; i++) TextEditingController()
// ];

// class SudokuBoard extends StatelessWidget {
//   SudokuBoard({Key? key}) : super(key: key);
//   TextEditingController textEditingController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     var mediaquery = MediaQuery.of(context).size;
//     return Container(
//       color: Colors.black,
//       child: GridView.builder(
//         itemCount: 9,
//         itemBuilder: (ctx, index1) => Padding(
//           padding: const EdgeInsets.all(2.0),
//           child: Container(
//             color: Colors.amber,
//             child: GridView.builder(
//               itemCount: 9,
//               itemBuilder: (ctx, index2) => Padding(
//                 padding: const EdgeInsets.all(1.0),
//                 child: sudokuBlock(mediaquery, index1 + 1, index2 + 1),
//               ),
//               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 3,
//                 childAspectRatio: 2 / 2,
//                 // crossAxisSpacing: 10,
//                 // mainAxisSpacing: 10
//               ),
//             ),
//           ),
//         ),
//         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 3,
//           childAspectRatio: 2 / 2,
//           // crossAxisSpacing: 10,
//           // mainAxisSpacing: 10
//         ),
//       ),
//     );
//   }

//   Widget sudokuBlock(Size mediaquery, int x, int y) {
//     return Padding(
//       padding: const EdgeInsets.all(1.0),
//       child: Container(
//         width: mediaquery.width * 0.1,
//         height: mediaquery.width * 0.1,
//         color: Color.fromARGB(255, 7, 189, 67),
//         child: TextFormField(
//           // inputFormatters: [
//           //   TextInputFormatter.withFunction((oldValue, newValue) => newValue.length <= 1 ? newValue : oldValue)
//           // ],
//           // initialValue: sudokublock[x - 1].substring(y - 1, y) ?? "",
//           controller: controller[(x - 1) * 9 + (y - 1)],
//           maxLength: 1,
//           keyboardType: TextInputType.number,
//           decoration: InputDecoration(
//             counterText: "",
//           ),
//           onChanged: (value) {
//             if (value.isEmpty) {
//               value = 0.toString();
//             }
//             sudokublock[x - 1] =
//                 sudokublock[x - 1].replaceRange(y - 1, y, value);
//             // print(
//             //     "+++++++++|||||||||||||||||||||||||||||||||||+++++++++++++++++");
//             // print("${sudokublock[x - 1][2]}");
//             // print(
//             // "+++++++++|||||||||||||||||||||||||||||||||||+++++++++++++++++");

//             // print(t);
//             // print("+++++++++|||||||||||||||||||||||||||||||||||+++++++++++++++++");
//             //     print("$t ");
//             // print("+++++++++|||||||||||||||||||||||||||||||||||+++++++++++++++++");
//           },
//           // onEditingComplete: () {
//           //   Array2d array = Array2d(
//           //       x: x - 1,
//           //       y: y - 1,
//           //       val: controller[(x - 1) * 9 + (y - 1)].text);
//           //   block.add(array);
//           //   // print(block);
//           // },
//           // maxLength: 1,
//           // initialValue: "${(x+y+1)%10}",
//           // initialValue: "${(x - 1) * 9 + (y - 1)}",
//         ),
//       ),
//     );
//   }
// }
// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

// import '../models/variables.dart';

List<String> sudokublock = [
  "400096208",
  "308100090",
  "961000700",
  "003405960",
  "600928074",
  "004700100",
  "009002001",
  "000831640",
  "000040027",
];

List<String> defaultSudoku = [
  "400096208",
  "308100090",
  "961000700",
  "003405960",
  "600928074",
  "004700100",
  "009002001",
  "000831640",
  "000040027",
];
List<TextEditingController> controller = [
  for (int i = 0; i < 81; i++) TextEditingController()
];

class SudokuBoard extends StatelessWidget {
  SudokuBoard({Key? key}) : super(key: key);
  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var mediaquery = MediaQuery.of(context).size;
    return Container(
      // height: mediaquery.height * 0.5,
      // color: Colors.black,
      child: GridView.builder(
        itemCount: 9,
        itemBuilder: (ctx, index1) => Padding(
          padding: EdgeInsets.fromLTRB(
            0.0,
            0.0,
            0.0,
            ((index1 + 1) % 3 == 0) ? 2.0 : 0.0,
          ),
          child: Container(
            color: Colors.amber,
            child: GridView.builder(
              itemCount: 9,
              itemBuilder: (ctx, index2) => Padding(
                padding: EdgeInsets.fromLTRB(
                  0.0,
                  0.0,
                  ((index2 + 1) % 3 == 0) ? 2.0 : 0.0,
                  0.0,
                ),
                child: sudokuBlock(mediaquery, index1 + 1, index2 + 1),
              ),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 9,
                childAspectRatio: 2 / 2,
                // crossAxisSpacing: 10,
                // mainAxisSpacing: 10
              ),
            ),
          ),
        ),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          childAspectRatio: 9 / 1,
          // crossAxisSpacing: 10,
          // mainAxisSpacing: 10
        ),
      ),
    );
  }

  Widget sudokuBlock(Size mediaquery, int x, int y) {
    return Padding(
      padding: const EdgeInsets.all(1.0),
      child: Container(
        width: mediaquery.width * 0.1,
        height: mediaquery.width * 0.1,
        color: Color.fromARGB(255, 7, 189, 67),
        child: TextFormField(
          readOnly: sudokublock[x - 1][y - 1] == "0" ? false : true,
          // inputFormatters: [
          //   TextInputFormatter.withFunction((oldValue, newValue) => newValue.length <= 1 ? newValue : oldValue)
          // ],
          initialValue:
              sudokublock[x - 1][y - 1] == "0" ? "" : sudokublock[x - 1][y - 1],
          // controller: controller[(x - 1) * 9 + (y - 1)],

          // maxLength: 1,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            counterText: "",
          ),
          onChanged: (value) {
            if (value.isEmpty) {
              value = 0.toString();
            }
            sudokublock[x - 1] =
                sudokublock[x - 1].replaceRange(y - 1, y, value);
            // print(
            //     "+++++++++|||||||||||||||||||||||||||||||||||+++++++++++++++++");
            // print("${sudokublock[x - 1][2]}");
            // print(
            // "+++++++++|||||||||||||||||||||||||||||||||||+++++++++++++++++");

            // print(t);
            // print("+++++++++|||||||||||||||||||||||||||||||||||+++++++++++++++++");
            //     print("$t ");
            // print("+++++++++|||||||||||||||||||||||||||||||||||+++++++++++++++++");
          },
          // onEditingComplete: () {
          //   Array2d array = Array2d(
          //       x: x - 1,
          //       y: y - 1,
          //       val: controller[(x - 1) * 9 + (y - 1)].text);
          //   block.add(array);
          //   // print(block);
          // },
          // maxLength: 1,
          // initialValue: "${(x+y+1)%10}",
          // initialValue: "${(x - 1) * 9 + (y - 1)}",
        ),
      ),
    );
  }
}
