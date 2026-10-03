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
          automaticallyImplyLeading: false,
          elevation: 0,
          leading: Builder(
            builder: ((context) => IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: const Icon(Icons.menu, color: Colors.white),
            )),
          ),
          title: SizedBox(
            height: 40,
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search in Daraz",
                hintStyle: TextStyle(color: Colors.grey.shade500, fontSize: 14),
                fillColor: Colors.white,
                filled: true,
                contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
                // Search icon button inside search bar (Daraz style)
                suffixIcon: Container(
                  decoration: BoxDecoration(
                    color: Colors.orange.shade100,
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(4),
                      bottomRight: Radius.circular(4),
                    ),
                  ),
                  child: const Icon(Icons.search, color: Colors.deepOrange),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4),
                  borderSide: BorderSide.none,
                ),
              ),
              onChanged: (query) {
              },
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {
              },
              icon: const Icon(Icons.shopping_cart_outlined, color: Colors.white),
            ),
            const SizedBox(width: 5),
          ],
        ),
        drawer: Drawer(
      backgroundColor: Colors.deepOrange,
        child: ListView(
          children: [
            DrawerHeader(
                child: Text("Daraz Catagories",
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    )),

            ),
            ListTile(
              leading: const Icon(Icons.grid_view,
              color: Colors.white,),
              title: const Text("All Products",
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.normal,
                    fontSize: 20,
                  )),
              selected: selectedCategory == 'All',
              onTap: () {
                setState(() {
                  selectedCategory = 'All';
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.diamond_outlined,
                color: Colors.white,),
              title: const Text("Jewelery",
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.normal,
                    fontSize: 20,
                  )),
              selected: selectedCategory == 'jewelery',
              onTap: () {
                setState(() {
                  selectedCategory = 'jewelery';
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.devices, color: Colors.white,),
              title: const Text("Electronics",
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.normal,
                    fontSize: 20,
                  )),
              selected: selectedCategory == 'electronics',
              onTap: () {
                setState(() {
                  selectedCategory = 'electronics';
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.checkroom, color: Colors.white,),
              title: const Text("Shirts",
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.normal,
                    fontSize: 20,
                  )),
              selected: selectedCategory == 'shirts',
              onTap: () {
                setState(() {
                  selectedCategory = 'shirts';
                });
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
        body: _buildProducts(viewModels)

    );


  }
  Widget _buildProducts(ProductViewModels viewModels) {
    if (selectedCategory == 'jewelery') {
      return const Jewelery();
    } else if (selectedCategory == 'electronics') {
      return const Electronics();
    } else if (selectedCategory == 'shirts') {
      return const Shirts();
    } else {
      if (viewModels.isLoading) {
        return const Center(child: CircularProgressIndicator());
      }

      return Padding(
        padding: const EdgeInsets.all(12.0), // Main Body Outer Padding
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
              ],
            ),
            const SizedBox(height: 10),
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.only(bottom: 10),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.75,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                ),
                itemCount: viewModels.products.length,
                itemBuilder: (context, index) {
                  final product = viewModels.products[index];
                  return Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0), // Padding inside Card
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Image.network(
                              product.image,
                              fit: BoxFit.contain,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            product.title,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            "\$${product.price}",
                            style: const TextStyle(
                              color: Colors.deepOrange,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      );
    }
  }}

