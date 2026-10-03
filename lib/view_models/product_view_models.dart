import 'package:daraz/models/product_models.dart';
import 'package:daraz/services/api_services.dart';
import 'package:flutter/material.dart';

class ProductViewModels extends ChangeNotifier {
  final ApiServices _apiServices = ApiServices();

  List<ProductModels> _products = [];
  List<String> _categories = [];
  String _selectedCategory = "All";
  bool _isLoading = false;
  String _error = '';

  List<ProductModels> get products => _products;
  List<String> get categories => _categories;
  String get selectedCategory => _selectedCategory;
  bool get isLoading => _isLoading;
  String get error => _error;


  Future<void> fetchCategoriesByProducts() async {
    _isLoading = true;
    _error = '';
    notifyListeners();

    try {
      final categoriesList = await _apiServices.fetchCategories();
      _categories = ["All", ...categoriesList];
      _products = await _apiServices.fetchProducts();
    } catch (e) {
      _error = e.toString();
    }

    _isLoading = false;
    notifyListeners();
  }


  Future<void> selectCategory(String category) async {
    _selectedCategory = category;
    _isLoading = true;
    _error = '';
    notifyListeners();

    try {
      if (_selectedCategory == 'All') {
        _products = await _apiServices.fetchProducts();
      } else {
        _products = await _apiServices.fetchProductsByCategory(_selectedCategory);
      }
    } catch (e) {
      _error = e.toString();
    }

    _isLoading = false;
    notifyListeners();
  }
}