import 'dart:io';
import 'package:amazon_admin_panel/features/admin/services/admin_services.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:amazon_admin_panel/common/widgets/custom_button.dart';
import 'package:amazon_admin_panel/common/widgets/custom_textfield.dart';
import 'package:amazon_admin_panel/constants/util.dart';
import 'package:flutter/material.dart';
import '../../../constants/global_variable.dart';
import 'package:dotted_border/dotted_border.dart';

class AddProductScreen extends StatefulWidget {
  static const String routeName = '/add-product';
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final TextEditingController ProductNameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();
  final AdminServices adminServices = AdminServices();

  String category = 'Mobiles';
  List<File> images = [];
  final _addProductFormKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    ProductNameController.dispose();
    descriptionController.dispose();
    priceController.dispose();
    quantityController.dispose();
  }

  List<String> productCategories = [
    'Mobiles',
    'Essentials',
    'Appliances',
    'Books',
    'Fashion',
  ];

  void sellProduct() {
    if(_addProductFormKey.currentState!.validate() && images.isNotEmpty) {
      adminServices.sellProduct(
        context: context, 
      name: ProductNameController.text, 
      description: descriptionController.text, 
      price: double.parse(priceController.text),
      quantity: double.parse(quantityController.text), 
      category: category, 
      images: images
      );
    }
  }

  void selectImages() async {
    var res = await pickImages();
    setState(() {
      images = res;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
            flexibleSpace: Container(
              decoration: const BoxDecoration(
                gradient: GlobalVariable.appBarGradient,
              ),
            ),
            title: const Text(
              'Add Product ',
              style: TextStyle(
                color: Colors.black,
              ),
            )),
      ),
      body: SingleChildScrollView(
          child: Form(
            key: _addProductFormKey,
              child: Column(
        children: [
          images.isNotEmpty
              ? CarouselSlider(
                  items: images.map((i) {
                    return Builder(
                        builder: (BuildContext context) => Image.file(
                              i,
                              fit: BoxFit.cover,
                              height: 200,
                            ));
                  }).toList(),
                  options: CarouselOptions(viewportFraction: 1, height: 200),
                )
              : GestureDetector(
                  onTap: selectImages,
                  child: DottedBorder(
                      borderType: BorderType.RRect,
                      radius: const Radius.circular(10),
                      dashPattern: const [10, 4],
                      strokeCap: StrokeCap.round,
                      child: Container(
                        width: double.infinity,
                        height: 150,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.folder_open,
                                size: 40,
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Text(
                                'Select Product Images',
                                style: TextStyle(
                                  color: Colors.grey.shade400,
                                  fontSize: 15,
                                ),
                              )
                            ],
                          ),
                        ),
                      )),
                ),
          const SizedBox(
            height: 30,
          ),
          CustomTextField(
              controller: ProductNameController, hintText: 'Product Name'),
          CustomTextField(
            controller: descriptionController,
            hintText: 'Description',
            maxLine: 7,
          ),
          CustomTextField(controller: priceController, hintText: 'Price'),
          CustomTextField(controller: quantityController, hintText: 'Quantity'),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            width: double.infinity,
            child: DropdownButton(
              value: category,
              icon: const Icon(Icons.keyboard_arrow_down),
              items: productCategories.map((String item) {
                return DropdownMenuItem(
                  child: Text(item),
                  value: item,
                );
              }).toList(),
              onChanged: (String? newVal) {
                setState(() {
                  category = newVal!;
                });
              },
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          CustomButton(text: 'Sell', onTap: sellProduct)
        ],
      ))),
    );
  }
}
