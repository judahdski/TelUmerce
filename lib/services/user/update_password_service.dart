import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:telumerce/const/url_endpoint.dart';
import 'package:telumerce/model/api_response.dart';

Future<ApiResponse> updatePasswordService
    (String oldPassword, String newPassword, String newPasswordConfirmation) async
{
  SharedPreferences pref = await SharedPreferences.getInstance();
  ApiResponse apiResponse = ApiResponse();
  http.Response? response;

  try {
    response = await http.put(
      Uri.parse(updatePasswordUserURL),
      headers: getHeaderRequest(pref.getString('token')),
      body: {
        'oldpassword': oldPassword,
        'password': newPassword,
        'password_confimation': newPasswordConfirmation,
      },
    );
  } catch (e) {
    apiResponse.errorMessage = '$postError $e';
    apiResponse.isSuccessful = false;
    return apiResponse;
  }

  var code = response.statusCode;
  if (code == 200) {
    apiResponse.data = jsonDecode(response.body)['message'];
    apiResponse.isSuccessful = true;
  } else if (code == 400) {
    apiResponse.errorMessage = jsonDecode(response.body)['message'];
    apiResponse.isSuccessful = false;
  } else {
    apiResponse.errorMessage = 'Terjadi kesalahan';
    apiResponse.isSuccessful = false;
  }

  return apiResponse;
}