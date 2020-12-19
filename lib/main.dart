import 'package:flutter/material.dart';
import 'question.dart';

void main() {
  runApp(Quizzler());
}

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scoreKeeper = [];

  // List<String> questions = [
  //   'You can lead a cow down stairs but not up stairs.',
  //   'Approximately one quarter of human bones are in the feet.',
  //   'A slug\'s blood is green.',
  // ];

  // List<bool> answers = [false, true, true];

  List<Question> quiz = [
    Question('You can lead a cow down stairs but not up stairs.', false),
    Question('Approximately one quarter of human bones are in the feet.', true),
    Question('A slug\'s blood is green.', true),
  ];

  // List temp;

  // void createListClass() {
  //   for (int x = 0; x < answers.length; x++) {
  //     temp[x] = new Question(questions[x], answers[x]);
  //     quiz.add(temp[x]);
  //   }
  // }

  int questionNumber = 0;
  int nextQuestion() {
    questionNumber++;
    return questionNumber;
  }

  String displayQuestion() {
    String current = quiz[questionNumber].questionText;
    return current;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        AppBar(
          backgroundColor: Colors.black,
          centerTitle: true,
          shape: Border(
            bottom: BorderSide(
                color: Colors.teal, style: BorderStyle.solid, width: 5),
          ),
          title: Text(
            'Quizzler',
            style: TextStyle(
              color: Colors.teal.shade100,
              fontWeight: FontWeight.bold,
              fontSize: 30,
              fontStyle: FontStyle.italic,
            ),
          ),
        ),
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                displayQuestion(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              textColor: Colors.white,
              color: Colors.green,
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                bool correctAnswer = quiz[questionNumber].questionAnswer;
                if (correctAnswer == true) {
                  print('Right Answer ✔💯');
                } else {
                  print('Wrong Answer ✖🤢');
                }

                setState(() {
                  scoreKeeper.add(
                    Icon(
                      Icons.check,
                      color: Colors.green,
                    ),
                  );
                });
                setState(() {
                  nextQuestion();
                });
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              color: Colors.red,
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                bool correctAnswer = quiz[questionNumber].questionAnswer;
                if (correctAnswer == true) {
                  print('Wrong Answer ✖🤢');
                } else {
                  print('Right Answer ✔💯');
                }

                setState(() {
                  scoreKeeper.add(
                    Icon(
                      Icons.close,
                      color: Colors.red,
                    ),
                  );
                });
                setState(() {
                  nextQuestion();
                });
              },
            ),
          ),
        ),
        Row(
          children: scoreKeeper,
        ),
      ],
    );
  }
}

/*
question1: 'You can lead a cow down stairs but not up stairs.', false,
question2: 'Approximately one quarter of human bones are in the feet.', true,
question3: 'A slug\'s blood is green.', true,
*/
