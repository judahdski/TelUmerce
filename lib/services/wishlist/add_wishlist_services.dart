import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:telumerce/const/url_endpoint.dart';
import 'package:telumerce/model/api_response.dart';
import 'package:telumerce/model/wishlist.dart';

Future<ApiResponse> addWishlist(int id) async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  ApiResponse apiResponse = ApiResponse();
  http.Response response;

  try {
    response = await http.post(
      Uri.parse(addWishlistURL(id)),
      headers: getHeaderWithCookie(pref.getString(tokenConst)),
    );
  } catch (e) {
    apiResponse.errorMessage = e.toString();
    apiResponse.isSuccessful = false;
    return apiResponse;
  }

  final code = response.statusCode;
  if (code == 200) {
    apiResponse.data = listWishlistFromJson(jsonDecode(response.body)['data']);
    apiResponse.isSuccessful = true;
  } else if (code == 401) {
    apiResponse.errorMessage = jsonDecode(response.body)['message'];
    apiResponse.isSuccessful = false;
  } else {
    apiResponse.errorMessage = jsonDecode(response.body)['message'];
    apiResponse.isSuccessful = false;
  }

  return apiResponse;
}
