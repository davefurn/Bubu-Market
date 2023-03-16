import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final int maxLines;
  final TextInputType? keyboardtype;
  const CustomTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    this.maxLines = 1, this.keyboardtype,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textCapitalization: TextCapitalization.sentences,
      keyboardType: keyboardtype,
      controller: controller,
      decoration: InputDecoration(
        
        filled: true,
        fillColor: Colors.white,
        prefixIcon: Icon(Icons.email_outlined),
          hintText: hintText,
          border:  OutlineInputBorder(
            borderRadius: BorderRadius.circular(10) ,
              borderSide: const BorderSide(
            color: Colors.white,
          )),
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(
            color: Colors.white,
          ))),
      validator: (val) {
        if (val == null || val.isEmpty) {
          return 'Enter your $hintText';
        }
        return null;
      },
      maxLines: maxLines,
    );
  }
}