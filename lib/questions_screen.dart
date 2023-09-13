import 'package:flutter/material.dart';
import 'package:quiz_app/answer_button.dart';
import 'package:quiz_app/data/questions_text.dart';
import 'package:google_fonts/google_fonts.dart';

class Questions extends StatefulWidget{
  @override
  const Questions({super.key,required this.onSelectAnswer});

  final void Function(String answer) onSelectAnswer;
  State<Questions> createState(){
    return _QuestionsState();
  }

}

class _QuestionsState extends State<Questions>{
  var currentQuestionIndex = 0;
  void answerQuestion(String selectedAnswer){
    widget.onSelectAnswer(selectedAnswer);
    // currentQuestionIndex = currentQuestionIndex + 1;
    // currentQuestionIndex += 1;
    setState(() {
      currentQuestionIndex++;
    });
  }
  @override
  Widget build(context){
    final currentQuestion = questions[currentQuestionIndex];
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(currentQuestion.text,
              style: GoogleFonts.lato(
                color: Color.fromARGB(130, 255, 255, 255),
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30,),
            ...currentQuestion.getShuffledAnswers().map((answer){
              return Container(margin: EdgeInsets.only(bottom: 10),child: AnswerButton(answerText: answer, onTap: (){
                answerQuestion(answer);
              }));
            }),
            // SizedBox(height: 20,),
            // AnswerButton(answerText: currentQuestion.answers[0], onTap:() { }),
            // SizedBox(height: 20,),
            // AnswerButton(onTap:() { },answerText: currentQuestion.answers[1]), //you can also change the order because is named args
            // SizedBox(height: 20,),
            // AnswerButton(answerText: currentQuestion.answers[2], onTap:() { }),
            // SizedBox(height: 20,),
            // AnswerButton(answerText: currentQuestion.answers[3], onTap:() { }),
          ],
        ),
      ),
    );
  }
}
