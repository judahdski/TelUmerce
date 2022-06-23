import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:telumerce/const/url_endpoint.dart';
import 'package:telumerce/model/api_response.dart';
import 'package:telumerce/model/user.dart';
import 'package:telumerce/services/utils/helper_method.dart';

Future<ApiResponse> getUserService() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  http.Response? response;

  try {
    response = await http.get(
      Uri.parse(getUserURL),
      headers: getHeaderWithCookie(
        pref.getString('token'),
      ),
    );
  } catch (e) {
    return catchTheException(e.toString());
  }

  final user = User.fromJson(jsonDecode(response.body)['data']);
  final code = response.statusCode;

  return (code >= 200 && code <= 299)
        ? processingSuccessResponse(user)
        : processingFailedResponse('GET', code);
}
