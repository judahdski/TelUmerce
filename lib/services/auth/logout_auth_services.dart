import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:telumerce/const/url_endpoint.dart';

Future<String> logoutService() async {
  SharedPreferences pref = await SharedPreferences.getInstance();

  Map<String, String> header = {
    'Authorization': 'Bearer ${pref.getString('token')}',
    'Cookie':
        'XSRF-TOKEN=eyJpdiI6IkNGY3BhT2NSWHhZd3VDU0dKOE9vaHc9PSIsInZhbHVlIjoieEhrdDd1aEhPQzNHazlsRVU5KzNpdmhFRzA1aStvWU14YWNLOEtwZnRHSXhybGpObnU0Vno1enhSOUQzdE5aeVhZSk9mSitMdTRLWkMrOTJiYXJoNUErUGV3RUZiUDYvdjBNRnhLYlh6aUlrZWx2aTR1cC9abHRzaW1WNkhwR3kiLCJtYWMiOiJkOWQ0NTJlZWMwOWExNGFiOWE2ZmU5M2RkYmQzNDNhOGViMDdmZmFjYWViMzg4NmNkN2VjMzI1ODg4MDE5MGIxIiwidGFnIjoiIn0%3D; telu_ecommerce_session=eyJpdiI6IkVTeTNVQjA1dkZLY1lXaW1nNjl6Snc9PSIsInZhbHVlIjoiK2hDSlRDSHpJRkVUeTY4MDVvWC9CRDNUV1p3ZzRDM0lycTlRZHJkcExWTlcrR1p1M3N5NWJ2ZndoWG04a1g3K08wcng4Snl3SGFlSzA5VjBTSDJ3TU55d2hyc3F4M0xYbnRBR0E2dHhkdzdCdWQ2UTJaSDh0Qk9XSEMyREpKOWsiLCJtYWMiOiIwZDFkMzdjOGZkNjRlN2Q3MDFmMjg2ZDczNTM3NTlmYjBjZjVmYjAxMDEyNWZkMmNjZDBlY2VmMmVhNTI1MzY0IiwidGFnIjoiIn0%3D',
    'Postman-Token': '<calculated when request is sent>',
  };

  final response = await http.post(
    Uri.parse(logoutURL),
    headers: header,
  );

  return jsonDecode(response.body)['message'];
}
