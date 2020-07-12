import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:zaha/models/product.dart';

class ProductViewModel {
  static List<Product> products = new List<Product>();
  static Product selected = new Product();

  static Future load() async{
    List jsonParsed = json.decode(await getProduct());
    products = jsonParsed.map((i) => new Product.fromJson(i)).toList();
    selected = products[0];
  }

  static Future<String> getProduct() async {
    return await rootBundle.loadString('assets/products.json');
  }
}