import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:telumerce/const/url_endpoint.dart';
import 'package:telumerce/model/api_response.dart';

import '../../model/cart.dart';
import '../utils/helper_method.dart';

Future<ApiResponse> getCartService() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  http.Response response;

  try {
    response = await http.get(
      Uri.parse(getAllUserCartURL),
      headers: getHeaderWithCookie(pref.getString(tokenConst)),
    );
  } catch (e) {
    return catchTheException(e.toString());
  }

  final code = response.statusCode;

  var cart = jsonDecode(response.body)['data'][0];
  return (code >= 200 && code <= 299)
          ? processingSuccessResponse(Cart.fromJson(cart))
          : processingFailedResponse('GET', code);
}
