import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:telumerce/const/url_endpoint.dart';

Future getAllWishlist() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  http.Response response;

  try {
    response = await http.get(
      Uri.parse(getAllWishlistURL),
      headers: getHeaderWithCookie(
        pref.getString(tokenConst),
      ),
    );
  } catch (e) {
    if (kDebugMode) {
      print(getError);
      print('e : $e');
    }
  }
}
