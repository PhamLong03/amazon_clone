import 'package:amazon_clone/constants/global_var.dart';
import 'package:amazon_clone/providers/user_provider.dart';
import 'package:amazon_clone/widgets/address_box.dart';
import 'package:amazon_clone/widgets/carousel.dart';
import 'package:amazon_clone/widgets/categories_list.dart';
import 'package:amazon_clone/widgets/deal_of_day.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _searchEditingController = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    _searchEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          flexibleSpace: Container(
            decoration:
                const BoxDecoration(gradient: GlobalVariables.appBarGradient),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 15),
                  height: 42,
                  child: Material(
                    borderRadius: BorderRadius.circular(7),
                    elevation: 2,
                    child: TextFormField(
                      controller: _searchEditingController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: InkWell(
                          onTap: () {},
                          child: const Padding(
                            padding: EdgeInsets.only(left: 6.0),
                            child: Icon(
                              Icons.search,
                              color: Colors.black,
                              size: 23,
                            ),
                          ),
                        ),
                        hintText: 'Search Amazon.in',
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(right: 15),
                child: const Icon(Icons.mic),
              )
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const AddressBox(),
            const SizedBox(height: 10),
            const CategoriesList(),
            const Carousel(list: GlobalVariables.carouselImages),
            const DealOfDay(),
            Text(user.toJson()),
          ],
        ),
      ),
    );
  }
}
