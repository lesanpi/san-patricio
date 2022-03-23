import 'package:flutter/material.dart';
import 'package:san_patricio/utils/constants.dart';

class AddToCartButton extends StatelessWidget {
  const AddToCartButton({Key? key, required this.onTap, this.size = 100})
      : super(key: key);
  final VoidCallback onTap;
  final double size;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(size * 0.5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: buttonColor,
        ),
        child: const Center(
          child: Icon(
            Icons.shopping_cart_outlined,
            color: Colors.white,
            size: 30,
          ),
        ),
      ),
    );
  }
}
