import 'package:amazon_clone/widgets/customs/custom_textfield.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

const List<String> categories = [
  'Mobiles',
  'Essentials',
  'Appliances',
  'Fashion',
  'Video Games',
  'Electronics',
  'Electronics',
  'Electronics',
  'Electronics',
  'Electronics',
  'Electronics',
  'Electronics',
];

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  TextEditingController productNameEditingController = TextEditingController();
  TextEditingController descriptionEditingController = TextEditingController();
  TextEditingController priceEditingController = TextEditingController();
  TextEditingController quantityEditingController = TextEditingController();

  String category = categories.first;

  @override
  void dispose() {
    super.dispose();
    productNameEditingController.dispose();
    descriptionEditingController.dispose();
    priceEditingController.dispose();
    quantityEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Add new product'),
      content: SizedBox(
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height,
        child: SingleChildScrollView(
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DottedBorder(
                  borderType: BorderType.RRect,
                  radius: const Radius.circular(10),
                  dashPattern: const [10, 8],
                  strokeWidth: 2,
                  child: Container(
                    width: double.infinity,
                    height: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(80),
                    ),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.folder_open_outlined,
                          size: 40,
                        ),
                        Text(
                          'Browse product images',
                          style: TextStyle(
                            fontSize: 17,
                            color: Colors.black45,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                CustomTextField(
                  textEditingController: productNameEditingController,
                  hintText: 'Product Name',
                  padding: 0,
                ),
                const SizedBox(height: 15),
                CustomTextField(
                  textEditingController: descriptionEditingController,
                  hintText: 'Descripton',
                  padding: 0,
                  maxLine: 6,
                ),
                const SizedBox(height: 15),
                CustomTextField(
                  textEditingController: priceEditingController,
                  hintText: 'Price',
                  padding: 0,
                ),
                const SizedBox(height: 15),
                CustomTextField(
                  textEditingController: quantityEditingController,
                  hintText: 'Quantity',
                  padding: 0,
                ),
                const SizedBox(height: 15),
                const Text('Category'),
                Container(
                  width: double.infinity,
                  height: 600,
                  decoration: BoxDecoration(
                    border: Border.all(),
                  ),
                  child: Center(
                    child: GridView.builder(
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: MediaQuery.sizeOf(context).width >
                                MediaQuery.sizeOf(context).height
                            ? 6
                            : 3,
                        childAspectRatio: MediaQuery.sizeOf(context).width >
                                MediaQuery.sizeOf(context).height
                            ? 5
                            : 2,
                      ),
                      itemCount: categories.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Radio<String>(
                              value: categories[index],
                              groupValue: category,
                              onChanged: (value) {
                                print(categories[index]);
                                setState(() {
                                  category = categories[index];
                                });
                              },
                            ),
                            Text(
                              categories[index],
                              style: const TextStyle(fontSize: 12),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      actions: <Widget>[
        TextButton(
          style: TextButton.styleFrom(
            textStyle: Theme.of(context).textTheme.labelLarge,
          ),
          child: const Text('Cancel'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          style: TextButton.styleFrom(
            textStyle: Theme.of(context).textTheme.labelLarge,
          ),
          child: const Text('Sell'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
