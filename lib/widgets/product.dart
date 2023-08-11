import 'package:flutter/material.dart';

class Product extends StatelessWidget {
  const Product({super.key, required this.src});
  final String src;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: DecoratedBox(
        decoration: BoxDecoration(
          border: Border.all(
            width: 1.5,
            color: Colors.black,
          ),
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: Container(
          width: 180,
          padding: const EdgeInsets.all(10),
          child: Image.network(
            src,
            fit: BoxFit.fitHeight,
            width: 180,
          ),
        ),
      ),
    );
  }
}
