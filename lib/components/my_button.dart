import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String title;
  final VoidCallback ontap;
  final Color color;
  const MyButton(
      {super.key,
      required this.title,
      required this.ontap,
      this.color = Colors.blueGrey});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: ontap,
        child: Container(
          height: 80,
          width: 80,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white30, width: 0.5),
            color: color,
            shape: BoxShape.rectangle,
          ),
          child: Center(
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 19,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
