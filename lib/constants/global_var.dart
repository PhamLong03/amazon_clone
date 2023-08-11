import 'package:flutter/material.dart';

String uri = 'http://localhost:3000';

class GlobalVariables {
  static const appBarGradient = LinearGradient(
    colors: [
      Color.fromARGB(255, 29, 201, 192),
      Color.fromARGB(255, 125, 221, 216),
    ],
    stops: [0.5, 1.0],
  );
  static const List<String> carouselImages = [
    'https://images-eu.ssl-images-amazon.com/images/G/31/img21/Wireless/WLA/TS/D37847648_Accessories_savingdays_Jan22_Cat_PC_1500.jpg',
    'https://images-eu.ssl-images-amazon.com/images/G/31/img2021/Vday/bwl/English.jpg',
    'https://images-eu.ssl-images-amazon.com/images/G/31/img22/Wireless/AdvantagePrime/BAU/14thJan/D37196025_IN_WL_AdvantageJustforPrime_Jan_Mob_ingress-banner_1242x450.jpg',
    'https://images-na.ssl-images-amazon.com/images/G/31/Symbol/2020/00NEW/1242_450Banners/PL31_copy._CB432483346_.jpg',
    'https://images-na.ssl-images-amazon.com/images/G/31/img21/shoes/September/SSW/pc-header._CB641971330_.jpg',
  ];

  static const secondaryColor = Color.fromRGBO(255, 153, 0, 1);
  static const backgroundColor = Colors.white;
  static const Color greyBackgroundCOlor = Color(0xffebecee);
  static var selectedNavBarColor = Colors.cyan[800]!;
  static const unselectedNavBarColor = Colors.black87;

  static const List<String> categories = [
    'Mobiles',
    'Essentials',
    'Appliances',
    'Fashion',
    'Video Games',
    'Electronics'
  ];
  static const List<Map<String, String>> categoryImages = [
    {
      'title': 'Mobiles',
      'img': 'assets/images/mobiles.jpeg',
    },
    {
      'title': 'Appliances',
      'img': 'assets/images/appliances.png',
    },
    {
      'title': 'Electronics',
      'img': 'assets/images/electronics.jpeg',
    },
    {
      'title': 'Fashion',
      'img': 'assets/images/fashion.jpeg',
    },
    {
      'title': 'Essentials',
      'img': 'assets/images/essentials.jpeg',
    },
    {
      'title': 'Video Games',
      'img': 'assets/images/games.jpeg',
    },
    {
      'title': 'Video Games',
      'img': 'assets/images/games.jpeg',
    },
    {
      'title': 'Video Games',
      'img': 'assets/images/games.jpeg',
    },
    {
      'title': 'Video Games',
      'img': 'assets/images/games.jpeg',
    },
    {
      'title': 'Video Games',
      'img': 'assets/images/games.jpeg',
    },
    {
      'title': 'Video Games',
      'img': 'assets/images/games.jpeg',
    },
    {
      'title': 'Video Games',
      'img': 'assets/images/games.jpeg',
    },
  ];

  static const List<Map<String, String>> dealsOfDay = [
    {
      'name':
          'Laptop Apple MacBook Air 13 inch M1 2020 8-core CPU/8GB/256GB/7-core GPU (MGN63SA/A)',
      'price': '18.990.000',
      'img':
          'https://cdn.tgdd.vn/Products/Images/44/231244/macbook-air-m1-2020-gray-600x600.jpg',
    },
    {
      'name':
          'Laptop Apple MacBook Air 13 inch M1 2020 8-core CPU/8GB/256GB/7-core GPU (MGN63SA/A)',
      'price': '18.990.000',
      'img':
          'https://cdn.tgdd.vn/Products/Images/44/231244/macbook-air-m1-2020-gray-600x600.jpg',
    },
    {
      'name':
          'Laptop Apple MacBook Air 13 inch M1 2020 8-core CPU/8GB/256GB/7-core GPU (MGN63SA/A)',
      'price': '18.990.000',
      'img':
          'https://cdn.tgdd.vn/Products/Images/44/231244/macbook-air-m1-2020-gray-600x600.jpg',
    },
    {
      'name':
          'Laptop Apple MacBook Air 13 inch M1 2020 8-core CPU/8GB/256GB/7-core GPU (MGN63SA/A)',
      'price': '18.990.000',
      'img':
          'https://cdn.tgdd.vn/Products/Images/44/231244/macbook-air-m1-2020-gray-600x600.jpg',
    },
    {
      'name':
          'Laptop Apple MacBook Air 13 inch M1 2020 8-core CPU/8GB/256GB/7-core GPU (MGN63SA/A)',
      'price': '18.990.000',
      'img':
          'https://cdn.tgdd.vn/Products/Images/44/231244/macbook-air-m1-2020-gray-600x600.jpg',
    },
    {
      'name':
          'Laptop Apple MacBook Air 13 inch M1 2020 8-core CPU/8GB/256GB/7-core GPU (MGN63SA/A)',
      'price': '18.990.000',
      'img':
          'https://cdn.tgdd.vn/Products/Images/44/231244/macbook-air-m1-2020-gray-600x600.jpg',
    },
  ];
}
