import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:telumerce/const/url_endpoint.dart';
import 'package:telumerce/model/api_response.dart';

Future<ApiResponse> addCart(int productAmount, int id) async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  ApiResponse apiResponse = ApiResponse();
  http.Response response;

  try {
    response = await http.post(Uri.parse(addCartURL),
        headers: getHeaderWithCookie(pref.getString(tokenConst)),
        body: {
          'jumlah_barang': productAmount,
          'id_produk': id,
        });
  } catch (e) {
    apiResponse.errorMessage = e.toString();
    apiResponse.isSuccessful = false;
    return apiResponse;
  }

  var code = response.statusCode;
  if (code == 200) {
    apiResponse.data = jsonDecode(response.body);
    apiResponse.isSuccessful = true;
  }

  return apiResponse;
}
