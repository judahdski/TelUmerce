import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:telumerce/const/url_endpoint.dart';

import '../model/auth.dart';

Future<Auth?> login(String email, String password) async {
  try {
    final response = await http.post(
        Uri.parse(loginURL),
        body: {
          'email' : email,
          'password' : password
        }
    );

    if(response.statusCode == 200) {
      return Auth.fromJson(jsonDecode(response.body));
    }
  } catch(e) {
    rethrow;
  }
  return null;
}