import 'package:flutter/material.dart';

class CircleButton extends StatelessWidget {
  const CircleButton(
      {Key? key, required this.text, required this.size, required this.onTap})
      : super(key: key);
  final String text;
  final VoidCallback onTap;
  final double size;

  @override
  Widget build(BuildContext context) {
    final _borderRadius = BorderRadius.circular(size);
    return InkWell(
      onTap: onTap,
      borderRadius: _borderRadius,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: _borderRadius,
          // shape: BoxShape.circle,
          boxShadow: const [
            BoxShadow(
                color: Colors.black26,
                spreadRadius: 3.0,
                blurRadius: 5.0,
                offset: Offset(1.0, 3.0))
          ],
        ),
        padding: EdgeInsets.all(size * 0.1),
        width: size,
        height: size,
        child: Center(
          child: Text(
            text,
            style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w900),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
