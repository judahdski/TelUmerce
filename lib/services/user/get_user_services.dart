import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:telumerce/const/url_endpoint.dart';
import 'package:telumerce/model/api_response.dart';
import 'package:telumerce/model/authentication.dart';

Future<ApiResponse> getUserService() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  ApiResponse apiResponse = ApiResponse();
  http.Response? response;

  try {
    response = await http.get(
      Uri.parse(getUserURL),
      headers: getHeaderWithCookie(
        pref.getString('token'),
      ),
    );
  } catch (e) {
    apiResponse.errorMessage = '$postError $e';
    apiResponse.isSuccessful = false;
    return apiResponse;
  }

  var code = response.statusCode;
  if (code == 200) {
    apiResponse.data = User.fromJson(jsonDecode(response.body)['data']);
    apiResponse.isSuccessful = true;
  } else if (code == 401) {
    apiResponse.errorMessage = jsonDecode(response.body)['message'];
    apiResponse.isSuccessful = false;
  } else {
    apiResponse.errorMessage = 'Terjadi kesalahan';
    apiResponse.isSuccessful = false;
  }

  return apiResponse;
}
