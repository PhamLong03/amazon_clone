import 'package:flutter/material.dart';

class PillButton extends StatelessWidget {
  const PillButton({super.key, required this.text, required this.onTap});
  final String text;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        height: 40,
        decoration: BoxDecoration(
          border: Border.all(width: 0.0, color: Colors.white),
          color: Colors.white,
          borderRadius: BorderRadius.circular(40),
        ),
        child: OutlinedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black12.withOpacity(0.03),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40),
                )),
            child: Text(
              text,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
            )),
      ),
    );
  }
}
