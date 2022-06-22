import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:telumerce/const/url_endpoint.dart';
import 'package:telumerce/model/api_response.dart';

import '../../model/cart.dart';

Future<ApiResponse> getAllCart() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  ApiResponse apiResponse = ApiResponse();
  http.Response response;

  try {
    response = await http.get(
      Uri.parse(getAllUserCartURL),
      headers: getHeaderWithCookie(pref.getString(tokenConst)),
    );
  } catch(e) {
    apiResponse.errorMessage = e.toString();
    apiResponse.isSuccessful = false;
    return apiResponse;
  }

  final code = response.statusCode;
  switch (code) {
    case 200:
      var cartList = jsonDecode(response.body)['data'];
      var cartObject = Cart.fromJson(cartList[0]);

      apiResponse.data = cartObject.cartItem;
      apiResponse.isSuccessful = true;
      break;

    case 401:
      apiResponse.errorMessage = unauthorized;
      apiResponse.isSuccessful = false;
      break;

    default:
      apiResponse.errorMessage = getError;
      apiResponse.isSuccessful = false;
      break;
  }
  
  return apiResponse;
}