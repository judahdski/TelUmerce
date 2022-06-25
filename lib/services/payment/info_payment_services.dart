import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:telumerce/const/url_endpoint.dart';
import 'package:telumerce/model/api_response.dart';
import 'package:telumerce/model/payment_info.dart';

import '../utils/helper_method.dart';

Future<ApiResponse> getInfoPaymentService() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  http.Response response;

  try {
    response = await http.get(
      Uri.parse(paymentURL),
      headers: getHeaderWithCookie(pref.getString(tokenConst)),
    );
  } catch (e) {
    return catchTheException(e.toString());
  }

  final code = response.statusCode;
  dynamic paymentInfo = 'biar ga NPE ajaa';

  try {
    paymentInfo = PaymentInfo.fromJson(jsonDecode(response.body)['data']);
  } catch(e) {
    if (kDebugMode) {
      print(e.toString());
    }
  }

  return (code >= 200 && code <= 299)
      ? processingSuccessResponse(paymentInfo)
      : processingFailedResponse('GET', code);
}
