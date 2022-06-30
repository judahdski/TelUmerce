import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:telumerce/const/http_header.dart';
import 'package:telumerce/const/url_endpoint.dart';
import 'package:telumerce/services/auth/get_token.dart';
import 'package:telumerce/services/utils/helper_method.dart';

import '../../model/api_response.dart';

Future<ApiResponse> uploadPaymentOrderService(int id, String imageFile) async {
  String? token = await getTheToken();
  http.StreamedResponse streamedResponse;

  var req = http.MultipartRequest('POST', Uri.parse(orderPaymentURL(id)));
  var multiport = await http.MultipartFile.fromPath(
      'pembayaran',
      imageFile);
  
  req.files.add(multiport);
  req.headers.addAll(getHeaderFileUploadRequest(token));

  try {
    streamedResponse  = await req.send();

  } catch (e) {
    return catchTheException(e.toString());
  }

  final code = streamedResponse.statusCode;
  var response = await http.Response.fromStream(streamedResponse);
  return (code >= 200 && code <= 299)
      ? processingSuccessResponse(jsonDecode(response.body)['message'])
      : processingFailedResponse('POST', code);
}
