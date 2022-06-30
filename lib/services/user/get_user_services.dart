import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:telumerce/const/key.dart';
import 'package:telumerce/const/url_endpoint.dart';
import 'package:telumerce/model/api_response.dart';
import 'package:telumerce/model/user.dart';
import 'package:telumerce/services/auth/get_token.dart';
import 'package:telumerce/services/utils/helper_method.dart';

import '../../const/http_header.dart';

Future<ApiResponse> getUserService() async {
  http.Response? response;
  String? token = await getTheToken();

  try {
    response = await http.get(
      Uri.parse(getUserURL),
      headers: getHeaderWithCookie(
        token,
      ),
    );
  } catch (e) {
    return catchTheException(e.toString());
  }

  final user = User.fromJson(jsonDecode(response.body)['data']);
  final code = response.statusCode;

  return (code >= 200 && code <= 299)
        ? processingSuccessResponse(user)
        : processingFailedResponse('GET', code);
}
