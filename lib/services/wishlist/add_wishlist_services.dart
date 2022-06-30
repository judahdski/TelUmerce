import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:telumerce/const/url_endpoint.dart';
import 'package:telumerce/model/api_response.dart';
import 'package:telumerce/model/wishlist.dart';
import 'package:telumerce/services/auth/get_token.dart';

import '../../const/http_header.dart';
import '../../const/key.dart';
import '../utils/helper_method.dart';

Future<ApiResponse> addWishlist(int id) async {
  http.Response response;
  String? token = await getTheToken();

  try {
    response = await http.post(
      Uri.parse(addWishlistURL(id)),
      headers: getHeaderWithCookie(token),
    );
  } catch (e) {
    return catchTheException(e.toString());
  }

  final code = response.statusCode;
  final listWishlist = jsonDecode(response.body)['data'];

  return (code >= 200 && code <= 299)
          ? processingSuccessResponse(listWishlistFromJson(listWishlist))
          : processingFailedResponse('POST', code);
}
