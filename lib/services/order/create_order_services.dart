import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:telumerce/const/url_endpoint.dart';
import 'package:telumerce/model/api_response.dart';
import 'package:telumerce/model/create_order.dart';
import 'package:telumerce/services/utils/helper_method.dart';

import '../../const/http_header.dart';
import '../../const/key.dart';

Future<ApiResponse> createOrderService(
    String alamat, int opsiKirim, int metodePembayaran) async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  http.Response response;

  try {
    response = await http.post(Uri.parse(createOrderURL),
        headers: getHeaderRequest(pref.getString(tokenKey)),
        body: {
          'alamat': alamat,
          'opsikirim': opsiKirim.toString(),
          'metode_pembayaran': metodePembayaran.toString()
        });
  } catch (e) {
    return catchTheException(e.toString());
  }

  final code = response.statusCode;

  return (code >= 200 && code <= 299)
      ? processingSuccessResponse(
          CreateOrder.fromJson(jsonDecode(response.body)['data'][0]))
      : processingFailedResponse('POST', code);
}
