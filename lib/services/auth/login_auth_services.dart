import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:telumerce/const/url_endpoint.dart';
import 'package:telumerce/model/api_response.dart';
import 'package:telumerce/model/authentication.dart';

Future<ApiResponse> login(String email, String password) async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  ApiResponse apiResponse = ApiResponse();

  Map<String, String> header = {
    'Postman-Token': '<calculated when request is sent>',
  };

  final response = await http.post(
    Uri.parse(loginURL),
    headers: header,
    body: {
      'email': email,
      'password': password,
    },
  );

  if (response.statusCode == 200) {
    final responseConverted =
    Authentication.fromJson(jsonDecode(response.body));

    apiResponse.user = responseConverted.user;

    String token = responseConverted.token;
    pref.setString('token', token);
    print('token $token');
  } else {
    final errors = jsonDecode(response.body)['message'];
    apiResponse.errorMessage = errors;
  }

  return apiResponse;
}