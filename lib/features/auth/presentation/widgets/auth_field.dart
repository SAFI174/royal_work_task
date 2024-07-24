import 'package:flutter/material.dart';

class AuthField extends StatelessWidget {
  const AuthField({
    super.key,
    this.hintText = "",
    this.isPassword = false,
    this.controller,
    this.validator,
  });
  final String hintText;
  final bool isPassword;
  final TextEditingController? controller;
  final String? Function(String? value)? validator;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      obscureText: isPassword,
      decoration: InputDecoration(
        hintText: hintText,
      ),
    );
  }
}
