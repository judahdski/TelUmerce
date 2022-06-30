import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:telumerce/const/key.dart';
import 'package:telumerce/const/url_endpoint.dart';
import 'package:telumerce/model/api_response.dart';
import 'package:telumerce/services/utils/helper_method.dart';

import '../../const/http_header.dart';

Future<ApiResponse> updatePasswordService
    (String oldPassword, String newPassword, String newPasswordConfirmation) async
{
  SharedPreferences pref = await SharedPreferences.getInstance();
  http.Response? response;

  try {
    response = await http.put(
      Uri.parse(updatePasswordUserURL),
      headers: getHeaderRequest(pref.getString(tokenKey)),
      body: {
        'oldpassword': oldPassword,
        'password': newPassword,
        'password_confimation': newPasswordConfirmation,
      },
    );
  } catch (e) {
    return catchTheException(e.toString());
  }

  var code = response.statusCode;

  return (code >= 200 && code <= 299)
          ? processingSuccessResponse(jsonDecode(response.body)['message'])
          : processingFailedResponse('PUT', code);
}