import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:zagel/widgets/coustm_bt.dart';
import 'package:zagel/widgets/coustm_text.dart';
import 'package:zagel/widgets/coustmtextfield.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  HomeScreen({super.key, this.email, this.passwoerd});
  String? email, passwoerd;
  GlobalKey<FormState> formkey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      alignment: Alignment.center,
      decoration: const BoxDecoration(
          gradient: LinearGradient(
        colors: [
          Color.fromARGB(86, 1, 8, 2),
          Color.fromARGB(87, 74, 240, 110),
          Color.fromARGB(255, 255, 255, 255),
        ],
        end: Alignment.topCenter,
        begin: Alignment.bottomCenter,
      )),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(
                flex: 1,
              ),
              Image.asset('assets/Zagelloogo.png'),
              const CoustmText(text: 'zagel', size: 30),
              const CoustmText(text: 'sign in', size: 16),
              const SizedBox(
                height: 25,
              ),
              SizedBox(
                  height: 60,
                  width: 600,
                  child: Coustmtextfield(
                    labeltext: 'e_mail',
                    icon: Icons.email,
                    onChanged: (data) {
                      email = data;
                    },
                  )),
              SizedBox(
                  width: 600,
                  child: Coustmtextfield(
                    labeltext: 'password',
                    icon: Icons.password,
                    onChanged: (data) {
                      passwoerd = data;
                    },
                  )),
              const SizedBox(
                height: 25,
              ),
              CoustmBt(
                bttext: 'Log in',
                onPressed: () async {
                  if (formkey.currentState!.validate()) {
                    try {
                      await signin();
                      Navigator.pushNamed(context, 'ChatScreen');
                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'user-not-found') {
                        const SnackBar(
                            content: Text('No user found for that email.'));
                      } else if (e.code == 'wrong-password') {
                        const SnackBar(
                            content:
                                Text('Wrong password provided for that user.'));
                      }
                    } catch (ex) {
                      const SnackBar(content: Text('error'));
                    }
                  }
                },
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CoustmText(text: 'Dont have Account ', size: 15),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, 'signup');
                    },
                    child: const CoustmText(text: 'Sign up', size: 15),
                  ),
                ],
              ),
              const Spacer(
                flex: 4,
              )
            ],
          ),
        ),
      ),
    ));
  }

  signin() async {
    UserCredential credintial =
        await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email!,
      password: passwoerd!,
    );
  }
}
