import 'package:calculate/circle_button.dart';
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
        //setState는 상태 반영하기 위해 사용하는 메소드
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
    if (result != null) {
      return "$result";
    }

    if (secondOperand != null) {
      return "$firstOperand\t$operator $secondOperand";
    }
    if (operator != null) {
      return "$firstOperand\t$operator";
    }
    if (firstOperand != null) {
      return "$firstOperand";
    }

    return "0";
  }

  void calculateResult() {
    if (firstOperand == null || secondOperand == null) {
      return; //이 if문 실행하면 더 이상 코드 진행하지 않게하는 코드
    }
    if (operator == "+") {
      plusNumber();
      return;
    }
    if (operator == "-") {
      minusNumber();
      return;
    }
    if (operator == "x") {
      multiplyNumber();
      return;
    }
    if (operator == "%") {
      divideNumber();
      return;
    }
  }

  void plusNumber() {
    setState(() {
      result = firstOperand! + secondOperand!; // !는 null허용 x
    });
  }

  void minusNumber() {
    setState(() {
      result = firstOperand! - secondOperand!;
    });
  }

  void multiplyNumber() {
    setState(() {
      result = firstOperand! * secondOperand!;
    });
  }

  void divideNumber() {
    setState(() {
      result = firstOperand! / secondOperand!;
    });
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
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              CircleButton(
                  padnumber: "7",
                  onTap: () => numberTapped(
                      7)), //lamda식을 사용헤서 onTap같이 (매개변수가 없는 void함수에게 매개변수가 있는 메소드도 사용할 수 있게 함
              CircleButton(padnumber: "8", onTap: () => numberTapped(8)),
              CircleButton(padnumber: "9", onTap: () => numberTapped(9)),
              CircleButton(padnumber: "%", onTap: () => operatorTapped("%")),
            ],
          ),
          Row(
            children: [
              CircleButton(padnumber: "4", onTap: () => numberTapped(4)),
              CircleButton(padnumber: "5", onTap: () => numberTapped(5)),
              CircleButton(padnumber: "6", onTap: () => numberTapped(6)),
              CircleButton(padnumber: "x", onTap: () => operatorTapped("x")),
            ],
          ),
          Row(
            children: [
              CircleButton(padnumber: "1", onTap: () => numberTapped(1)),
              CircleButton(padnumber: "2", onTap: () => numberTapped(2)),
              CircleButton(padnumber: "3", onTap: () => numberTapped(3)),
              CircleButton(padnumber: "-", onTap: () => operatorTapped("-")),
            ],
          ),
          Row(
            children: [
              CircleButton(
                  padnumber: "C",
                  onTap: clearNumber), // clearnumber함수는 매개변수가 없으므로 lamda사용안해도 됨
              CircleButton(padnumber: "0", onTap: () => numberTapped(0)),
              CircleButton(padnumber: "=", onTap: calculateResult),
              CircleButton(padnumber: "+", onTap: () => operatorTapped("+")),
            ],
          ),
        ],
      ),
    );
  }
}
