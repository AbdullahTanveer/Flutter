import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // sign
  List<String> sign = <String>['', '', '', '', '', '', '', '', ''];
  bool ohTurn = true;

  // default text style
  var textStyle = const TextStyle(fontSize: 30.0, color: Colors.white);

  // static var newFont = GoogleFonts.pressStart2p(
  //     textStyle: const TextStyle(color: Colors.black, letterSpacing: 3));
  static var newFontWhite = GoogleFonts.pressStart2p(
      textStyle: const TextStyle(
          color: Colors.white, letterSpacing: 3, fontSize: 15.0));

  // static var newFontWhite = GoogleFonts.pressStart2P(
  //     textStyle: const TextStyle(color: Colors.white, letterSpacing: 3));
  // static var newStyleBlack = GoogleFonts.pressStart2P(
  //     textStyle: const TextStyle(color: Colors.black, letterSpacing: 3));

  // scores
  int xScore = 0;
  int oScore = 0;

  // check if no one wins
  int filledBoxes = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Column(
        children: [
          const SizedBox(height: 30.0),
          Expanded(
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Player O", style: newFontWhite),
                    const SizedBox(height: 20.0),
                    Text(oScore.toString(), style: newFontWhite)
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Player X", style: newFontWhite),
                    const SizedBox(height: 20.0),
                    Text(xScore.toString(), style: newFontWhite)
                  ],
                ),
              ])),
          Expanded(
            flex: 4,
            child: GridView.builder(
                itemCount: 9,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3),
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      _onTap(index);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.shade700)),
                      child: Center(
                          child: Text(
                        sign[index],
                        style:
                            const TextStyle(fontSize: 30, color: Colors.white),
                      )),
                    ),
                  );
                }),
          ),
          Expanded(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Tic Tac Toe", style: newFontWhite),
              const SizedBox(height: 40.0),
              Text("@MrCharlie", style: newFontWhite)
            ],
          )),
        ],
      ),
    );
  }

  // onTap
  void _onTap(int index) {
    setState(() {
      if (ohTurn && sign[index] == '') {
        sign[index] = 'O';
        filledBoxes += 1;
      } else if (!ohTurn && sign[index] == '') {
        sign[index] = 'X';
        filledBoxes += 1;
      }

      // set turn
      ohTurn = !ohTurn;
      _checkWinner();
    });
  }

  // check winner
  void _checkWinner() {
    // check 1st row
    if (sign[0] == sign[1] && sign[0] == sign[2] && sign[0] != '') {
      _showWinDialog(sign[0]);
    }
    // check 2nd row
    else if (sign[3] == sign[4] && sign[3] == sign[5] && sign[3] != '') {
      _showWinDialog(sign[3]);
    }
    // check 3rd row
    else if (sign[6] == sign[7] && sign[6] == sign[8] && sign[6] != '') {
      _showWinDialog(sign[6]);
    }

    // check 1st column
    else if (sign[0] == sign[3] && sign[0] == sign[6] && sign[0] != '') {
      _showWinDialog(sign[0]);
    }
    // check 2nd column
    else if (sign[1] == sign[4] && sign[1] == sign[7] && sign[1] != '') {
      _showWinDialog(sign[1]);
    }
    // check 3rd column
    else if (sign[2] == sign[5] && sign[2] == sign[8] && sign[2] != '') {
      _showWinDialog(sign[2]);
    }

    // check diagonal
    else if (sign[0] == sign[4] && sign[0] == sign[8] && sign[0] != '') {
      _showWinDialog(sign[0]);
    }
    // check diagonal
    else if (sign[2] == sign[4] && sign[2] == sign[6] && sign[2] != '') {
      _showWinDialog(sign[2]);
    } else if (filledBoxes == 9) {
      _showDrawDialog();
    }
  }

  // show dialog message if no one wins
  void _showDrawDialog() {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Match Draw!!!"),
            actions: [
              TextButton(
                  onPressed: () {
                    _clearBoard();
                    Navigator.of(context).pop();
                  },
                  child: const Text("Play Again",
                      style: TextStyle(fontSize: 18.0)))
            ],
          );
        });
  }

  // show dialog message if a player wins
  void _showWinDialog(String winner) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(winner + " is Winner!!!"),
            actions: [
              TextButton(
                  onPressed: () {
                    _clearBoard();
                    Navigator.of(context).pop();
                  },
                  child: const Text("Play Again",
                      style: TextStyle(fontSize: 18.0)))
            ],
          );
        });

    if (winner == 'O') {
      oScore += 1;
    } else if (winner == 'X') {
      xScore += 1;
    }
  }

  void _clearBoard() {
    setState(() {
      for (int i = 0; i < 9; i++) {
        sign[i] = '';
      }
      filledBoxes = 0;
    });
  }
}
