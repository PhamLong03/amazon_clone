import 'package:amazon_clone/widgets/screens/admin/add_product_screen.dart';
import 'package:flutter/material.dart';

class PostsScreen extends StatefulWidget {
  const PostsScreen({super.key});
  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
  TextEditingController productNameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController quantityController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    productNameController.dispose();
    descriptionController.dispose();
    priceController.dispose();
    quantityController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Text('prodcut'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // _dialogBuilder(
          //   context: context,
          //   productNameEditingController: productNameController,
          //   descriptionEditingController: descriptionController,
          //   priceEditingController: priceController,
          //   quantityEditingController: quantityController,
          //   categories: GlobalVariables.categories,
          //   category: category,
          // );
          showDialog(
            context: context,
            builder: (context) {
              return const AddProductScreen();
            },
          );
        },
        tooltip: 'Add a product',
        child: const Icon(Icons.add),
      ),
    );
  }
}

// _dialogBuilder(
//     {required BuildContext context,
//     required TextEditingController productNameEditingController,
//     required TextEditingController descriptionEditingController,
//     required TextEditingController priceEditingController,
//     required TextEditingController quantityEditingController,
//     required List<String> categories,
//     required String category}) {
//   return showDialog<void>(
//     context: context,
//     builder: (BuildContext context) {
//       return AlertDialog(
//         title: const Text('Add new product'),
//         content: Container(
//           width: MediaQuery.sizeOf(context).width,
//           height: MediaQuery.sizeOf(context).height,
//           child: SingleChildScrollView(
//             child: Form(
//               child: Column(
//                 children: [
//                   DottedBorder(
//                     borderType: BorderType.RRect,
//                     radius: const Radius.circular(10),
//                     dashPattern: const [10, 8],
//                     strokeWidth: 2,
//                     child: Container(
//                       width: double.infinity,
//                       height: 200,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(80),
//                       ),
//                       child: const Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Icon(
//                             Icons.folder_open_outlined,
//                             size: 40,
//                           ),
//                           Text(
//                             'Browse product images',
//                             style: TextStyle(
//                               fontSize: 17,
//                               color: Colors.black45,
//                               fontWeight: FontWeight.w600,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 15),
//                   CustomTextField(
//                     textEditingController: productNameEditingController,
//                     hintText: 'Product Name',
//                     padding: 0,
//                   ),
//                   const SizedBox(height: 15),
//                   CustomTextField(
//                     textEditingController: descriptionEditingController,
//                     hintText: 'Descripton',
//                     padding: 0,
//                     maxLine: 6,
//                   ),
//                   const SizedBox(height: 15),
//                   CustomTextField(
//                     textEditingController: priceEditingController,
//                     hintText: 'Price',
//                     padding: 0,
//                   ),
//                   const SizedBox(height: 15),
//                   CustomTextField(
//                     textEditingController: quantityEditingController,
//                     hintText: 'Quantity',
//                     padding: 0,
//                   ),
//                   const SizedBox(height: 15),
//                   SizedBox(
//                     width: double.infinity,
//                     child: DropdownButton(
//                       value: category,
//                       items: categories.map((value) {
//                         return DropdownMenuItem(child: Text(value));
//                       }).toList(),
//                       onChanged: (value) {
//                         category = value!;
//                       },
//                       icon: const Icon(Icons.arrow_drop_down_outlined),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//         actions: <Widget>[
//           TextButton(
//             style: TextButton.styleFrom(
//               textStyle: Theme.of(context).textTheme.labelLarge,
//             ),
//             child: const Text('Cancel'),
//             onPressed: () {
//               Navigator.of(context).pop();
//             },
//           ),
//           TextButton(
//             style: TextButton.styleFrom(
//               textStyle: Theme.of(context).textTheme.labelLarge,
//             ),
//             child: const Text('Sell'),
//             onPressed: () {
//               Navigator.of(context).pop();
//             },
//           ),
//         ],
//       );
//     },
//   );
// }
