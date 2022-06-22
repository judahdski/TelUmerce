import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:telumerce/const/url_endpoint.dart';
import 'package:telumerce/model/api_response.dart';

import '../../model/product.dart';

Future<ApiResponse> getProductsService() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  ApiResponse apiResponse = ApiResponse();
  http.Response response;

  try {
    response = await http.get(
      Uri.parse(getAllProductsURL),
      headers: getHeaderRequest(
        pref.getString(tokenConst),
      ),
    );
  } catch (e) {
    apiResponse.errorMessage = e.toString();
    apiResponse.isSuccessful = false;
    return apiResponse;
  }

  final code = response.statusCode;
  switch (code) {
    case 200:
      var listProduct = jsonDecode(response.body)['products'];
      apiResponse.data = productIntoList(listProduct);
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
