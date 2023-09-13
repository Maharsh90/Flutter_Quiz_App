import 'package:flutter/material.dart';

class FirstScreen extends StatelessWidget{
  @override
  const FirstScreen(this.startQuiz,{super.key});

  final void Function() startQuiz;

  Widget build(context){
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Opacity( //setting transparant image using opacity
          //     opacity: 0.5,
          //     child: Image.asset('assets/images/quiz-logo.png',height: 150,width: 300,),),
          Image.asset('assets/images/quiz-logo.png',height: 150,width: 300,
          color: Color.fromARGB(160, 255, 255, 255),), //setting traparent image
          SizedBox(height: 50),
          const Text('Learn Flutter the fun way',style: TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),),
          SizedBox(height: 30),
          // ElevatedButton(onPressed: (){},style:ElevatedButton.styleFrom(
          //   foregroundColor: Colors.white,
          //   backgroundColor: Color.fromARGB(255, 92, 24, 131),
          // ),child: Text('Start Quiz')),
          OutlinedButton.icon(//onpressd:startQuiz,
              onPressed: ()
          {
            startQuiz();
          }, style: OutlinedButton.styleFrom(
            foregroundColor: Colors.white,
          ),
              icon: Icon(Icons.arrow_forward),
              label: Text('Start Quiz')),
        ],
      ),
    );
  }

}