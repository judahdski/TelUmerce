import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:telumerce/const/url_endpoint.dart';

Future getAllOrderService() async {
  SharedPreferences pref = await SharedPreferences.getInstance();

  try {
    final response = await http.get(
      Uri.parse(getAllOrdersURL),
      headers: getHeaderRequest(
        pref.getString(tokenConst),
      ),
    );
  } catch (e) {
    if (kDebugMode) {
      print(getError);
      print(e);
    }
  }
}
