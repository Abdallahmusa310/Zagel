import 'package:flutter/material.dart';

class Coustmtextfield extends StatelessWidget {
  const Coustmtextfield({super.key,this.labeltext,this.icon});
  final String?labeltext;
  final IconData?icon;

  @override
  Widget build(BuildContext context) {
    return  TextFormField(
      decoration:  InputDecoration(
        prefixIcon: Icon(icon),
        labelText: '$labeltext',
        enabledBorder: const OutlineInputBorder(
        borderSide:BorderSide(width: BorderSide.strokeAlignCenter,color: Color.fromARGB(255, 64, 47, 216)) ,
        borderRadius:BorderRadius.all(Radius.circular(20)),
        ),
        border:const OutlineInputBorder(borderSide: BorderSide(),)
      ),
    );
  }
}