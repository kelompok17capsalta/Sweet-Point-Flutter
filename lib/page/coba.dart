import 'package:flutter/material.dart';

// ignore: must_be_immutable
class GetText extends StatefulWidget {
  TextEditingController controller;
  String hintName;
  bool isObscureText;
  TextInputType inputType;
  bool isEnable;

  GetText(
      {Key? key,
      required this.controller,
      required this.hintName,
      this.isObscureText = true,
      this.inputType = TextInputType.text,
      this.isEnable = true})
      : super(key: key);

  @override
  State<GetText> createState() => _GetTextState();
}

class _GetTextState extends State<GetText> {
  bool _isHidePassword = true;

  void _togglePasswordVisibility() {
    setState(() {
      _isHidePassword = !_isHidePassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: TextFormField(
        controller: widget.controller,
        obscureText: _isHidePassword,
        enabled: widget.isEnable,
        keyboardType: widget.inputType,
        decoration: InputDecoration(
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
          ),
          labelText: 'Password',
          suffixIcon: GestureDetector(
            onTap: () {
              _togglePasswordVisibility();
            },
            child: Icon(
              _isHidePassword ? Icons.visibility_off : Icons.visibility,
              color: _isHidePassword ? Colors.grey : Color(0xFF6372F6),
            ),
          ),
          isDense: true,
          hintText: widget.hintName,
          fillColor: Colors.white,
          filled: true,
        ),
      ),
    );
  }
}
