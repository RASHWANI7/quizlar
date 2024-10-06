import 'package:flutter/material.dart';
import 'package:quizlar/Quastion.dart';
import 'package:quizlar/quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

Quiz_Brain quiz_brain = Quiz_Brain();

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Quiz Challange',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
              color: Colors.white,
            ),
          ),
          backgroundColor: Colors.black38,
        ),
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
  List<Icon> ScoreKepper = [];

  // to check if the quastion are finished
  void checkanswer(bool userpickedanswer) {
    bool check_answer = quiz_brain.getquastionanswer();
    setState(() {
      if (quiz_brain.isFinished() == true) {
        Alert(
          context: context,
          title: 'Finished!',
          desc: 'You\'ve reached the end of the quiz.',
        ).show();
        quiz_brain.reset();

        ScoreKepper = [];
      } else {
        //to check if the answer which the user picked is equal to the correct answer
        if (check_answer == userpickedanswer) {
          ScoreKepper.add(
            Icon(
              Icons.check,
              color: Colors.green,
            ),
          );
        } else {
          ScoreKepper.add(
            Icon(
              Icons.close,
              color: Colors.red,
            ),
          );
        }
      }
      quiz_brain.nextquastion();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        //the quastions
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quiz_brain.getquastiontext(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),

        //the true button
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: MaterialButton(
              color: Colors.green,
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                checkanswer(true);
              },
            ),
          ),
        ),

        //the false button
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: MaterialButton(
              color: Colors.red,
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                checkanswer(false);
                setState(() {
                  quiz_brain.nextquastion();
                });
              },
            ),
          ),
        ),
        Row(
          children: ScoreKepper,
        )
      ],
    );
  }
}

/*
question1: 'You can lead a cow down stairs but not up stairs.', false,
question2: 'Approximately one quarter of human bones are in the feet.', true,
question3: 'A slug\'s blood is green.', true,
*/
