import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:telumerce/const/url_endpoint.dart';
import 'package:telumerce/model/api_response.dart';
import 'package:telumerce/services/auth/get_token.dart';

import '../../const/http_header.dart';
import '../../const/key.dart';
import '../utils/helper_method.dart';

Future<ApiResponse> addCartService(String productAmount, int id) async {
  http.Response response;
  String? token = await getTheToken();

  try {
    response = await http.post(Uri.parse(addCartURL),
        headers: getHeaderRequest(token),
        body: {
          'jumlah_barang': productAmount,
          'id_produk': id.toString(),
        });
  } catch (e) {
    return catchTheException(e.toString());
  }

  final code = response.statusCode;

  return (code >= 200 && code <= 299)
          ? processingSuccessResponse(jsonDecode(response.body)['message'])
          : processingFailedResponse('POST', code);
}
