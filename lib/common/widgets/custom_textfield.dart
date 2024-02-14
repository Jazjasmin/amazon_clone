import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final int maxLine;
  const CustomTextField(
      {Key? key,
      required this.controller,
      required this.hintText,
       this.maxLine = 1})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: const InputDecoration(
          border: OutlineInputBorder(
              borderSide: BorderSide(
            color: Colors.black,
          )),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
            color: Colors.black,
          ))),
      validator: (val) {
        if (val == null || val.isEmpty) {
          return 'Enter Your $hintText';
        }
        return null;
      },
    );
  }
}
