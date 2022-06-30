import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:telumerce/const/url_endpoint.dart';
import 'package:telumerce/model/api_response.dart';

import '../../const/http_header.dart';
import '../../const/key.dart';
import '../../model/product.dart';
import '../utils/helper_method.dart';

Future<ApiResponse> getProductDetailService(int id) async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  http.Response response;

  try {
    response = await http.get(
      Uri.parse(getProductDetailURL(id)),
      headers: getHeaderRequest(
        pref.getString(tokenKey),
      ),
    );
  } catch (e) {
    return catchTheException(e.toString());
  }

  final code = response.statusCode;
  var product = jsonDecode(response.body)['products'];

  return (code >= 200 && code <= 299)
      ? processingSuccessResponse(Product.fromJson(product))
      : processingFailedResponse('GET', code);
}
