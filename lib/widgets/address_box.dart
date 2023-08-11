import 'package:amazon_clone/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddressBox extends StatelessWidget {
  const AddressBox({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    return Container(
      height: 40,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 114, 226, 221),
            Color.fromARGB(255, 163, 236, 233),
          ],
          stops: [
            0.5,
            1.0,
          ],
        ),
      ),
      child: Row(
        children: [
          const SizedBox(width: 5),
          const Icon(Icons.location_on_outlined, size: 20),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 30),
              child: Text(
                'Delivery to ${user.name} - ${user.address}',
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          const Icon(Icons.arrow_drop_down_rounded),
          const SizedBox(width: 5),
        ],
      ),
    );
  }
}
