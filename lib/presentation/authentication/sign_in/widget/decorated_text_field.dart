import 'package:control_style/control_style.dart';
import 'package:flutter/material.dart';

class DecoratedTextField extends StatelessWidget {
  final String label;
  final String? Function(String?)? validator;
  final TextEditingController controller;
  final bool isPassword;

  const DecoratedTextField({
    super.key,
    required this.controller,
    required this.label,
    this.validator,
    this.isPassword = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      obscureText: isPassword,
      decoration: InputDecoration(
        labelText: label,
        border: DecoratedInputBorder(
          shadow: const [BoxShadow(color: Colors.black26, blurRadius: 10, offset: Offset(0, 5))],
          child: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }
}
