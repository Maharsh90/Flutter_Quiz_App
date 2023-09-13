
import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget{
  @override
  // AnswerButton(this.answerText,this.onTap,{super.key});
  AnswerButton({super.key,
  required this.answerText,
  required this.onTap,});

  final String answerText;
  final void Function() onTap;

  Widget build(context){
    return ElevatedButton(onPressed: onTap,
        style: ElevatedButton.styleFrom(
          // padding: EdgeInsets.all(12),
          padding: EdgeInsets.symmetric(horizontal: 40,vertical: 10), //use to set padding horizontally & vertically
          backgroundColor: Color.fromARGB(255, 20, 40, 87),
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
        ),
        child: Text(answerText,textAlign: TextAlign.center,),
    );
  }
}