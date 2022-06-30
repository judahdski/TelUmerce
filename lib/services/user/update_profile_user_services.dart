import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:telumerce/const/url_endpoint.dart';
import 'package:telumerce/model/api_response.dart';
import 'package:telumerce/services/utils/helper_method.dart';

import '../../const/http_header.dart';
import '../../const/key.dart';

Future<ApiResponse> updateProfileServices(
    String name, String email, String phoneNum, String address) async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  http.Response? response;

  try {
    response = await http.put(
      Uri.parse(updateUserURL),
      headers: getHeaderRequest(
        pref.getString(tokenKey),
      ),
      body: {
        'name': name,
        'email': email,
        'alamat': address,
        'no_telp': phoneNum,
      },
    );
  } catch (e) {
    return catchTheException(e.toString());
  }

  var code = response.statusCode;
  return (code >= 200 && code <= 299)
      ? processingSuccessResponse(jsonDecode(response.body)['message'])
      : processingFailedResponse('PUT', code);
}
