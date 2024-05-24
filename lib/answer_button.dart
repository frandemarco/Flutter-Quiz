import 'package:flutter/material.dart';
class AnswerButton extends StatelessWidget{
  const AnswerButton({super.key, required this.answerText, required this.ontap});
  final String answerText;
  final void Function() ontap;
  Widget build(context){
    return ElevatedButton(onPressed: ontap, 
    style: ElevatedButton.styleFrom(backgroundColor: const Color.fromARGB(255, 33, 1, 95),
    foregroundColor: Colors.white),
         child: Text(answerText,
         textAlign: TextAlign.center,),
         );
  }
}