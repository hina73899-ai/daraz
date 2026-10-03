import 'package:daraz/models/product_models.dart';
import 'package:daraz/services/api_services.dart';
import 'package:flutter/material.dart';

class Jewelery extends StatefulWidget {
  const Jewelery({super.key});

  @override
  State<Jewelery> createState() => _JeweleryState();
}

class _JeweleryState extends State<Jewelery> {
  final ApiServices _apiServices = ApiServices();
  List<ProductModels> _jeweleryProducts = [];
  bool _isLoading = true;
  String _error = '';

  @override
  void initState() {
    super.initState();
    _fetchJewelery();
  }

  Future<void> _fetchJewelery() async {
    try {

      final products = await _apiServices.fetchProductsByCategory("jewelery");
      if (mounted) {
        setState(() {
          _jeweleryProducts = products;
          _isLoading = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _error = e.toString();
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Center(child: CircularProgressIndicator(color: Colors.deepOrange));
    }

    if (_error.isNotEmpty) {
      return Center(
        child: Text(
          _error,
          style: const TextStyle(color: Colors.red, fontSize: 16),
        ),
      );
    }

    return Padding(padding: EdgeInsets.all(10),
    child: Column(
      children: [
        Row(
            children: [
              const Text(
                "New Arrivals",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(width: 4),
              const Icon(Icons.local_fire_department, color: Colors.orange),
              const Spacer(),
              TextButton(
                onPressed: () {},
                child: const Text("See All"),
              ),
            ]        ),
        SizedBox(height: 10,),
        Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(8.0),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.75,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
              itemCount: _jeweleryProducts.length,
              itemBuilder: (context, index) {
                final product = _jeweleryProducts[index];
                return Card(
                  elevation: 2,
                  child: Column(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.network(
                            product.image,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4.0),
                        child: Text(
                          product.title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(fontWeight: FontWeight.w600),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 4.0),
                        child: Text(
                          "\$${product.price}",
                          style: const TextStyle(
                            color: Colors.deepOrange,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ))
      ],
    ),);
  }
}