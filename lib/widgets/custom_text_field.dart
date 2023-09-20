import 'package:flutter/material.dart';
import 'package:flutter_mp_tictactoe/core/core.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        boxShadow: <BoxShadow>[
          BoxShadow(
            blurRadius: 5,
            spreadRadius: 2,
            color: Colors.blue,
          ),
        ],
      ),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          filled: true,
          fillColor: bgColor,
          hintText: hintText,
        ),
      ),
    );
  }
}
