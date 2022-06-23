import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:telumerce/const/url_endpoint.dart';
import 'package:telumerce/model/api_response.dart';

import '../utils/helper_method.dart';

Future<ApiResponse> login(String email, String password) async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  http.Response response;

  Map<String, String> header = {
    'Accept': 'application/json',
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

  Map user;
  try {
    user = jsonDecode(response.body)['user'];
    String token = jsonDecode(response.body)['token'];
    pref.setString(tokenConst, token);
  } catch (e) {
    String errorMsg = '';

    String? errorEmail = jsonDecode(response.body)['message']['emails'].toString();
    if (errorEmail == 'null') {
      errorMsg = jsonDecode(response.body)['message']['password'].toString();
    } else {
      errorMsg = jsonDecode(response.body)['message']['email'].toString();
    }

    return catchTheException(errorMsg);
  }

  final code = response.statusCode;
  return (code >= 200 && code <= 299)
      ? processingSuccessResponse(user)
      : processingFailedResponse('POST', code);
}
