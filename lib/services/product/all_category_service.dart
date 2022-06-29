import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:telumerce/const/url_endpoint.dart';
import 'package:telumerce/model/categori.dart';
import 'package:telumerce/services/utils/helper_method.dart';

import '../../model/api_response.dart';

Future<ApiResponse> getCategoriesService() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  http.Response response;
  
  try {
    response = await http.get(
      Uri.parse(getAllCategoriesURL),
      headers: getHeaderRequest(pref.getString(tokenConst)),
    );
  } catch(e) {
    return catchTheException(e.toString());
  }
  
  final code = response.statusCode;
  List data = jsonDecode(response.body)['data'];
  List categoryList = categoriesFromJson(jsonEncode(data));

  return (code >= 200 && code <= 299)
          ? processingSuccessResponse(categoryList)
          : processingFailedResponse('GET', code);
}