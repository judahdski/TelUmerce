import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:telumerce/const/url_endpoint.dart';
import 'package:telumerce/services/utils/helper_method.dart';

import '../../model/api_response.dart';

Future<ApiResponse> timeoutOrderService(int id) async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  http.Response response;

  try {
    response = await http.post(
      Uri.parse(orderTimeOutURL(id)),
      headers: getHeaderRequest(pref.getString(tokenConst)),
    );
  } catch (e) {
    return catchTheException(e.toString());
  }

  ApiResponse apiResponse;
  final code = response.statusCode;
  switch(code) {
    case 200:
    // TODO: Balikin data yang bener dari response.body
      apiResponse = processingSuccessResponse(jsonDecode(response.body));
      break;
    default:
      apiResponse = processingFailedResponse('POST', code);
      break;
  }

  return apiResponse;
}