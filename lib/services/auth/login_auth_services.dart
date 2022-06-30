import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:telumerce/const/url_endpoint.dart';
import 'package:telumerce/model/api_response.dart';
import 'package:telumerce/model/user.dart';
import 'package:telumerce/services/auth/create_storage.dart';

import '../../const/key.dart';
import '../utils/helper_method.dart';

Future<ApiResponse> login(String email, String password) async {
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

  User user;
  try {
    user = User.fromJson(jsonDecode(response.body)['user']);
    String token = jsonDecode(response.body)['token'];

    await storage.write(key: tokenKey, value: token);

  } catch (e) {
    String errorMsg = '';

    String? errorEmail =
        jsonDecode(response.body)['errors']['email'].toString();
    if (errorEmail == 'null') {
      errorMsg = jsonDecode(response.body)['errors']['password'].toString();
    } else {
      errorMsg = jsonDecode(response.body)['errors']['email'].toString();
    }

    return catchTheException(errorMsg);
  }

  final code = response.statusCode;
  return (code >= 200 && code <= 299)
      ? processingSuccessResponse(user)
      : processingFailedResponse('POST', code);
}
