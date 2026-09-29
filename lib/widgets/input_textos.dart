import 'package:flutter/material.dart';

class InputTextos extends StatelessWidget {
  final String label;
  final String hint;
  final TextEditingController controller;

  const InputTextos(
      this.label,
      this.hint, {
        super.key,
        required this.controller,
      });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          labelText: label,
          hintText: hint.isNotEmpty ? hint : null,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }
}