import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.text, this.onClick});
  final String text;
  final VoidCallback? onClick;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ElevatedButton(
        onPressed: onClick,
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(double.infinity, 60.0),
        ),
        child: Text(text),
      ),
    );
  }
}
