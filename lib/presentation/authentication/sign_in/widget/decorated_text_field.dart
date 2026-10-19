import 'package:control_style/control_style.dart';
import 'package:flutter/material.dart';

class DecoratedTextField extends StatelessWidget {
  final String label;

  const DecoratedTextField({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return TextField(
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
    );
  }
}
