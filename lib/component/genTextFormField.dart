// ignore_for_file: file_names

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class GetTextFormField extends StatelessWidget {
  TextEditingController controller;
  String hintName;
  bool isObscureText;
  TextInputType inputType;
  bool isEnable;

  GetTextFormField(
      {Key? key,
      required this.controller,
      required this.hintName,
      this.isObscureText = false,
      this.inputType = TextInputType.text,
      this.isEnable = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: TextFormField(
        controller: controller,
        obscureText: isObscureText,
        enabled: isEnable,
        keyboardType: inputType,
        decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            borderSide: BorderSide(color: Colors.black),
          ),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            borderSide: BorderSide(color: Color(0xFF6372F6)),
          ),
          hintText: hintName,
          fillColor: Colors.white,
          filled: true,
        ),
      ),
    );
  }
}
