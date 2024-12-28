import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:zagel/widgets/coustm_bt.dart';
import 'package:zagel/widgets/coustm_text.dart';
import 'package:zagel/widgets/coustmtextfield.dart';

// ignore: must_be_immutable
class SignUpScreen extends StatefulWidget {
  const SignUpScreen({
    super.key,
  });

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  GlobalKey<FormState> formkey = GlobalKey();
  String? email, passwoerd;
  bool isload = false;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isload,
      child: Scaffold(
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
                const CoustmText(text: 'sign up', size: 16),
                const SizedBox(
                  height: 25,
                ),
                SizedBox(
                    height: 70,
                    width: 600,
                    child: Coustmtextformfield(
                      obscureText: false,
                      labeltext: 'e_mail',
                      icon: Icons.email,
                      onChanged: (data) {
                        email = data;
                      },
                    )),
                SizedBox(
                    width: 600,
                    child: Coustmtextformfield(
                      obscureText: true,
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
                  bttext: 'Sign up',
                  onPressed: () async {
                    final messenger = ScaffoldMessenger.of(context);
                    if (formkey.currentState?.validate() ?? false) {
                      isload = true;
                      setState(() {});
                      try {
                        await createuser();
                        messenger.showSnackBar(
                            const SnackBar(content: Text('Success!')));
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'weak-password') {
                          messenger.showSnackBar(const SnackBar(
                              content:
                                  Text('The password provided is too weak.')));
                        } else if (e.code == 'email-already-in-use') {
                          messenger.showSnackBar(const SnackBar(
                              content: Text(
                                  'The account already exists for that email.')));
                        }
                      } catch (ex) {
                        messenger.showSnackBar(SnackBar(content: Text('$ex')));
                      }
                      isload = false;
                      setState(() {});
                    }
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CoustmText(text: 'Already have account   ', size: 15),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const CoustmText(text: 'sign in', size: 15),
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
      )),
    );
  }

  createuser() async {
    // UserCredential credintial =
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email!,
      password: passwoerd!,
    );
  }
}
