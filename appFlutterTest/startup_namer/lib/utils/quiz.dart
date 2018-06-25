import './question.dart';

class Quiz{

//_ makes variable private
  List<Question> _questions;
  int _currentQuestionIndex = -1;
  int _score = 0;

  //this.question refers back to the Question class
  Quiz( this._questions ){
    _questions.shuffle();
  }

  //returns the value questions from Question list
  List<Question> get questions => _questions;
  int get length => _questions.length;
  int get questionNumber => _currentQuestionIndex+1;
  int get score => _score;

  Question get nextQuestion{
    _currentQuestionIndex++;
    if( _currentQuestionIndex >= length ) return null;
    return _questions[_currentQuestionIndex];
  }

  void answer( bool isCorrect ){
    if( isCorrect ) _score++;
  }
}

