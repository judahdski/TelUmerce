import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:telumerce/const/url_endpoint.dart';
import 'package:telumerce/services/utils/helper_method.dart';

import '../../model/api_response.dart';

Future<ApiResponse> uploadPaymentOrderService(int id, String imageFile) async {
  http.StreamedResponse response;

  http.MultipartFile pic =
      await http.MultipartFile.fromPath("pembayaran", imageFile);
  http.MultipartRequest request =
      http.MultipartRequest("POST", Uri.parse(orderPaymentURL(id)));
  // ..files.add(pic);
  request.files.add(pic);

  try {
    response = await request.send();
  } catch (e) {
    return catchTheException(e.toString());
  }

  final code = response.statusCode;
  return (code >= 200 && code <= 299)
      ? processingSuccessResponse(jsonDecode(response.stream.toString()))
      : processingFailedResponse('POST', code);
}
