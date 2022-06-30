import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:telumerce/const/url_endpoint.dart';
import 'package:telumerce/model/api_response.dart';
import 'package:telumerce/model/order.dart';
import 'package:telumerce/services/utils/helper_method.dart';

import '../../const/http_header.dart';
import '../../const/key.dart';

Future<ApiResponse> getAllOrderService() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  http.Response response;

  try {
    response = await http.get(
      Uri.parse(getAllOrdersURL),
      headers: getHeaderRequest(
        pref.getString(tokenKey),
      ),
    );
  } catch (e) {
    return catchTheException(e.toString());
  }

  final code = response.statusCode;
  List orderContainerList = jsonDecode(response.body)['data'];
  List orderList = listOrderFromJson(orderContainerList);

  return (code >= 200 && code <= 299)
          ? processingSuccessResponse(orderList)
          : processingFailedResponse('GET', code);
}
