import 'package:flutter/material.dart';
import 'package:san_patricio/utils/constants.dart';

class CountBallon extends StatelessWidget {
  const CountBallon({
    required this.value,
    this.size = 50,
    this.color = buttonColor,
    this.fontSize = 20,
  });

  final int value;
  final double size;
  final double fontSize;
  final Color color;

  @override
  Widget build(BuildContext context) {
    if (value <= 0) return const SizedBox.shrink();

    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(size),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            spreadRadius: 1.0,
            blurRadius: 1.0,
            offset: Offset(1.0, 1.0),
          )
        ],
      ),
      child: Center(
        child: Text(
          value.toString(),
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
