import 'package:flutter/material.dart';

class CircleButton extends StatelessWidget {
  final String padnumber;
  final void Function() onTap;
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
