import 'package:control_style/control_style.dart';
import 'package:flutter/material.dart';

class DecoratedTextField extends StatelessWidget {
  final String label;
  final String? Function(String? value)? validator;
  final TextEditingController controller;

  const DecoratedTextField({super.key, required this.label, required this.controller, this.validator});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
        decoration: InputDecoration(
          labelText: label,
          border: DecoratedInputBorder(
            shadow: const [
              BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10,
                  offset: Offset(0, 5)
              )
            ],
            child: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
        validator: validator,
    );
  }
}
