import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    required this.controller,
    required this.hintText,
    Key? key,
    this.maxLines = 1,
    this.keyboardtype,
  }) : super(key: key);
  final TextEditingController controller;
  final String hintText;
  final int maxLines;
  final TextInputType? keyboardtype;

  @override
  Widget build(BuildContext context) => TextFormField(
        textCapitalization: TextCapitalization.sentences,
        keyboardType: keyboardtype,
        controller: controller,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          prefixIcon: const Icon(Icons.email_outlined),
          hintText: hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Colors.white,
            ),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
            ),
          ),
        ),
        validator: (val) {
          if (val == null || val.isEmpty) {
            return 'Enter your $hintText';
          }
          return null;
        },
        maxLines: maxLines,
      );
}
