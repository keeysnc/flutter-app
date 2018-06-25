import 'package:flutter/material.dart';
import 'dart:developer';
import '../utils/question.dart';
import '../utils/quiz.dart';
import '../ui/answer_btn.dart';
import '../ui/question_text.dart';
import '../ui/correct_wrong_overlay.dart';
import './score_page.dart';

class QuizPage extends StatefulWidget{
  @override
  State createState() => new QuizPageState();
}

class QuizPageState extends State<QuizPage> {

  Question currentQuestion;
  Quiz quiz = new Quiz([
    new Question( "Elon Musk is human", false),
    new Question( "Pizza is healthy", false),
    new Question( "Flutter is awesome", true)
    
  ]);

String questionText;
int questionNumber;
bool isCorrect;
bool overlayVisible = false;

void handleAnswer( bool answer ){
  isCorrect = (currentQuestion.answer == answer);
  quiz.answer(isCorrect);
  this.setState((){
  overlayVisible = true;
  });
}

@override
  void initState() {
    super.initState();
    currentQuestion = quiz.nextQuestion;
    questionText = currentQuestion.question;
    questionNumber = quiz.questionNumber;
  }
  @override
  Widget build( BuildContext context ){
    return new Stack(
      fit: StackFit.expand,
      children: <Widget>[
        new Column(
          children: <Widget>[
            new AnswerBtn(true , () => handleAnswer(true) ),
            new QuestionText( questionText, questionNumber),
            new AnswerBtn(false , () => handleAnswer(false) ),
          ],
        ), 
        overlayVisible  == true ? new CorrectWrongOverlay(
          isCorrect,
          () {
            if(quiz.length == questionNumber){
              Navigator.of(context).pushAndRemoveUntil(new MaterialPageRoute( builder: (BuildContext context) => new ScorePage(quiz.score, quiz.length)), (Route route) => route == null);
              return;
            }
            currentQuestion = quiz.nextQuestion;
            this.setState((){
              overlayVisible = false;
              questionText = currentQuestion.question;
              questionNumber = quiz.questionNumber;
            });
          }
        ) : new Container()
      ],
    );
  }
}