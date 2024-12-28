import 'package:flutter/material.dart';

class Coustmtextformfield extends StatelessWidget {
  const Coustmtextformfield(
      {super.key,
      this.labeltext,
      this.iconbt,
      this.icon,
      this.onChanged,
      this.obscureText = true});
  final String? labeltext;
  final IconData? icon;
  final bool obscureText;
  final Widget? iconbt;

  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      validator: (data) {
        if (data == null || data.isEmpty) {
          return 'this feild is requird';
        }
        return null;
      },
      onChanged: onChanged,
      decoration: InputDecoration(
          prefixIcon: Icon(icon),
          suffixIcon: iconbt,
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

// ignore: must_be_immutable
class Coustmtextfeild extends StatelessWidget {
  Coustmtextfeild(
      {super.key,
      this.iconn,
      this.labeltext,
      this.onSubmitted,
      this.controller});
  Function(String)? onSubmitted;
  final IconData? iconn;
  final String? labeltext;
  TextEditingController? controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onSubmitted: onSubmitted,
      decoration: InputDecoration(
          suffixIcon: Icon(
            iconn,
            color: const Color.fromARGB(255, 56, 185, 84),
          ),
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
