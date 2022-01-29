import 'package:flutter/material.dart';

class LoginTextField extends StatelessWidget {
  final String hintText;
  final IconData? icon;
  final bool obscureText;

  const LoginTextField({Key? key, required this.hintText, this.icon, this.obscureText = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(color: Colors.white),
      obscureText: this.obscureText,
      decoration: InputDecoration(
        icon: Icon(icon, color: Colors.white),
        hintText: this.hintText,
        hintStyle: TextStyle(color: Colors.white),
        enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white, width: 3.0)),
        focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white, width: 3.0))
      ),
    );
  }
}
