import 'package:flutter/material.dart';

const startAlignment=Alignment.bottomLeft;
const endAlignment=Alignment.bottomRight;
class GradientWidget extends StatelessWidget{
   const GradientWidget({super.key, required this.colors});
   final List<Color> colors;
   @override
   Widget build(context){
    return Container(
      decoration:   BoxDecoration(
          gradient: LinearGradient(
            colors: colors,
                begin: startAlignment,
                end: endAlignment,
                ),
    
   ));
  }
 }
