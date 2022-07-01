import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:telumerce/const/url_endpoint.dart';
import 'package:telumerce/model/api_response.dart';
import 'package:telumerce/model/order.dart';
import 'package:telumerce/services/auth/get_token.dart';
import 'package:telumerce/services/utils/helper_method.dart';

import '../../const/http_header.dart';

Future<ApiResponse> getAllOrderService() async {
  http.Response response;
  String? token = await getTheToken();

  try {
    response = await http.get(
      Uri.parse(getAllOrdersURL),
      headers: getHeaderRequest(
        token,
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
