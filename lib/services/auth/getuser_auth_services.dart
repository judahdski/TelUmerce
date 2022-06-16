import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:telumerce/const/url_endpoint.dart';
import 'package:telumerce/model/api_response.dart';
import 'package:telumerce/model/authentication.dart';

Future<ApiResponse> getUserService() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  ApiResponse apiResponse = ApiResponse();

  Map<String, String> header = {
    'Authorization': 'Bearer ${pref.getString('token')}',
    'Cookie':
        'XSRF-TOKEN=eyJpdiI6IjlrZUpnU3dENUFMSmJKc0d3b3NvNlE9PSIsInZhbHVlIjoiNXlKZTNwdUE3MmhBekJCcWNUZS9EdGg1QkVOQ1FmeTVDTkhpRFlDREREd2VXUE94RnJ4MUV4eFZBUDhIMXVOVWthN2hjM1FKclN3SjRVa21JT1lNMGI1ZitLTTdRaCt6SGhWTGpXN3VEOEQxSmFXMG5yRHJXb3phZGtOcDZDODYiLCJtYWMiOiI0YjY1MGZmMTQyNjdhZGExMzM1NTE1NTJhZGVhNmYyYWNjYzIwOGFmNmFiZDcwMDM2OTUzZGYxZWEyNWM2OTA0IiwidGFnIjoiIn0%3D; telu_ecommerce_session=eyJpdiI6IlFMRG42amNoRVFhY1J4ZG81UzU5OWc9PSIsInZhbHVlIjoiQVNVR1pUV3VseDRWNXlwckVmK2FRUW1naWZHa2MzYVp5KzRoQW1ydmtSTzhhR2hvRklzMmtwSENDM0l0SGNza1NqRGlIL252bG1xYjNIeGVTcWJpVENZODNTS2F3bHpkdTlzaHZIMG4zWXRta1lOdTBnR2NYV2xyOURkSjM1eHciLCJtYWMiOiJjMjVhMGMxMmRjNzExNTU3OGE4ODIyNTAxYTRkNGQ1MjE0OTAzM2M5MDI2OTgwYWEwYjY5MThlNDg5MDdmNjk3IiwidGFnIjoiIn0%3D',
    'Postman-Token': '<calculated when request is sent>',
  };

  try {
    final response = await http.get(
      Uri.parse(getUserURL),
      headers: header,
    );

    var curUser = User.fromJson(jsonDecode(response.body)['data']);
    apiResponse.user = curUser;
  } catch (e) {
    apiResponse.errorMessage = e.toString();
  }

  return apiResponse;
}
