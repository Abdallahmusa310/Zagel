import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:zagel/models/message_model.dart';
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
  final ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    var email = ModalRoute.of(context)!.settings.arguments;
    return StreamBuilder<QuerySnapshot>(
        stream: message.orderBy('sent at', descending: true).snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<MessageModel> messagelist = [];
            for (int i = 0; i < snapshot.data!.docs.length; i++) {
              messagelist.add(MessageModel.fromJson(snapshot.data!.docs[i]));
            }
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
                      child: ListView.builder(
                          reverse: true,
                          controller: scrollController,
                          itemCount: messagelist.length,
                          itemBuilder: (context, index) {
                            return messagelist[index].id == email
                                ? Chatmassage(
                                    message: messagelist[index],
                                  )
                                : Chatmassagetow(message: messagelist[index]);
                          }),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Coustmtextfeild(
                        controller: controller,
                        onSubmitted: (data) {
                          message.add({
                            'message': data,
                            'sent at': DateTime.now(),
                            'id': email
                          });
                          controller.clear();
                          scrollController.animateTo(
                            0,
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.bounceInOut,
                          );
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
