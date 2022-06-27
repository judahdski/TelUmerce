import 'dart:convert';
import 'dart:html';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:telumerce/const/url_endpoint.dart';
import 'package:telumerce/services/utils/helper_method.dart';

import '../../model/api_response.dart';

Future<ApiResponse> uploadPaymentOrderService(int id, String imageFile) async {
  StreamedResponse response;

  var pic = await http.MultipartFile.fromPath("pembayaran", imageFile);
  var request = http.MultipartRequest("POST", Uri.parse(orderPaymentURL(id)))
      ..files.add(pic);

  try {
    response = await request.send();
  } catch (e) {
    return catchTheException(e.toString());
  }

  final code = response.statusCode;
  print(code);
  print(response.stream.toString());

  return (code >= 200 && code <= 299)
          ? processingSuccessResponse(jsonDecode(response.stream.toString()))
          : processingFailedResponse('POST', code);
}
