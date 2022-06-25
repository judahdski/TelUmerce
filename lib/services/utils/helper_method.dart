import 'package:telumerce/model/api_response.dart';

import '../../const/url_endpoint.dart';

ApiResponse catchTheException(String e) {
  ApiResponse apiResponse = ApiResponse();

  apiResponse.errorMessage = e;
  apiResponse.isSuccessful = false;

  return apiResponse;
}

ApiResponse processingSuccessResponse(Object data) {
  ApiResponse apiResponse = ApiResponse();

  apiResponse.data = data;
  apiResponse.isSuccessful = true;

  return apiResponse;
}

ApiResponse processingFailedResponse(String httpMethod, int statusCode) {
  ApiResponse apiResponse = ApiResponse();

  var errorMsg = '';

  switch (httpMethod) {
    case 'GET':
      errorMsg = getError;
      break;
    case 'PUT':
      errorMsg = putError;
      break;
    case 'POST':
      errorMsg = postError;
      break;
    case 'DELETE':
      errorMsg = deleteError;
      break;
  }

  switch (statusCode) {
    case 401:
      apiResponse.errorMessage = unauthorized;
      apiResponse.isSuccessful = false;
      break;

    case 404:
      apiResponse.errorMessage = notFound;
      apiResponse.isSuccessful = false;
      break;

    default:
      apiResponse.errorMessage = errorMsg;
      apiResponse.isSuccessful = false;
      break;
  }

  return apiResponse;
}


