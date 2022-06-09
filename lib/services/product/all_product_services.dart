import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:telumerce/const/url_endpoint.dart';
import 'package:telumerce/model/products_container.dart';

Future<List<Product>> getAllProducts() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  List<Product>? products;

  try {
    final response = await http.get(
      Uri.parse(getAllProductsURL),
      headers: {
        'Authorization': 'Bearer ${pref.getString('token')}',
        'Postman-Token': '<calculated when request is sent>',
      },
    );

    products = ProductsContainer.fromJson(jsonDecode(response.body)).products;
  } catch(e) {
    print(getError);
    print("Berikut exceptionnya : $e");
  }

  return products!;
}
