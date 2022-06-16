import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:telumerce/const/url_endpoint.dart';

import '../../model/product.dart';

Future<Product?> getProductDetailService(int id) async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  Product? product;

  try {
    final response = await http.get(
      Uri.parse(getProductDetailURL(id)),
      headers: getHeaderRequest(
        pref.getString('token'),
      ),
    );
    
    product = Product.fromJson(jsonDecode(response.body)['products']);
  } catch (e) {
    if (kDebugMode) {
      print(getError);
      print("Berikut exceptionnya : $e");
    }
  }

  return product;
}

// TODO: masih gabisa ambil data, masih ngehasilin exception

/*
  return value dari getProductInfoService() itu sifatnya nullable
  jadi jgn lupa buat tangkep exceptionnya
 */
