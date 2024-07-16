import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultPage extends StatelessWidget {
  // final int correctCount;
  // final int? incorrectCount;
  final int? score;
  const ResultPage({
    super.key,
    required this.score,
    // required this.correctCount,
    //required this.incorrectCount
  });

  @override
  Widget build(BuildContext context) {
    // access color theme
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    return Stack(children: [
      Scaffold(
        backgroundColor: colorScheme.primaryContainer, // use of color theme eg
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          toolbarHeight: MediaQuery.sizeOf(context).height / 3,
          backgroundColor: colorScheme.secondaryContainer,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10.0),
              bottomRight: Radius.circular(10.0),
            ),
          ),
          title: Stack(
            children: [
              const CircleAvatar(
                radius: 70,
                backgroundColor: Colors.white12,
              ),
              const Positioned(
                top: 10,
                left: 10,
                child: CircleAvatar(
                  radius: 60,
                  backgroundColor: Colors.white24,
                ),
              ),
              Positioned(
                top: 20.0,
                left: 20.0,
                child: CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.white30,
                  child: Text(
                    // "Your Score: $correctCount",

                    'Score : '
                    '$score',
                    style: TextStyle(fontSize: 18.0),
                    textAlign: TextAlign.center,
                  ),
                ),
              )
            ],
          ),
        ),

        body: Padding(
          padding: const EdgeInsets.only(top: 40.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                      onTap: () {
                        context.go('/'); // navigation using GoRouter
                      },
                      child: bText('Home', Icons.home_filled, Colors.blue)),
                  GestureDetector(
                      onTap: () {},
                      child: bText(
                          'Generate PDF', Icons.picture_as_pdf, Colors.teal)),
                  GestureDetector(
                      onTap: () {},
                      child: bText('Setting', Icons.settings, Colors.orange)),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                      onTap: () {},
                      child: bText('Share Score', Icons.share, Colors.purple)),
                  GestureDetector(
                      onTap: () {},
                      child: bText(
                          'Rate Us', Icons.star_rate_rounded, Colors.green)),
                  GestureDetector(
                      onTap: () {},
                      child: bText(
                          'Profile', Icons.person_pin, Colors.limeAccent)),
                ],
              ),
              const Text(
                'Developed by ParaDox Corp',
                style: TextStyle(color: Colors.orange),
              ),
            ],
          ),
        ),
      ),
      Positioned(
        top: 250.0,
        right: 20.0,
        left: 20.0,
        child: Card(
          child: Container(
            height: MediaQuery.sizeOf(context).height / 5,
            width: MediaQuery.sizeOf(context).width,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: colorScheme.surface),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    textCard('Time', "12:02"),
                    textCard('Completed', "20")
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    textCard('Correct', "15"),
                    textCard('Wrong', "10")
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    ]);
  }
}

Widget bText(bText1, IconData bIcons1, Color color1) {
  return Column(
    children: [
      Icon(
        bIcons1,
        size: 38.0,
        color: color1,
      ),
      Text(
        bText1,
        style: GoogleFonts.roboto(color: Colors.white, fontSize: 14.0),
      ),
    ],
  );
}

Widget textCard(cText1, cText2) {
  return Column(
    children: [
      Text(
        cText1,
        style: GoogleFonts.roboto(color: Colors.black, fontSize: 14),
      ),
      Text(
        cText2,
        style: GoogleFonts.roboto(
            color: Colors.deepPurpleAccent,
            fontSize: 24,
            fontWeight: FontWeight.bold),
      ),
    ],
  );
}
