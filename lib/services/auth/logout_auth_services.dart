import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:telumerce/const/url_endpoint.dart';
import 'package:telumerce/model/api_response.dart';
import 'package:telumerce/services/auth/create_storage.dart';

import '../../const/http_header.dart';
import '../../const/key.dart';
import '../utils/helper_method.dart';

Future<ApiResponse> logoutService() async {
  String? token = await storage.read(key: tokenKey);
  http.Response response;

  try {
    response = await http.post(
      Uri.parse(logoutURL),
      headers: getHeaderWithCookie(token),
    );
  } catch (e) {
    return catchTheException(e.toString());
  }

  // hapus valuenya
  await storage.delete(key: tokenKey);

  final code = response.statusCode;
  return (code >= 200 && code <= 299)
      ? processingSuccessResponse(jsonDecode(response.body)['message'])
      : processingFailedResponse('GET', code);
}
