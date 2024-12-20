import 'package:flutter/material.dart';

class CircleButton extends StatelessWidget {
  final String padnumber; //생성자를 사용해서 코드리펙토링 보다 유지보수가 쉽게함
  final void Function()
      onTap; // 매개변수가 없게하는 생성자라 매개변수가 있는 함수를 받은다면 () =>같은 람다식을 사용
  const CircleButton({super.key, required this.padnumber, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Ink(
        decoration:
            const BoxDecoration(color: Colors.blueGrey, shape: BoxShape.circle),
        child: InkWell(
          customBorder: const CircleBorder(),
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.all(7),
            alignment: Alignment.center,
            child: Text(padnumber,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold)),
          ),
        ),
      ),
    );
  }
}
