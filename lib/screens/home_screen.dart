import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:calculator_app/components/my_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var userInput = '';
  var answer = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculator'),
        backgroundColor: Colors.blueGrey,
        elevation: 1,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0),
          child: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Text(
                          userInput.toString(),
                          style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Colors.blueGrey),
                        ),
                      ),
                      (userInput.isEmpty)
                          ? const Text(
                              '0',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 36, 38, 48),
                                  fontSize: 40,
                                  fontWeight: FontWeight.bold),
                            )
                          : Text(
                              answer.toString(),
                              style: const TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 36, 38, 48),
                              ),
                            )
                    ],
                  ),
                ),
              ),
              const Divider(
                color: Colors.white30,
                thickness: 2,
                height: 0,
              ),
              Column(
                children: [
                  Row(
                    children: [
                      MyButton(
                          title: 'AC',
                          ontap: () {
                            setState(() {
                              userInput = '';
                              answer = '';
                            });
                          }),
                      MyButton(
                          title: '+/-',
                          ontap: () {
                            userInput += '+/-';
                            setState(() {});
                          }),
                      MyButton(
                          title: '%',
                          ontap: () {
                            userInput += '%';
                            setState(() {});
                          }),
                      MyButton(
                          title: '/',
                          ontap: () {
                            userInput += '/';
                            setState(() {});
                          })
                    ],
                  ),
                  Row(
                    children: [
                      MyButton(
                          title: '7',
                          ontap: () {
                            setState(() {
                              userInput += '7';
                            });
                          }),
                      MyButton(
                          title: '8',
                          ontap: () {
                            userInput += '8';
                            setState(() {});
                          }),
                      MyButton(
                          title: '9',
                          ontap: () {
                            userInput += '9';
                            setState(() {});
                          }),
                      MyButton(
                          title: 'x',
                          ontap: () {
                            userInput += '*';
                            setState(() {});
                          })
                    ],
                  ),
                  Row(
                    children: [
                      MyButton(
                          title: '4',
                          ontap: () {
                            userInput += '4';
                            setState(() {});
                          }),
                      MyButton(
                          title: '5',
                          ontap: () {
                            userInput += '5';
                            setState(() {});
                          }),
                      MyButton(
                          title: '6',
                          ontap: () {
                            userInput += '6';
                            setState(() {});
                          }),
                      MyButton(
                          title: '-',
                          ontap: () {
                            userInput += '-';
                            setState(() {});
                          })
                    ],
                  ),
                  Row(
                    children: [
                      MyButton(
                          title: '1',
                          ontap: () {
                            userInput += '1';
                            setState(() {});
                          }),
                      MyButton(
                          title: '2',
                          ontap: () {
                            userInput += '2';
                            setState(() {});
                          }),
                      MyButton(
                          title: '3',
                          ontap: () {
                            userInput += '3';
                            setState(() {});
                          }),
                      MyButton(
                          title: '+',
                          ontap: () {
                            userInput += '+';
                            setState(() {});
                          })
                    ],
                  ),
                  Row(
                    children: [
                      MyButton(
                          title: '0',
                          ontap: () {
                            setState(() {
                              userInput += '0';
                            });
                          }),
                      MyButton(
                          title: '.',
                          ontap: () {
                            userInput += '.';
                            setState(() {});
                          }),
                      MyButton(
                          title: 'DEL',
                          ontap: () {
                            setState(() {
                              userInput =
                                  userInput.substring(0, userInput.length - 1);
                            });
                          }),
                      MyButton(
                          title: '=',
                          ontap: () {
                            equalPress();
                            setState(() {});
                          })
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void equalPress() {
    String finalUserInput = userInput;

    finalUserInput = userInput.replaceAll('X', '*');
    Parser p = Parser();
    Expression expression = p.parse(finalUserInput);
    ContextModel contextModel = ContextModel();
    double evil = expression.evaluate(EvaluationType.REAL, contextModel);

    answer = evil.toStringAsFixed(2);
  }
}
