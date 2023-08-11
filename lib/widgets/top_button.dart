import 'package:amazon_clone/widgets/customs/pill_button.dart';
import 'package:flutter/material.dart';

class TopButtons extends StatelessWidget {
  const TopButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            PillButton(
              text: 'Your orders',
              onTap: () {},
            ),
            PillButton(
              text: 'Your orders',
              onTap: () {},
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            PillButton(
              text: 'Your orders',
              onTap: () {},
            ),
            PillButton(
              text: 'Your orders',
              onTap: () {},
            ),
          ],
        ),
      ],
    );
  }
}
