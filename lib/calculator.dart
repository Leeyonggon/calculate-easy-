import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  int? firstOperand;
  String? operator;
  int? secondOperand;
  dynamic result;

  void numberTapped(int tappedNumber) {
    if (firstOperand == null) {
      setState(() {
        firstOperand = tappedNumber;
      });
      return; //위에 코드가 실행되면 더 이상 실행되지 않게함
    }
    if (operator == null) {
      setState(() {
        firstOperand = int.parse("$firstOperand$tappedNumber");
      });
      return;
    }

    if (secondOperand == null) {
      setState(() {
        secondOperand = tappedNumber;
      });
      return;
    }

    setState(() {
      secondOperand = int.parse("$secondOperand$tappedNumber");
    });
  }

  void clearNumber() {
    setState(() {
      firstOperand = null;
      operator = null;
      secondOperand = null;
      result = null;
    });
  }

  void operatorTapped(String tappedOperator) {
    setState(() {
      operator = tappedOperator;
    });
  }

  String showText() {
    if (secondOperand != null) {
      return "$firstOperand$operator$secondOperand";
    }
    if (operator != null) {
      return "$firstOperand$operator";
    }
    if (firstOperand != null) {
      return "$firstOperand";
    }

    return "0";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: Align(
            alignment: Alignment.bottomRight,
            child: Text(
              showText(),
              style: const TextStyle(color: Colors.white),
            )),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                  child: TextButton(
                      onPressed: () {
                        numberTapped(7);
                      },
                      child: const Text("7"))),
              Expanded(
                  child: TextButton(
                      onPressed: () {
                        numberTapped(8);
                      },
                      child: const Text("8"))),
              Expanded(
                  child: TextButton(
                      onPressed: () {
                        numberTapped(9);
                      },
                      child: const Text("9"))),
              Expanded(
                  child: TextButton(
                      onPressed: () {
                        operatorTapped("%");
                      },
                      child: const Text("%"))),
            ],
          ),
          Row(
            children: [
              Expanded(
                  child: TextButton(
                      onPressed: () {
                        numberTapped(4);
                      },
                      child: const Text("4"))),
              Expanded(
                  child: TextButton(
                      onPressed: () {
                        numberTapped(5);
                      },
                      child: const Text("5"))),
              Expanded(
                  child: TextButton(
                      onPressed: () {
                        numberTapped(6);
                      },
                      child: const Text("6"))),
              Expanded(
                  child: TextButton(
                      onPressed: () {
                        operatorTapped("x");
                      },
                      child: const Text("x"))),
            ],
          ),
          Row(
            children: [
              Expanded(
                  child: TextButton(
                      onPressed: () {
                        numberTapped(1);
                      },
                      child: const Text("1"))),
              Expanded(
                  child: TextButton(
                      onPressed: () {
                        numberTapped(2);
                      },
                      child: const Text("2"))),
              Expanded(
                  child: TextButton(
                      onPressed: () {
                        numberTapped(3);
                      },
                      child: const Text("3"))),
              Expanded(
                  child: TextButton(
                      onPressed: () {
                        operatorTapped("-");
                      },
                      child: const Text("-"))),
            ],
          ),
          Row(
            children: [
              Expanded(
                  child: TextButton(
                      onPressed: () {
                        clearNumber();
                      },
                      child: const Text("C"))),
              Expanded(
                  child: TextButton(
                      onPressed: () {
                        numberTapped(0);
                      },
                      child: const Text("0"))),
              Expanded(
                  child: TextButton(
                      onPressed: () {
                        operatorTapped("=");
                      },
                      child: const Text("="))),
              Expanded(
                  child: TextButton(
                      onPressed: () {
                        operatorTapped("+");
                      },
                      child: const Text("+"))),
            ],
          ),
        ],
      ),
    );
  }
}
