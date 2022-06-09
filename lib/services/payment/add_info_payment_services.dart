import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:telumerce/const/url_endpoint.dart';

Future addInfoPayment() async {
  SharedPreferences pref = await SharedPreferences.getInstance();

  try {
    final response = await http.post(
      Uri.parse(paymentURL),
      headers: getPaymentHeaderRequest(pref.getString('token')),
    );
  } catch(e) {
    if (kDebugMode) {
      print(postError);
      print('e : $e');
    }
  }
}