import 'package:http/http.dart' as http;
import 'package:telumerce/const/url_endpoint.dart';

Future getAllProducts() async {
  print('dah masuk ke fungsi getAllProducts');
  var response = await http.get(Uri.parse(getAllProductsURL), headers: {
    'Authorization': 'Bearer 17|cmtpTr2shr1n2xnEZDhyHumovsxtxk00u3pEYVyG',
    'Postman-Token': '<calculated when request is sent>',
    'Host': '<calculated when request is sent>',
    'User-Agent': 'PostmanRuntime/7.29.0',
    'Accept': '*/*',
    'Accept-Encoding': 'gzip, deflate, br',
    'Connection': 'keep-alive'
  });
  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');
}
