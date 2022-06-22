import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:telumerce/const/url_endpoint.dart';
import 'package:telumerce/model/api_response.dart';
import 'package:telumerce/model/user.dart';

import '../utils/helper_method.dart';

Future<ApiResponse> login(String email, String password) async {
  SharedPreferences pref = await SharedPreferences.getInstance();
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
    return catchTheException(e.toString());
  }

  String token = jsonDecode(response.body)['token'];
  pref.setString(tokenConst, token);

  ApiResponse apiResponse;
  final code = response.statusCode;
  switch(code) {
    case 200:
      final user = User.fromJson(jsonDecode(response.body)['user']);
      apiResponse = processingSuccessResponse(user);
      break;
    default:
      apiResponse = processingFailedResponse('GET', code);
      break;
  }

  return apiResponse;
}
