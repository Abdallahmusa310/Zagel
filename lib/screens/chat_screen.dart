import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:zagel/widgets/coustm_massage.dart';
import 'package:zagel/widgets/coustm_text.dart';
import 'package:zagel/widgets/coustmtextfield.dart';

// ignore: must_be_immutable
class ChatScreen extends StatefulWidget {
  const ChatScreen({
    super.key,
  });

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  CollectionReference message =
      FirebaseFirestore.instance.collection('message');

  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<QuerySnapshot>(
        future: message.get(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            print(snapshot.data!.docs[7]['message']);
            return Scaffold(
                appBar: AppBar(
                  title: const Center(
                    child: CoustmText(
                      text: 'zagel',
                      size: 25,
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
                  backgroundColor: const Color.fromARGB(255, 56, 185, 84),
                ),
                body: Column(
                  children: [
                    Expanded(
                      child: ListView.builder(itemBuilder: (context, index) {
                        return const Chatmassage();
                      }),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Coustmtextfeild(
                        controller: controller,
                        onSubmitted: (data) {
                          message.add({'message': data});
                          controller.clear();
                        },
                        labeltext: 'send message',
                        iconn: Icons.send_rounded,
                      ),
                    )
                  ],
                ));
          } else {
            return const ModalProgressHUD(inAsyncCall: true, child: Scaffold());
          }
        });
  }
}
