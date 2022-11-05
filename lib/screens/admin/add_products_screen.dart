import 'dart:io';

import 'package:bubu_market/constants/utils.dart';

import 'package:bubu_market/widgets/auth_widgets/long_button.dart';
import 'package:bubu_market/widgets/general_widgets/loader.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../services/admin_services.dart';
import '../../widgets/general_widgets/custom_text_field.dart';

class AddPRoductsScreen extends StatefulWidget {
  const AddPRoductsScreen({super.key});

  @override
  State<AddPRoductsScreen> createState() => _AddPRoductsScreenState();
}

class _AddPRoductsScreenState extends State<AddPRoductsScreen> {
  final AdminServices adminServices = AdminServices();
  String category = 'Mobiles';
  bool isLoading = false;
  List<File> images = [];
  final _addProductFormKey = GlobalKey<FormState>();
  final TextEditingController productNameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();

  @override
  void dispose() {
    productNameController.dispose();
    descriptionController.dispose();
    priceController.dispose();
    productNameController.dispose();
    super.dispose();
  }

  void sellProduct() {
    if (_addProductFormKey.currentState!.validate() && images.isNotEmpty) {
      adminServices.sellProduct(
        context: context,
        name: productNameController.text,
        description: descriptionController.text,
        price: double.parse(priceController.text),
        quantity: double.parse(quantityController.text),
        category: category,
        images: images,
        onSuccess: () {
           showSnackBar(context, 'Product Added Successfully!',
              color: GlobalVariables.colorAccent,
              textColor: GlobalVariables.colorSecondary);
          
          Navigator.pop(context);
          
        }
      );
    }
  }

  List<String> productCategories = [
    'Mobiles',
    'Essentials',
    'Appliances',
    'Books',
    'Fashion',
  ];
  void selectImages() async {
    var res = await pickImages();
    setState(() {
      images = res;
    });
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          elevation: 0,
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              color: GlobalVariables.colorPrimary,
            ),
          ),
          title: const Text(
            'Add Product',
            style: TextStyle(color: GlobalVariables.colorSecondary),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _addProductFormKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10.0,
            ),
            child: Column(children: [
              const SizedBox(
                height: 20,
              ),
              images.isNotEmpty
                  ? CarouselSlider(
                      items: images.map(
                        (i) {
                          return Builder(
                            builder: (BuildContext context) => Image.file(
                              i,
                              fit: BoxFit.cover,
                              height: 200,
                            ),
                          );
                        },
                      ).toList(),
                      options: CarouselOptions(
                        viewportFraction: 1,
                        height: 200,
                        autoPlay: false,
                      ),
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
                            borderRadius: BorderRadius.circular(10),
                          ),
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
                                    fontSize: 15, color: Colors.grey.shade400),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
              const SizedBox(
                height: 30,
              ),
              CustomTextField(
                  controller: productNameController, hintText: 'Product Name'),
              const SizedBox(
                height: 10,
              ),
              CustomTextField(
                controller: descriptionController,
                hintText: 'Description',
                maxLines: 7,
              ),
              const SizedBox(
                height: 10,
              ),
              CustomTextField(
                controller: priceController,
                hintText: 'Price',
                keyboardtype: TextInputType.number,
              ),
              const SizedBox(
                height: 10,
              ),
              CustomTextField(
                controller: quantityController,
                hintText: 'Quantity',
                keyboardtype: TextInputType.number,
              ),
              SizedBox(
                width: double.infinity,
                child: DropdownButton(
                    dropdownColor: GlobalVariables.colorPrimary,
                    value: category,
                    icon: const Icon(Icons.keyboard_arrow_down),
                    items: productCategories.map((String item) {
                      return DropdownMenuItem(
                          value: item,
                          child: Text(
                            item,
                          ));
                    }).toList(),
                    onChanged: (String? newVal) {
                      setState(() {
                        category = newVal!;
                      });
                    }),
              ),
              const SizedBox(
                height: 10,
              ),
              LongButton(
                  color: isLoading
                      ? GlobalVariables.colorPrimary.withOpacity(0.5)
                      : GlobalVariables.colorPrimary,
                  func: () async {
                    if (_addProductFormKey.currentState!.validate() &&
                        isLoading == false) {
                      setState(() => isLoading = true);
                      
                      sellProduct();
                      await Future.delayed(
                        const Duration(seconds: 5),
                      );
                    }
                  },
                  child:  isLoading
                                ? Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const CustomLoader(),
                                      const SizedBox(width: 24),
                                      Text(
                                        'Please Wait....',
                                        style: textTheme.headlineMedium
                                            ?.copyWith(
                                                color: GlobalVariables
                                                    .colorSecondary),
                                      ),
                                    ],
                                  )
                                : Text(
                                    'Sell Product',
                                    style: textTheme.headlineMedium?.copyWith(
                                        color: GlobalVariables.colorSecondary),
                                  )),
            ]),
          ),
        ),
      ),
    );
  }
}
