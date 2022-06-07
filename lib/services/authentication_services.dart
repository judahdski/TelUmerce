import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:telumerce/const/url_endpoint.dart';
import 'package:telumerce/model/api_response.dart';
import 'package:telumerce/model/authentication.dart';

Future<ApiResponse> login(String email, String password) async {
  print('ini udah masuk ke fungsi login di services');
  SharedPreferences pref = await SharedPreferences.getInstance();
  ApiResponse apiResponse = ApiResponse();

  Map<String, String> header = {
    'Postman-Token': '<calculated when request is sent>',
    'Content-Length': '0',
    'Host': '<calculated when request is sent>',
    'User-Agent': 'PostmanRuntime/7.29.0',
    'Accept': '*/*',
    'Accept-Encoding': 'gzip, deflate, br',
    'Connection': 'keep-alive',
  };

  final response = await http.post(
    Uri.parse(loginURL),
    headers: header,
    body: {
      'email': email,
      'password': password,
    },
  );

  //kalo berhasil login
  if (response.statusCode == 200) {
    final responseConverted =
        Authentication.fromJson(jsonDecode(response.body));

    apiResponse.user = responseConverted.user;

    // Get token
    String token = responseConverted.token;
    // Save token to SharedPreferences
    pref.setString('token', token);
    // debug
    print(token);

    return apiResponse;


    //  kalo gagal login
  } else {
    final errors = jsonDecode(response.body)['message'];
    apiResponse.errorMessage = errors;

    return apiResponse;
  }
}
