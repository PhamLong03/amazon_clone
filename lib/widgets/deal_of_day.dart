import 'package:amazon_clone/constants/global_var.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class DealOfDay extends StatefulWidget {
  const DealOfDay({super.key});

  @override
  State<DealOfDay> createState() => _DealOfDayState();
}

class _DealOfDayState extends State<DealOfDay> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.only(top: 15, left: 5),
          child: const Text('Deal of day'),
        ),
        CarouselSlider(
          options: CarouselOptions(
            height: 300,
            viewportFraction: MediaQuery.sizeOf(context).width >
                    MediaQuery.sizeOf(context).height
                ? 0.2
                : 1,
            autoPlay: true,
          ),
          items: GlobalVariables.dealsOfDay.map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                    width: 300,
                    margin: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.network(
                          i['img']!,
                          fit: BoxFit.cover,
                          height: 200,
                        ),
                        Text(
                          i['name']!,
                          textAlign: TextAlign.left,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                        Text(
                          i['price']!,
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ));
              },
            );
          }).toList(),
        ),
      ],
    );
  }
}
