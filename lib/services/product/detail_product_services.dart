import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:telumerce/const/url_endpoint.dart';

Future getProductDetail(int id) async {
  SharedPreferences pref = await SharedPreferences.getInstance();

  try {
    final response = await http.get(
      Uri.parse(getProductDetailURL(id)),
      headers: getHeaderRequest(pref.getString('token'))
    );
  } catch(e) {
    if(kDebugMode) {
      print(getError);
      print("Berikut exceptionnya : $e");
    }
  }
}