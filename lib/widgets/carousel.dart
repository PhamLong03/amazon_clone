import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class Carousel extends StatelessWidget {
  const Carousel({super.key, required this.list});
  final List<dynamic> list;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 200,
        viewportFraction:
            MediaQuery.sizeOf(context).width > MediaQuery.sizeOf(context).height
                ? 0.32
                : 1,
        autoPlay: true,
      ),
      items: list.map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 5.0),
              child: Image.network(
                i,
                fit: BoxFit.cover,
                height: 200,
              ),
            );
          },
        );
      }).toList(),
    );
  }
}
