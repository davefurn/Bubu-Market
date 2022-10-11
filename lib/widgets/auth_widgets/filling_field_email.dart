import 'package:bubu_market/constants/colors.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

class EmailField extends StatelessWidget {
  final IconData icon;
  final String hintText;
  final bool isPassWord;
  final bool isEmail;
  final TextEditingController controller;

  const EmailField(
      {Key? key,
      required this.icon,
      required this.hintText,
      required this.isPassWord,
      required this.isEmail, required this.controller,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return TextFormField(
      
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (email)=> 
      email != null && !EmailValidator.validate(email)
      ? 'Enter a valid email'
      : null
      ,
      controller: controller,
      style: const TextStyle(color: GlobalVariables.colorSecondary),
      cursorColor: const Color(0xff192028),
      obscureText: isPassWord,
      textInputAction:
          isPassWord ? TextInputAction.done : TextInputAction.next,
      keyboardType:
          isEmail ? TextInputType.emailAddress : TextInputType.text,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(17),
        prefixIcon: Icon(
          size: 21,
          icon,
          color: const Color(0xffb5b9bc),
        ),    
        hintText: hintText,
       
       
      ),
    );
  }
}
