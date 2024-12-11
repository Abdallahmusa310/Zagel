import 'package:flutter/material.dart';

class CoustmText extends StatelessWidget {
  const CoustmText({super.key,required this.text,required this.size,this.color});
  final String text;
  final double size;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
       style: TextStyle
       (
       color: color,
       fontSize:size,
       fontFamily:'Parkinsans'
       )
    );
  }
} 