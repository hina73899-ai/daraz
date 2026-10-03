import 'package:daraz/models/product_models.dart';
import 'package:daraz/services/api_services.dart';
import 'package:flutter/material.dart';

class Shirts extends StatefulWidget {
  const Shirts({super.key});

  @override
  State<Shirts> createState() => _ShirtsState();
}

class _ShirtsState extends State<Shirts> {
  final ApiServices _apiServices = ApiServices();
  List<ProductModels> _shirtProducts = [];
  bool _isLoading = true;
  String _error = '';

  @override
  void initState() {
    super.initState();
    _fetchShirts();
  }

  Future<void> _fetchShirts() async {
    try {
      final products = await _apiServices.fetchProductsByCategory("men's clothing");
      if (mounted) {
        setState(() {
          _shirtProducts = products;
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
      return const Center(
        child: CircularProgressIndicator(color: Colors.deepOrange),
      );
    }

    if (_error.isNotEmpty) {
      return Center(
        child: Text(
          _error,
          style: const TextStyle(color: Colors.red, fontSize: 16),
        ),
      );
    }

    if (_shirtProducts.isEmpty) {
      return const Center(
        child: Text("No shirts available"),
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
            ]
        ),
        Expanded(child: GridView.builder(
          padding: const EdgeInsets.all(8.0),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.75,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
          ),
          itemCount: _shirtProducts.length,
          itemBuilder: (context, index) {
            final product = _shirtProducts[index];
            return Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.network(
                          product.image,
                          fit: BoxFit.contain,
                          errorBuilder: (context, error, stackTrace) =>
                          const Icon(Icons.broken_image, size: 50),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                    child: Text(
                      product.title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, bottom: 8.0),
                    child: Text(
                      "\$${product.price}",
                      style: const TextStyle(
                        color: Colors.deepOrange,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ))
      ],
    ),
    );
  }
}