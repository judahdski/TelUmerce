import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:telumerce/const/url_endpoint.dart';
import 'package:telumerce/model/api_response.dart';

Future<ApiResponse> updateProfileServices
    (String name, String email, String phoneNum, String address) async
{
  SharedPreferences pref = await SharedPreferences.getInstance();
  ApiResponse apiResponse = ApiResponse();
  http.Response? response;

  try {
    response = await http.put(
      Uri.parse(updateUserURL),
      headers: getHeaderRequest(
        pref.getString(tokenConst),
      ),
      body: {
        'name': name,
        'email': email,
        'phoneNum': phoneNum,
        'address': address,
      },
    );
  } catch (e) {
    apiResponse.errorMessage = '$postError $e';
    apiResponse.isSuccessful = false;
    return apiResponse;
  }

  var code = response.statusCode;
  if (code == 200) {
    apiResponse.data = jsonDecode(response.body)['message'];
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
