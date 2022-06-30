import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:telumerce/const/url_endpoint.dart';
import 'package:telumerce/model/api_response.dart';
import 'package:telumerce/services/utils/helper_method.dart';

import '../../const/http_header.dart';
import '../../const/key.dart';
import '../../model/order_detail.dart';

Future<ApiResponse> getOrderDetail(int id) async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  http.Response response;

  try {
    response = await http.get(
      Uri.parse(getOrderDetailURL(id)),
      headers: getHeaderRequest(
        pref.getString(tokenKey),
      ),
    );
  } catch (e) {
    return catchTheException(e.toString());
  }

  final code = response.statusCode;
  final data = jsonDecode(response.body)['data'][0];
  final orderDetail = OrderDetailModel.fromJson(data);

  return (code >= 200 && code <= 299)
          ? processingSuccessResponse(orderDetail)
          : processingFailedResponse('GET', code);
}
