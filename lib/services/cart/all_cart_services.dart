import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:telumerce/const/url_endpoint.dart';

Future getAllCart() async {
  SharedPreferences pref = await SharedPreferences.getInstance();

  try {
    final response = await http.get(
      Uri.parse(getAllUserCartURL),
      headers: getCartHeaderRequest(pref.getString('token')),
    );
  } catch(e) {
    if(kDebugMode) {
      print(getError);
      print('e : $e');
    }
  }
}