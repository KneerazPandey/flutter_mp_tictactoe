import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String buttonName;
  final VoidCallback onPressed;

  const CustomButton({
    super.key,
    required this.buttonName,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Container(
      decoration: const BoxDecoration(
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.blue,
            blurRadius: 5,
            spreadRadius: 0,
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          minimumSize: Size(
            width,
            50,
          ),
        ),
        child: Text(
          buttonName,
          style: const TextStyle(
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
