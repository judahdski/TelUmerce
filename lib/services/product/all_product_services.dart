import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:telumerce/const/url_endpoint.dart';

import '../../model/product.dart';

Future<List<Product>?> getProductsService() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  List<Product>? products;

  try {
    final response = await http.get(
      Uri.parse(getAllProductsURL),
      headers: getHeaderRequest(
        pref.getString('token'),
      ),
    );

    /*
      convert to String
     */
    String productsString = json.encode(jsonDecode(response.body)['products']);

    products = productFromJson(productsString);
  } catch (e) {
    if (kDebugMode) {
      print(getError);
      print("Berikut exceptionnya : $e");
    }
  }

  return products;
}

/*
  return value dari getProductsService() itu sifatnya nullable
  jadi jgn lupa buat tangkep exceptionnya
 */
