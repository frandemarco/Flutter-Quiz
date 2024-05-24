import 'package:flutter/material.dart';
import 'package:quizz_app/questions.dart';
import 'package:quizz_app/result_screen.dart';
import 'package:quizz_app/start_screen.dart';
import 'package:quizz_app/question_screen.dart';
const startAlignment=Alignment.bottomLeft;
const endAlignment=Alignment.bottomRight;
class Quiz extends StatefulWidget{
  const Quiz({super.key});
  @override
  State<Quiz> createState(){
    return _QuizState();
  }
}
class _QuizState extends State<Quiz>{
   List<String> selectedAnswers = [];
  Widget? activeScreen;

  @override
  void initState() {
    activeScreen = StartScreen(switchScreen);
    super.initState();
  }

//TODO: Make a reset quiz method
//It should reset the answered questions and 
void resetQuiz(){
setState(() {
  selectedAnswers.clear();
  activeScreen=StartScreen(switchScreen);
});
}
 void switchScreen(){
    setState(() {
        activeScreen = QuestionScreen(onSelectAnswer:chooseAnswer);
      }
    );
  }
  void chooseAnswer(String answer)
  {
     selectedAnswers.add(answer);
    if(selectedAnswers.length == questions.length){
      //switch to the results screen
      //setting to start screen for now
      setState(() {
        //modify this after you amke function, need to change ResultsScreen so it can be handed the function as a param
        activeScreen =  ResultsScreen(resetQuiz, chosenAnswers:selectedAnswers );
      });
    }
  }
@override
Widget build(context){
  return  MaterialApp(
      home: Scaffold(
        body:  Container(
        decoration:  const BoxDecoration(
          gradient: LinearGradient(
            colors:[ Color.fromARGB(255, 78, 13, 151),
                Color.fromARGB(255, 107, 15, 168)] ,
                begin: startAlignment,
                end: endAlignment,
                ),
        ),
        child:activeScreen,
      ),
    )
  );
}
}