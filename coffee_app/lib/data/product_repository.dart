import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import '../models/product.dart';

class ProductRepository 
{
  Future<List<Product>> fetchProducts() async 
  {
    final String jsonString = await rootBundle.loadString('assets/data/products.json');

    final Map<String, dynamic> jsonData = jsonDecode(jsonString);

    final List<dynamic> productList = jsonData['products'];

    return productList.map((json) => Product.fromJson(json)).toList(); 
  }
}