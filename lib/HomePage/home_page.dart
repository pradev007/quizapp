import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizapp/Background%20Music/background_music.dart';
import 'package:quizapp/pdf/generate_pdf.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with WidgetsBindingObserver {
  bool isPlaying = false;
  final GeneratePdf generatePdf = GeneratePdf();
  final BackgroundMusic backgroundMusic = BackgroundMusic();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    backgroundMusic.stopMusic();
    
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    backgroundMusic.stopMusic();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused) {
      backgroundMusic.stopMusic();
    } else if (state == AppLifecycleState.resumed) {
      backgroundMusic.stopMusic();
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        toolbarHeight: MediaQuery.sizeOf(context).height / 4,
        backgroundColor: colorScheme.secondaryContainer,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(10.0),
            bottomRight: Radius.circular(10.0),
          ),
        ),
        title: Column(
          children: [
            Image.asset(
              'assets/images/quizlogo.png',
              height: 100.0,
              fit: BoxFit.contain,
            ),
            const Text(
              "Quizz",
              style: TextStyle(
                  color: Colors.orange,
                  letterSpacing: 2,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  // navigation using GoRouter
                  // context.go('/quizPage');
                  context.go('/qnoptionPage');
                },
                child: bText(
                    'Start Quiz', Icons.not_started_outlined, Colors.blue),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  // context.push('/fetchPdfPage');
                  generatePdf.generatePdf(context);
                },
                child: bText('Generate PDF', Icons.picture_as_pdf, Colors.teal),
              ),
              GestureDetector(
                onTap: () {
                  context.push('/aboutUsPage');
                },
                child: bText(
                    'About Us', Icons.diversity_2_rounded, Colors.blueAccent),
              ),
              GestureDetector(
                onTap: () {
                  context.push('/settingPage');
                },
                child: bText('Setting', Icons.settings, Colors.pink),
              ),
            ],
          ),
          const Text(
            'Developed by ParaDox Corp',
            style: TextStyle(color: Colors.orange),
          ),
        ],
      ),
    );
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

// Widget textCard(cText1, cText2) {
//   return Column(
//     children: [
//       Text(
//         cText1,
//         style: GoogleFonts.roboto(color: Colors.black, fontSize: 14),
//       ),
//       Text(
//         cText2,
//         style: GoogleFonts.roboto(
//             color: Colors.deepPurpleAccent,
//             fontSize: 24,
//             fontWeight: FontWeight.bold),
//       ),
//     ],
//   );
// }
