import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.textEditingController,
    required this.hintText,
    this.icon,
    this.padding,
    this.maxLine,
  });
  final TextEditingController textEditingController;
  final String hintText;
  final Icon? icon;
  final double? padding;
  final int? maxLine;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(padding ?? 10.0),
      child: TextFormField(
        controller: textEditingController,
        decoration: InputDecoration(
          prefixIcon: icon,
          hintText: hintText,
          border: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black38,
            ),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black38,
            ),
          ),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Enter your $hintText';
          }
          return null;
        },
        maxLines: maxLine ?? 1,
      ),
    );
  }
}
