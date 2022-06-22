import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:telumerce/const/url_endpoint.dart';
import 'package:telumerce/model/api_response.dart';
import 'package:telumerce/services/utils/helper_method.dart';

import '../../model/user.dart';

Future<ApiResponse> register(
    String name, String email, String password, String confirmationPass) async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  http.Response response;

  Map<String, String> header = {
    'Postman-Token': '<calculated when request is sent>',
  };

  try {
    response = await http.post(Uri.parse(registerURL), headers: header, body: {
      'name': name,
      'email': email,
      'password': password,
      'password_confirmation': confirmationPass
    });
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
