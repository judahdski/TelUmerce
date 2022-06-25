import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:telumerce/const/url_endpoint.dart';
import 'package:telumerce/model/api_response.dart';
import 'package:telumerce/model/wishlist.dart';
import 'package:telumerce/services/utils/helper_method.dart';

Future<ApiResponse> getAllWishlistService() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  http.Response response;

  try {
    response = await http.get(
      Uri.parse(getAllWishlistURL),
      headers: getHeaderWithCookie(
        pref.getString(tokenConst),
      ),
    );
  } catch (e) {
    return catchTheException(e.toString());
  }

  final code = response.statusCode;
  return (code >= 200 && code <= 299)
          ? processingSuccessResponse(listWishlistFromJson(jsonDecode(response.body)['data']))
          : processingFailedResponse('GET', code);
}
