import 'package:flutter/material.dart';
import 'package:zagel/widgets/coustm_text.dart';

class Chatmassage extends StatelessWidget {
  const Chatmassage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding:
            const EdgeInsets.only(left: 16, top: 16, bottom: 16, right: 16),
        margin: const EdgeInsets.all(12),
        decoration: const BoxDecoration(
            color: Color.fromARGB(255, 56, 185, 84),
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(32),
                bottomRight: Radius.circular(32),
                topLeft: Radius.circular(32))),
        child: const CoustmText(text: 'Data', size: 12),
      ),
    );
  }
}
