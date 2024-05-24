import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizz_app/answer_button.dart';
import 'package:quizz_app/questions.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key, required this.onSelectAnswer});

  @override
  State<QuestionScreen> createState() {
    return _QuestionsScreenState();
  }
  final void Function(String answer) onSelectAnswer;
}

class _QuestionsScreenState extends State<QuestionScreen> {
  var currentQuestionIndex = 0;

  void answerQuestion(String selectedAnswer) {
    setState(() {
    widget.onSelectAnswer(selectedAnswer);
     setState(() {
      currentQuestionIndex++;
    });
    });
  }

  @override
  Widget build(context) {
    final currentQuestion = questions[currentQuestionIndex];
    return SizedBox(
        width: double.infinity,
        child: Container(
          margin: const EdgeInsets.all(40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(currentQuestion.text,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.lato(color: Colors.white, 
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  )
                  ),
              const SizedBox(
                height: 30,
              ),
              ...currentQuestion.getShuffledAnswers().map((item) {
                return AnswerButton(
                  answerText: item, 
                   ontap: (){
	                 answerQuestion(item);
                    });
              }),
            ],
          ),
        ));
  }
}
