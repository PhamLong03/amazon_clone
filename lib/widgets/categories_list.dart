import 'package:amazon_clone/constants/global_var.dart';
import 'package:flutter/material.dart';

class CategoriesList extends StatelessWidget {
  const CategoriesList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      color: Colors.white,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemExtent: 80,
        itemCount: GlobalVariables.categoryImages.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.asset(
                  GlobalVariables.categoryImages[index]['img']!,
                  fit: BoxFit.cover,
                  height: 40,
                  width: 40,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                GlobalVariables.categoryImages[index]['title']!,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 10),
              ),
            ],
          );
        },
      ),
    );
  }
}
