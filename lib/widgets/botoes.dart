import 'package:flutter/material.dart';

class Botoes extends StatelessWidget {
  final String texto;
  final VoidCallback onPressed;

  const Botoes(this.texto, {super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 14),
        ),
        onPressed: onPressed,
        child: Text(texto, style: const TextStyle(fontSize: 16)),
      ),
    );
  }
}