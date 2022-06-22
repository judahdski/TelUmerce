import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:telumerce/const/url_endpoint.dart';
import 'package:telumerce/model/api_response.dart';

import '../../model/cart.dart';
import '../utils/helper_method.dart';

Future<ApiResponse> getAllCart() async {
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

  ApiResponse apiResponse;
  final code = response.statusCode;
  switch(code) {
    case 200:
      var cartList = jsonDecode(response.body)['data'];
      var cartObject = Cart.fromJson(cartList[0]);

      apiResponse = processingSuccessResponse(cartObject.cartItem);
      break;
    default:
      apiResponse = processingFailedResponse('GET', code);
      break;
  }

  return apiResponse;
}
