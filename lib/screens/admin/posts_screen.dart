import 'package:bubu_market/constants/colors.dart';
import 'package:bubu_market/router/route_generator.dart';
import 'package:bubu_market/services/admin_services.dart';
import 'package:flutter/material.dart';

import '../../models/products.dart';
import '../../widgets/general_widgets/loader.dart';

class PostsScreen extends StatefulWidget {
  const PostsScreen({super.key});

  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
  List<Product>? products;
  final AdminServices adminServices = AdminServices();

  @override
  void initState() {
    super.initState();
    fetchAllProducts();
  }

  fetchAllProducts() async {
    products = await adminServices.fetchAllProducts(context);
    setState(() {});
  }

  void deleteProduct(Product product, int index) {
    adminServices.deleteProduct(
      context: context,
      product: product,
      onSuccess: () {
        products!.removeAt(index);
        setState(() {});
      },
    );
  }

  void navigateToAddProduct() {
    Navigator.pushNamed(
      context,
      RouteGenerator.addPostsScreen,
    ).then((value) => _reload(value));
    setState(() {});
  }

  String formatAmount(String amount) {
    String price = amount;
    String priceInText = "";
    int counter = 0;
    for (int i = (price.length - 1); i >= 0; i--) {
      counter++;
      String str = price[i];
      if ((counter % 3) != 0 && i != 0) {
        priceInText = "$str$priceInText";
      } else if (i == 0) {
        priceInText = "$str$priceInText";
      } else {
        priceInText = ",$str$priceInText";
      }
    }
    return priceInText.trim();
  }

  @override
  Widget build(BuildContext context) {
    return products == null
        ? const Center(child: CustomLoader())
        : Scaffold(
            body: GridView.builder(
              shrinkWrap: true,
              itemCount: products!.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, childAspectRatio: 0.56),
              itemBuilder: (context, index) {
                final productData = products![index];
                return Container(
                  margin: const EdgeInsets.symmetric(
                    vertical: 5,
                    horizontal: 7,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          Container(
                            margin: const EdgeInsets.all(1),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.network(
                                productData.images[0],
                                height: 260,
                                width: 200,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 5,
                              right: 5,
                              top: 2.5,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                    color: GlobalVariables.colorAccent,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: const Text(
                                    '-50%',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: GlobalVariables.colorSecondary,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () =>
                                      deleteProduct(productData, index),
                                  child: const Icon(
                                    Icons.delete,
                                    color: Colors.red,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.only(
                          bottom: 8,
                          left: 5,
                        ),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          productData.name,
                          style: const TextStyle(
                            fontSize: 20,
                            color: GlobalVariables.colorSecondary,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(
                          left: 5,
                        ),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          productData.description,
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.black,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 10,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 5,
                              ),
                              child: Text(
                                "₦ ${formatAmount(productData.price.toString())}",
                                style: const TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.w900,
                                  color: GlobalVariables.colorSecondary,
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {},
                              child: const Padding(
                                padding: EdgeInsets.only(
                                  right: 5,
                                ),
                                child: Icon(
                                  Icons.shopping_cart_checkout,
                                  color: GlobalVariables.colorPrimary,
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: navigateToAddProduct,
              tooltip: 'Add a Product',
              child: const Icon(
                Icons.add,
                color: GlobalVariables.colorSecondary,
              ),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
            floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
          );
  }

  Future<void> _reload(var value) async {
    fetchAllProducts();
  }
}
