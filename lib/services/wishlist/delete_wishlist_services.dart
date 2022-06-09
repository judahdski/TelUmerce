import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:telumerce/const/url_endpoint.dart';

Future deleteWishlist(int id) async {
  SharedPreferences pref = await SharedPreferences.getInstance();

  try {
    final response = await http.post(
      Uri.parse(deleteWishlistURL(id)),
      headers: getWishlistHeaderRequest(pref.getString('token')),
    );
  } catch(e) {
    if(kDebugMode) {
      print(postError);
      print('e : $e');
    }
  }
}