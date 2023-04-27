import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  const MyButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 80,
        width: 80,
        decoration: const BoxDecoration(
            color: Color(0xffa5a5a5), shape: BoxShape.circle),
      ),
    );
  }
}
