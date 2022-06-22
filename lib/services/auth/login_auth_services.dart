import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:telumerce/const/url_endpoint.dart';
import 'package:telumerce/model/api_response.dart';
import 'package:telumerce/model/user.dart';

Future<ApiResponse> login(String email, String password) async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  ApiResponse apiResponse = ApiResponse();
  http.Response response;

  Map<String, String> header = {
    'Postman-Token': '<calculated when request is sent>',
  };

  try {
    response = await http.post(
      Uri.parse(loginURL),
      headers: header,
      body: {
        'email': email,
        'password': password,
      },
    );
  } catch (e) {
    apiResponse.errorMessage = e.toString();
    apiResponse.isSuccessful = false;
    return apiResponse;
  }

  String token = jsonDecode(response.body)['token'];
  pref.setString(tokenConst, token);

  final code = response.statusCode;
  switch (code) {
    case 200:
      apiResponse.data = User.fromJson(jsonDecode(response.body)['user']);
      apiResponse.isSuccessful = true;
      break;

    case 401:
      apiResponse.errorMessage = unauthorized;
      apiResponse.isSuccessful = false;
      break;

    default:
      apiResponse.errorMessage = getError;
      apiResponse.isSuccessful = false;
      break;
  }

  return apiResponse;
}
