import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:telumerce/const/url_endpoint.dart';
import 'package:telumerce/model/api_response.dart';
import 'package:telumerce/services/auth/get_token.dart';

import '../../const/http_header.dart';
import '../utils/helper_method.dart';

Future<ApiResponse> deleteWishlist(int id) async {
  http.Response response;
  String? token = await getTheToken();

  try {
    response = await http.delete(
      Uri.parse(deleteWishlistURL(id)),
      headers: getHeaderWithCookie(token),
    );
  } catch (e) {
    return catchTheException(e.toString());
  }

  final code = response.statusCode;

  return (code >= 200 && code <= 299)
      ? processingSuccessResponse(jsonDecode(response.body)['message'])
      : processingFailedResponse('DELETE', code);
}
