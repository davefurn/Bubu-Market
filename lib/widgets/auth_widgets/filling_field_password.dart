import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class PassWordField extends StatefulWidget {
  final IconData icon;
  final String hintText;

  final bool isEmail;
  final TextEditingController controller;

  PassWordField({
    Key? key,
    required this.icon,
    required this.hintText,
    required this.isEmail,
    required this.controller,
  }) : super(key: key);

  @override
  State<PassWordField> createState() => _PassWordFieldState();
}

class _PassWordFieldState extends State<PassWordField> {
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) =>
          value != null && value.length < 6 ? 'Enter min. 6 characters' : null,
      controller: widget.controller,
      style: const TextStyle(color: GlobalVariables.colorSecondary),
      cursorColor: const Color(0xff192028),
      obscureText: _isObscure,
      textInputAction: TextInputAction.done,
      keyboardType:
          widget.isEmail ? TextInputType.emailAddress : TextInputType.text,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(17),
        suffixIcon: IconButton(
          icon: Icon(
            _isObscure ? Icons.visibility_off : Icons.visibility,
            color: Colors.grey,
          ),
          onPressed: () {
            setState(() {
              _isObscure = !_isObscure;
            });
          },
        ),
        prefixIcon: Icon(
          size: 21,
          widget.icon,
          color: const Color(0xffb5b9bc),
        ),
        hintText: widget.hintText,
       
      ),
    );
  }
}
