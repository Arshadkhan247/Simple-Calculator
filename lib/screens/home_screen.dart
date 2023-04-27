import 'package:flutter/material.dart';
import 'package:calculator_app/components/my_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            children: const [
              MyButton(),
              MyButton(),
              MyButton(),
              MyButton(),
            ],
          )
        ],
      ),
    );
  }
}
