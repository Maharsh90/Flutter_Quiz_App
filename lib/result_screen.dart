import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/data/questions_text.dart';
// import 'package:quiz_app/questions_screen.dart';
import 'package:quiz_app/questions_summary/questions_summary.dart';
// import 'package:quiz_app/quiz.dart';

class ResultScreen extends StatelessWidget{
  ResultScreen({super.key,required this.choosenAnswers,required this.onRestart});

  final void Function() onRestart;

  final List<String> choosenAnswers;


  List<Map<String,Object>> getSummaryData(){
    final List<Map<String,Object>> summary = [];

    for(var i=0;i<choosenAnswers.length;i++){
      summary.add({
        'question_index':i,
        'question' : questions[i].text,
        'correct_answer':questions[i].answers[0],
        'user_answer':choosenAnswers[i]
        },
      );
    }
    return summary;
  }

  @override
  Widget build(context){
    final summaryData = getSummaryData();
    final numOfTotalQuestions = questions.length;
    final numOfCorrectedQuestions = summaryData.where((data){
      return data['user_answer'] == data['correct_answer'];
    }).length;
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('You answerd $numOfCorrectedQuestions Questions correct outof $numOfTotalQuestions Questions',
              style: GoogleFonts.lato(
                fontSize: 17,
                color: Color.fromARGB(255, 230, 200, 253),
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 30,),
            // Text('List ...'),
            // QuestionsSummary(getSummaryData()),
            QuestionsSummary(summaryData),
            SizedBox(height: 30,),
            TextButton.icon(onPressed: onRestart,style: TextButton.styleFrom(
              foregroundColor: Colors.white,
            ),
                icon: Icon(Icons.restart_alt),
                label:Text('Restart Quiz')),
          ],
        ),
      ),
    );
  }
}