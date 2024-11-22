import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProductProvider with ChangeNotifier {
  final String _baseUrl = "https://www.gamintg.com/api/products";
  List<dynamic> _products = [];
  bool _isLoading = false;

  List<dynamic> get products => _products;
  bool get isLoading => _isLoading;

  Future<void> fetchProducts() async {

    notifyListeners();

    try {
      final response = await http.get(Uri.parse(_baseUrl));
      if (response.statusCode == 200) {
        _products = jsonDecode(response.body);
      } else {
        throw Exception('Failed to load products');
      }
    } catch (error) {
      print(error);
    }

    _isLoading = false;
    notifyListeners();
  }
}
