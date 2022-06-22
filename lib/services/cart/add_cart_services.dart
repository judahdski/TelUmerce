import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:telumerce/const/url_endpoint.dart';
import 'package:telumerce/model/api_response.dart';

import '../utils/helper_method.dart';

Future<ApiResponse> addCart(int productAmount, int id) async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  http.Response response;

  try {
    response = await http.post(Uri.parse(addCartURL),
        headers: getHeaderWithCookie(pref.getString(tokenConst)),
        body: {
          'jumlah_barang': productAmount,
          'id_produk': id,
        });
  } catch (e) {
    return catchTheException(e.toString());
  }

  ApiResponse apiResponse;
  final code = response.statusCode;
  switch(code) {
    case 200:
      apiResponse = processingSuccessResponse(jsonDecode(response.body)['message']);
      break;
    default:
      apiResponse = processingFailedResponse('GET', code);
      break;
  }

  return apiResponse;
}
