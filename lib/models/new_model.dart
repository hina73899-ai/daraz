import 'package:daraz/view_models/product_view_models.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/electronics.dart';
import '../widgets/jewelery.dart';
import '../widgets/shirts.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  String selectedCategory = 'All';

  @override
  void initState() {
    super.initState();
    Future.microtask(() =>
        Provider.of<ProductViewModels>(context, listen: false)
            .fetchCategoriesByProducts());
  }

  @override
  Widget build(BuildContext context) {
    final viewModels = Provider.of<ProductViewModels>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: Row(
          children: [
            const Text(
              "Daraz",
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
            const SizedBox(width: 50),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _categoryButton("Jewelery", () {
                      setState(() {
                        selectedCategory = "Jewelery";
                      });
                    }),
                    const SizedBox(width: 8),
                    _categoryButton("Electronics", () {
                      setState(() {
                        selectedCategory = "Electronics";
                      });
                    }),
                    const SizedBox(width: 8),
                    _categoryButton("Shirts", () {
                      setState(() {
                        selectedCategory = "Shirts";
                      });
                    }),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            if (selectedCategory == 'Shirts')
              const Shirts()
            else if (selectedCategory == "Jewelery")
              const Jewelery()
            else if (selectedCategory == "Electronics")
                const Electronics()
              else if (viewModels.isLoading)
                  const Center(
                    child: CircularProgressIndicator(),)
                else
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, childAspectRatio: 0.8,
                      crossAxisSpacing: 10, mainAxisSpacing: 10,),
                    itemCount: viewModels.products.length,
                    itemBuilder: (context, index) {
                      final product = viewModels.products[index];
                      return Card(
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Center(
                                  child: Image.network(
                                    product.image, fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                product.title,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                "\$${product.price}",
                                style: const TextStyle(
                                  color: Colors.deepOrange,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
          ],
        ),
      ),
    );
  }

  Widget _categoryButton(String title, VoidCallback onPressed) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        shadowColor: Colors.black12,
        backgroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 13,
        ),
      ),
    );
  }
}