import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:telumerce/const/url_endpoint.dart';
import 'package:telumerce/model/api_response.dart';
import 'package:telumerce/services/auth/get_token.dart';

import '../../const/http_header.dart';
import '../../model/product.dart';
import '../utils/helper_method.dart';

Future<ApiResponse> getProductDetailService(int id) async {
  http.Response response;
  String? token = await getTheToken();

  try {
    response = await http.get(
      Uri.parse(getProductDetailURL(id)),
      headers: getHeaderRequest(
        token,
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
