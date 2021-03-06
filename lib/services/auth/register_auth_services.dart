import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:telumerce/const/url_endpoint.dart';
import 'package:telumerce/model/api_response.dart';
import 'package:telumerce/services/auth/create_storage.dart';
import 'package:telumerce/services/utils/helper_method.dart';

import '../../const/key.dart';

Future<ApiResponse> register(
    String name, String email, String password, String confirmationPass) async {
  http.Response response;

  Map<String, String> header = {
    'Accept': 'application/json',
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

  Map user;
  try {
    user = jsonDecode(response.body)['user'];
    String token = jsonDecode(response.body)['token'];
    await storage.write(key: tokenKey, value: token);
  } catch (e) {
    final errorMsg = jsonDecode(response.body)['errors'].toString();
    return catchTheException(errorMsg);
  }

  final code = response.statusCode;
  return (code >= 200 && code <= 299)
      ? processingSuccessResponse(user)
      : processingFailedResponse('POST', code);
}
