import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:telumerce/const/url_endpoint.dart';
import 'package:telumerce/services/utils/helper_method.dart';

import '../../const/http_header.dart';
import '../../const/key.dart';
import '../../model/api_response.dart';

Future<ApiResponse> deleteCartService(int id) async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  http.Response response;

  try {
    response = await http.delete(
      Uri.parse(deleteCartURL(id)),
      headers: getHeaderRequest(pref.getString(tokenKey))
    );
  } catch (e) {
    return catchTheException(e.toString());
  }

  final code = response.statusCode;

  return (code >= 200 && code <= 299)
          ? processingSuccessResponse(jsonDecode(response.body)['message'])
          : processingFailedResponse('DELETE', code);
}