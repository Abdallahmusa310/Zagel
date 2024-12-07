import 'package:flutter/material.dart';
import 'package:zagel/widgets/coustm_bt.dart';
import 'package:zagel/widgets/coustm_text.dart';
import 'package:zagel/widgets/coustmtextfield.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
         alignment: Alignment.center,
          decoration:const BoxDecoration(
          gradient: LinearGradient(
          colors: [
            Color.fromARGB(86, 1, 8, 2),
            Color.fromARGB(87, 74, 240, 110),
            Color.fromARGB(255, 255, 255, 255),
          ],
          end:Alignment.topCenter, begin: Alignment.bottomCenter,
          )
        ),
        child:Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(flex: 1,),
                Image.asset('assets/Zagelloogo.png'),
                const CoustmText(text: 'zagel', size: 30),
                const CoustmText(text: 'sign up', size: 16),
                const SizedBox(height: 25,),
                const SizedBox(
                  height: 60,
                  width: 600,
                  child: Coustmtextfield(labeltext: 'e_mail',icon:Icons.email)
                  ),
                const SizedBox(
                  width: 600,
                  child: Coustmtextfield(labeltext: 'password',icon: Icons.password,)
                  ),
                 const SizedBox(height: 15,),
                 const CoustmBt(bttext: 'Sign up',),
                 const SizedBox(height: 25,),
                 Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  const CoustmText(text: 'Already have account   ', size: 15),
                  GestureDetector(
                  onTap:(){Navigator.pop(context);},
                  child:const CoustmText(text:'sign in', size: 15) ,
                  ),
                  ],
                ),
                const Spacer(flex: 4,)
              ],
            ),
          ),
        ),
      )
      
    );
  }
}