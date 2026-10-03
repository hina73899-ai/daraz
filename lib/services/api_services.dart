import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:daraz/models/product_models.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  final String baseUrl = "https://fakestoreapi.com";

  Future<List<ProductModels>> fetchProducts() async {
    try {
      final response = await http
          .get(Uri.parse('$baseUrl/products'))
          .timeout(const Duration(seconds: 15));

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        return data.map((json) => ProductModels.fromJson(json)).toList();
      } else {
        throw 'Server error: ${response.statusCode}';
      }
    } on TimeoutException {
      throw 'Request timed out. Please try again.';
    } on SocketException {
      throw 'No Internet Connection';
    } catch (e) {
      throw 'Failed to load products. Please try again.';
    }
  }

  Future<List<String>> fetchCategories() async {
    try {
      final response = await http
          .get(Uri.parse('$baseUrl/products/categories'))
          .timeout(const Duration(seconds: 15));

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        return data.map((e) => e.toString()).toList();
      } else {
        throw 'Server error: ${response.statusCode}';
      }
    } on TimeoutException {
      throw 'Request timed out. Please try again.';
    } on SocketException {
      throw 'No Internet Connection';
    } catch (e) {
      throw 'Failed to load categories.';
    }
  }

  Future<List<ProductModels>> fetchProductsByCategory(String selectedCategory) async {
    try {
      final response = await http
          .get(Uri.parse('$baseUrl/products/category/${Uri.encodeComponent(selectedCategory)}'))
          .timeout(const Duration(seconds: 15));

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        return data.map((json) => ProductModels.fromJson(json)).toList();
      } else {
        throw 'Server error: ${response.statusCode}';
      }
    } on TimeoutException {
      throw 'Request timed out. Please try again.';
    } on SocketException {
      throw 'No Internet Connection';
    } catch (e) {
      throw 'Failed to load products.';
    }
  }
}