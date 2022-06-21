import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:telumerce/const/url_endpoint.dart';

Future getOrderDetail(int id) async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  http.Response response;

  try {
    response = await http.get(
      Uri.parse(getOrderDetailURL(id)),
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
