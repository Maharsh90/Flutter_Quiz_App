import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsSummary extends StatelessWidget{
  QuestionsSummary(this.summaryData,{super.key});

  final List<Map<String,Object>> summaryData;

  Widget build(context){
    return SizedBox(
      height: 400,
      child: SingleChildScrollView(
        child: Column(children:
        summaryData.map((data){
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
              Container(
                height: 30,
                width: 30,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.lightGreen,
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Text(style: TextStyle(
                  color: Colors.white,
                  // backgroundColor: Colors.deepOrange,
                ),((data['question_index'] as int) + 1).toString()),
              ),
              Expanded(
                child: Column(
                  children: [
                    Text(style:GoogleFonts.lato(
                      color: Colors.white,
                      fontSize: 15,
                    ),data['question'] as String),
                    SizedBox(height: 5,),
                    Text(style:TextStyle(
                      color: Colors.purpleAccent,
                    ),data['user_answer'] as String),
                    Text(style:TextStyle(
                      color: Colors.lightBlue,
                    ),data['correct_answer'] as String),
                  ],
                ),
              )
            ],),
          );
        }).toList(),
        ),
      ),
    );
  }
}


// import 'package:flutter/material.dart';
//
// import 'package:quiz_app/questions_summary/summary_item.dart';
//
// class QuestionsSummary extends StatelessWidget {
//   const QuestionsSummary(this.summaryData, {super.key});
//
//   final List<Map<String, Object>> summaryData;
//
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 400,
//       child: SingleChildScrollView(
//         child: Column(
//           children: summaryData.map(
//                 (data) {
//               return SummaryItem(data);
//             },
//           ).toList(),
//         ),
//       ),
//     );
//   }
// }