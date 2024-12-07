import 'package:flutter/material.dart';
import 'package:zagel/widgets/coustm_text.dart';

class CoustmBt extends StatelessWidget {
const CoustmBt({super.key, this.onPressed, required this.bttext});
  final String 
   bttext;
  final  void Function()? onPressed ;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child:  Container(
        decoration:const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          color: Color.fromARGB(255, 37, 173, 89)
          ),
        height: 35,
        width: 85,
        child:  Center(child: CoustmText(text: bttext, size: 15,color: 0xff3fc73,)),
      )
      );
  }
}