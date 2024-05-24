import 'package:flutter/material.dart';
import 'package:quizz_app/questions.dart';
import 'package:quizz_app/question_summary.dart';
//import 'package:quizz_app/start_screen.dart';

class ResultsScreen extends StatelessWidget{
 const ResultsScreen(this.restartQuiz, {super.key, required this.chosenAnswers});
  final List<String> chosenAnswers;
  final void Function() restartQuiz;
  List<Map<String, Object>> getSummaryData(){
	final List<Map<String, Object>> summary = [];
  for (var i = 0;i<chosenAnswers.length;i++)
{
 summary.add({
  'question_index': i,
  'question': questions[i].text,
  'correct_answer': questions[i].answers[0],
  'user_answer': chosenAnswers[i],
 });
}
	return summary;
}
  @override

  Widget build(context)
  {
     final summaryData=getSummaryData();
    final numTotalQuestions = questions.length;
    final numCorrectQuestions = summaryData.where(
    (data){
      return data['correct_answer'] == data['user_answer'];
    }
  ).length;
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:  [
             Text('You answered $numCorrectQuestions out of $numTotalQuestions questions Correctly',
             style: const TextStyle(
              fontSize: 24,
              color: Colors.white
             ),),
            const SizedBox(height:30,),
            QuestionsSummary(summaryData: getSummaryData()),
            const SizedBox(height:30,),
            OutlinedButton.icon(onPressed: restartQuiz, 
          icon: const Icon(Icons.arrow_circle_right), 
          label: const Text("Restart Quiz!"),
          style: OutlinedButton.styleFrom(
            foregroundColor: Colors.white,
          ),
          ),
            // TextButton(
            //   onPressed: restartQuiz,
            //   child: const Text('Restart Quiz',
            //   style: TextStyle(
            //     color: Colors.white
            //   ),
            //   ),
              
            // )
          ],
        ),
      ),
    );
  }
}