import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

String result = '';

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        actions: [
          Image(
            image: AssetImage('assets/img/tic.png'),
            color: Colors.blue,
          ),
          SizedBox(
            width: 50,
          )
        ],
      ),
      body: Container(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Text(
                      'Player 1',
                      style: TextStyle(color: Colors.blue, fontSize: 30),
                    ),
                    Text(
                      ' ${pl1}',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      'Player 2',
                      style: TextStyle(color: Colors.red, fontSize: 30),
                    ),
                    Text(
                      ' ${pl2}',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 40,
            ),
            Expanded(
              flex: 6,
              child: GridView.builder(
                  itemCount: 9,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        check(index);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.black,
                          border: Border.all(color: Color(0xff1a6682)),
                        ),
                        child: Center(
                            child: (OX[index] == 'X')
                                ? Text(
                                    '${OX[index]}',
                                    style: TextStyle(
                                        color: Color(0xffe70f12), fontSize: 80),
                                  )
                                : Text(
                                    '${OX[index]}',
                                    style: TextStyle(
                                        color: Color(0xff198eda), fontSize: 80),
                                  )),
                      ),
                    );
                  }),
            ),
            // SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  onPressed: () {
                    clear();
                  },
                  child: Image(
                    image: AssetImage(
                      'assets/img/r2.png',
                    ),
                    height: 100,
                    width: 100,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      clear();
                      pl1 = 0;
                      pl2 = 0;
                    });
                  },
                  child: Container(
                    height: 75,
                    width: 190,
                    decoration: BoxDecoration(
                      color: Colors.white10,
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                    child: Center(
                      child: Text(
                        'ReStart',
                        style: TextStyle(color: Colors.blue, fontSize: 35),
                      ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 30,
            )
          ],
        ),
      ),
    );
  }

  List<String> OX = [
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

  bool O = true;
  int box2 = 0;
  int box = 0;

  void check(int index) {
    setState(() {
      if (O && OX[index] == '') {
        OX[index] = 'O';
        box++;
      } else if (!O && OX[index] == '') {
        OX[index] = 'X';
        box++;
      }
      O = !O;
      checkWin();
    });
    print(box);
    // print(box2);
  }

  void checkWin() {
    // first row
    if (OX[0] == OX[1] && OX[0] == OX[2] && OX[0] != '') {
      setState(() {
        if (OX[0] == 'O') {
          result = 'Player O Wins!';
        } else {
          result = 'Player X Wins!';
        }
      });
    }
    // second row
    if (OX[3] == OX[4] && OX[3] == OX[5] && OX[3] != '') {
      setState(() {
        if (OX[3] == 'O') {
          result = 'Player O Wins!';
        } else {
          result = 'Player X Wins!';
        }
      });
    }
    // third row
    if (OX[6] == OX[7] && OX[6] == OX[8] && OX[7] != '') {
      setState(() {
        if (OX[7] == 'O') {
          result = 'Player O Wins!';
        } else {
          result = 'Player X Wins!';
        }
      });
    }
    // first Column
    if (OX[0] == OX[3] && OX[0] == OX[6] && OX[6] != '') {
      setState(() {
        if (OX[6] == 'O') {
          result = 'Player O Wins!';
        } else {
          result = 'Player X Wins!';
        }
      });
    }
    // second column
    if (OX[1] == OX[4] && OX[1] == OX[7] && OX[4] != '') {
      setState(() {
        if (OX[4] == 'O') {
          result = 'Player O Wins!';
        } else {
          result = 'Player X Wins!';
        }
      });
    }
    // third column
    if (OX[2] == OX[5] && OX[2] == OX[8] && OX[2] != '') {
      setState(() {
        if (OX[5] == 'O') {
          result = 'Player O Wins!';
        } else {
          result = 'Player X Wins!';
        }
      });
    }
    // diagonl
    if (OX[0] == OX[4] && OX[0] == OX[8] && OX[8] != '') {
      setState(() {
        if (OX[4] == 'O') {
          result = 'Player O Wins!';
        } else {
          result = 'Player X Wins!';
        }
      });
    }
    // anti
    if (OX[2] == OX[4] && OX[2] == OX[6] && OX[2] != '') {
      setState(() {
        if (OX[6] == 'O') {
          result = 'Player O Wins!';
        } else {
          result = 'Player X Wins!';
        }
      });
    }

    if (box == 9 && result != 'Player O Wins!' && result != 'Player X Wins!') {
      setState(() {
        result = 'Nobody wins!';
      });
      // box2 =0;
      // Result();
      clear();
    }

    Result();
  }

  void Result() {
    if (result == 'Player O Wins!' ||
        result == 'Player X Wins!' ||
        result == 'Nobody wins!') {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            backgroundColor: Colors.black45,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 30,
                ),
                Text(
                  '${result}',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 30,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
          );
        },
      );
      if (result == 'Player O Wins!') {
        setState(() {
          pl1++;
        });
      } else if (result == 'Player X Wins!') {
        pl2++;
      }
    }
    // clear();
  }

  void clear() {
    setState(() {
      for (int i = 0; i < 9; i++) {
        OX[i] = '';
      }
      result = '';
      box = 0;
    });
  }
}

int pl1 = 0;
int pl2 = 0;
