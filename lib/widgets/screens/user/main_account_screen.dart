import 'package:amazon_clone/constants/global_var.dart';
import 'package:amazon_clone/widgets/below_appbar.dart';
import 'package:amazon_clone/widgets/orders.dart';
import 'package:amazon_clone/widgets/top_button.dart';
import 'package:flutter/material.dart';

class MainAccountScreen extends StatelessWidget {
  const MainAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          flexibleSpace: Container(
            decoration:
                const BoxDecoration(gradient: GlobalVariables.appBarGradient),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                alignment: Alignment.centerLeft,
                child: Image.asset(
                  'assets/images/amazon_in.png',
                  width: 120,
                  height: 40,
                ),
              ),
              const Row(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Icon(Icons.search),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Icon(Icons.notifications),
                  ),
                  SizedBox(width: 20),
                ],
              ),
            ],
          ),
        ),
      ),
      body: const Column(
        children: [
          BelowAppbar(),
          TopButtons(),
          Orders(),
        ],
      ),
    );
  }
}
