import 'package:flutter/material.dart';
import 'package:quiz_app/first_screen.dart';
import 'package:quiz_app/questions_screen.dart';
import 'package:quiz_app/data/questions_text.dart';
import 'package:quiz_app/result_screen.dart';

class QuizApp extends StatefulWidget{
  const QuizApp({super.key});
  State<QuizApp> createState(){
    return _QuizAppState();
  }
}

class _QuizAppState extends State<QuizApp>{

  // final List<String> selectedAnswers = [];

  List<String> _selectedAnswers = []; //automatically turns this back to variable & if you type var then gives an error

  var _activeScreen = 'first-screen';

  // void initState() {
  //   // TODO: implement initState
  //   activeScreen = FirstScreen(switchScreen);
  //   super.initState();
  // }

  void switchScreen(){
    setState(() {
      _activeScreen = 'questions-screen';
    });
  }

  void chooseAnswer(String answer){
    _selectedAnswers.add(answer);
    if(_selectedAnswers.length == questions.length){
      setState((){
        // selectedAnswers = [];
        _activeScreen = 'results-screen';
      });
    }
  }

  void restartQuiz(){
      setState(() {
        _selectedAnswers = [];
        _activeScreen = 'questions-screen';
      });
  }

  @override
  Widget build(context){

    Widget screenWidget = FirstScreen(switchScreen);

    if(_activeScreen == 'questions-screen'){
      screenWidget = Questions(onSelectAnswer:chooseAnswer);
    }

    if(_activeScreen == 'results-screen'){
      screenWidget = ResultScreen(
        choosenAnswers: _selectedAnswers,
        onRestart:restartQuiz,
      );
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 67, 24, 131),
              Color.fromARGB(255, 88, 24, 131),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        // child:screenWidget,
        // child: activeScreen == 'first-screen' ? FirstScreen(switchScreen) : Questions(onSelectAnswer:chooseAnswer),
        //   child: if(activeScreen == 'results-screen'){
        //   screenWidget = ResultScreen();
        // }
        // else if(activeScreen == 'first-screen'){
        //   FirstScreen(switchScreen);
        // }
        // else{
        //   Questions(onSelectAnswer:chooseAnswer);
        // }
          child: screenWidget,
      ),
    ),
    );
  }
}