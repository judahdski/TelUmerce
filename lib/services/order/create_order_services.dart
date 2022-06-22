import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:telumerce/const/url_endpoint.dart';
import 'package:telumerce/model/api_response.dart';
import 'package:telumerce/services/utils/helper_method.dart';

Future<ApiResponse> createOrderService(String alamat, int opsiKirim, int metodePembayaran) async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  http.Response response;

  try {
    response = await http.post(
      Uri.parse(createOrderURL),
      headers: getHeaderRequest(pref.getString(tokenConst)),
      body: {
        'alamat': alamat,
        'opsikirim': opsiKirim,
        'metode_pembayaran': metodePembayaran
      }
    );
  } catch(e) {
    return catchTheException(e.toString());
  }

  ApiResponse apiResponse;
  final code = response.statusCode;
  switch(code) {
    case 200:
    // TODO: data response belum sesuai
      apiResponse = processingSuccessResponse(jsonDecode(response.body));
      break;
    default:
      apiResponse = processingFailedResponse('POST', code);
      break;
  }

  return apiResponse;
}