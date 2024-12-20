import 'package:flutter/material.dart';

class Coustmtextfield extends StatelessWidget {
  const Coustmtextfield({super.key, this.labeltext, this.icon, this.onChanged});
  final String? labeltext;
  final IconData? icon;
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (data) {
        if (data!.isEmpty) {
          return 'requird';
        }
      },
      onChanged: onChanged,
      decoration: InputDecoration(
          prefixIcon: Icon(icon),
          labelText: '$labeltext',
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
                width: BorderSide.strokeAlignCenter,
                color: Color.fromARGB(255, 64, 47, 216)),
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          border: const OutlineInputBorder(
            borderSide: BorderSide(),
          )),
    );
  }
}
