import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:telumerce/const/url_endpoint.dart';
import 'package:telumerce/model/categori.dart';
import 'package:telumerce/services/auth/get_token.dart';
import 'package:telumerce/services/utils/helper_method.dart';

import '../../const/http_header.dart';
import '../../model/api_response.dart';

Future<ApiResponse> getCategoriesService() async {
  http.Response response;
  String? token = await getTheToken();

  try {
    response = await http.get(
      Uri.parse(getAllCategoriesURL),
      headers: getHeaderRequest(token),
    );
  } catch (e) {
    return catchTheException(e.toString());
  }

  final code = response.statusCode;
  List data = jsonDecode(response.body)['data'];
  List categoryList = categoriesFromJson(jsonEncode(data));

  return (code >= 200 && code <= 299)
      ? processingSuccessResponse(categoryList)
      : processingFailedResponse('GET', code);
}
