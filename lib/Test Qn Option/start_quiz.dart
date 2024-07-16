import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quizapp/Test%20Qn%20Option/progress_indicator.dart';
import 'package:http/http.dart' as http;
// import 'package:quizapp/StartQuizPage/progress_indicator.dart';

class TestQnOption extends StatefulWidget {
  const TestQnOption({super.key});

  @override
  State<TestQnOption> createState() => _StartQuizState();
}

class _StartQuizState extends State<TestQnOption> {
  String formatQuestion(String question) {
    return question
        .replaceAll('&quot;', '"')
        .replaceAll('&#039;', "'")
        .replaceAll('&amp;', '&')
        .replaceAll('&lt;', '<')
        .replaceAll('&gt;', '>');
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: colorScheme.secondaryContainer,
        // leading: IconButton(
        //   icon: Icon(Icons.arrow_back),
        //   onPressed: () {
        //     // navigate to home page using defaul name : '/'
        //     context.go('/');
        //   },
        // ),
        toolbarHeight: MediaQuery.sizeOf(context).height / 6,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(10.0),
            bottomRight: Radius.circular(10.0),
          ),
        ),
        // Circular stack for displaying progress and time
        title: const Stack(
          children: [
            CircleAvatar(
                radius: 40,
                backgroundColor: Colors.white12,
                child: ProgressIndicatorBar()),
            Positioned(
              top: 10,
              left: 10,
              child: CircleAvatar(
                radius: 30,
                backgroundColor: Colors.white24,
              ),
            ),
            Positioned(
              top: 20.0,
              left: 20.0,
              child: CircleAvatar(
                radius: 20,
                backgroundColor: Colors.white30,
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const QuestionScreen(),
              optionList(context, 'options'),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 50.0,
                  width: MediaQuery.sizeOf(context).width,
                  child: ElevatedButton(
                    style: const ButtonStyle(
                      backgroundColor:
                          WidgetStatePropertyAll(Color(0xFF0F5257)),
                    ),
                    onPressed: () {
                      int correctCount = 11;
                      context.go(
                        '/resultPage',
                        extra: {
                          'correctCount': correctCount,
                        },
                      );
                    },
                    child: const Text(
                      'Next',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

// widget for displaying options
  Widget optionList(BuildContext context, option) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height / 3,
      width: MediaQuery.sizeOf(context).width,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 4,
          itemBuilder: (context, index) {
            return Card(
              color: Colors.amber,
              child: ListTile(
                title: Text(option),
              ),
            );
          },
        ),
      ),
    );
  }
}

/// widgets for displaying quiz quistions

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key});

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: MediaQuery.sizeOf(context).height / 7,
        width: MediaQuery.sizeOf(context).width,
        // field for qn to show
        child: Container(
          color: colorScheme.secondary,
        ),
      ),
    );
  }
}
