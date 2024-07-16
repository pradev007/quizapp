import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class QnOption extends StatefulWidget {
  const QnOption({super.key});

  @override
  State<QnOption> createState() => _QnOptionState();
}

class _QnOptionState extends State<QnOption> {
  int _selectedIndex = -1;
  late int _randomIndex;
  int number = 1;
  int score = 0;
  late List<String> _options = [];
  late String _questionText = '';
  bool _showCorrectAnswer = false;
  String _correctAnswer = '';

  @override
  void initState() {
    super.initState();
    _loadQuestion();
  }

  void _loadQuestion() {
    FirebaseFirestore.instance.collection('questions').get().then((snapshot) {
      if (snapshot.docs.isNotEmpty) {
        _randomIndex = Random().nextInt(snapshot.docs.length);
        var document = snapshot.docs[_randomIndex];

        List<String> options = [
          document['correct'],
          document['incorrect1'],
          document['incorrect2'],
          document['incorrect3']
        ]..shuffle();

        setState(() {
          _options = options;
          _questionText = document['qn'];
          _correctAnswer = document['correct'];
          _showCorrectAnswer = false;
          _selectedIndex = -1;
        });
      }
    });
  }

  void _nextQuestion() {
    if (_selectedIndex == -1) {
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: const Text('Error'),
          content: const Text('No Option selected'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Ok'),
            ),
          ],
        ),
      );
    } else {
      if (number == 10) {
        context.go('/resultPage', extra: score);
      } else {
        setState(() {
          number++;
        });
        _loadQuestion();
      }
    }
  }

  void _checkAnswer() {
    if (_selectedIndex == -1) {
      showDialog(
          context: context,
          builder: (_) => AlertDialog(
                title: Text('Error'),
                content: Text('Plz select option'),
                actions: [
                  TextButton(
                      onPressed: Navigator.of(context).pop, child: Text('Ok'))
                ],
              ));
    } else {
      setState(() {
        _showCorrectAnswer = true;
        if (_options[_selectedIndex] == _correctAnswer) {
          // final snackBar1 = SnackBar(
          //   content: Text('Correct Ans'),
          //   backgroundColor: Colors.greenAccent[400],
          //   duration: Duration(seconds: 1),
          // );
          // ScaffoldMessenger.of(context).showSnackBar(snackBar1);
          score++;
        } else {
          // final snackBar2 = SnackBar(
          //   content: Text('Incorrect Ans'),
          //   backgroundColor: Color(0xFFE62300),
          //   duration: Duration(seconds: 1),
          // );
          // ScaffoldMessenger.of(context).showSnackBar(snackBar2);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Question'),
        centerTitle: true,
      ),
      body: _questionText.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Question $number/10',
                        style: const TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        'Score: $score',
                        style: const TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 5,
                  width: MediaQuery.of(context).size.width,
                  child: Card(
                    color: Colors.amber,
                    child: Center(
                      child: Text(
                        _questionText,
                        style: const TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.4,
                    width: MediaQuery.of(context).size.width,
                    child: ListView.builder(
                      itemCount: _options.length,
                      itemBuilder: (context, index) {
                        Color tileColor;
                        if (_showCorrectAnswer) {
                          if (_options[index] == _correctAnswer) {
                            tileColor = const Color(0xFF03F10B);
                          } else if (_selectedIndex == index) {
                            tileColor = Colors.red[700]!;
                          } else {
                            tileColor = Colors.blueGrey;
                          }
                        } else {
                          tileColor = _selectedIndex == index
                              ? Colors.green[700]!
                              : Colors.blueGrey;
                        }

                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListTile(
                            tileColor: tileColor,
                            title: Text(_options[index]),
                            onTap: !_showCorrectAnswer
                                ? () {
                                    setState(() {
                                      _selectedIndex = index;
                                    });
                                  }
                                : null,
                          ),
                        );
                      },
                    ),
                  ),
                ),
                SizedBox(height: 50.0),
                Container(
                  height: MediaQuery.of(context).size.height / 6,
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed:
                        _showCorrectAnswer ? _nextQuestion : _checkAnswer,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.redAccent,
                    ),
                    child: Center(
                      child: Text(
                        _showCorrectAnswer ? "Next" : "Check Answer",
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
