Map<String, String> getHeaderFileUploadRequest(String? token) {
  return {
    'Authorization': 'Bearer $token',
    'Postman-Token': '<calculated when request is sent>',
    'Content-Type': 'multipart/form-data; boundary=<calculated when request is sent>',
    'Accept': 'application/json'
  };
}

Map<String, String> getHeaderRequest(String? token) {
  return {
    'Authorization': 'Bearer $token',
    'Postman-Token': '<calculated when request is sent>',
    'Accept': 'application/json'
  };
}

Map<String, String> getHeaderWithCookie(String? token) {
  return {
    'Authorization': 'Bearer $token',
    'Cookie': 'XSRF-TOKEN=eyJpdiI6IkNBSEVoNUFNWldxWWVBSytVRjNBbkE9PSIsInZhbHVlIjoiYWYwNVp2b0M5Um5XQjBrV2ZnOU5JdU92MHZzQ3ArNEZRWU13OUZPNTZoUEtEbDByL0JHdVorbk1rRVZiV2orMm44RWk1Vmt5S0MwWERBZm5qOG5zUFpVRmdJZDYvQWRBUjJVN3U0akttRW52TFR0NHhvNWZrRWNWMGJMTm1NMVQiLCJtYWMiOiJkMDQ5NmQyZjY3OTA2ZDU1Nzk2YjZiYmI1M2NiNzc3MWEzNDc1ODhmN2U3NDljMGNhM2IwMGE4NGY5Mzc1YWQwIiwidGFnIjoiIn0%3D; telu_ecommerce_session=eyJpdiI6InpiUVdIQW45WExBUy9wazNaZ3RkWGc9PSIsInZhbHVlIjoiNjJ5bE82TmxMVHY5U1d1RUdPQm5PUHpldlBvTmppQmRSajJjV1ZUZjFrcFpreWhhWlQ2VEJhZnhvSVN3aE1BZXRUYU12OE85MXBkTStIV3dDWGNhRXp3bnFoWFVtSGkya3hhSEZhTjRORXRaR1RzZUxjYzZVTThLRDVKdTdTd0IiLCJtYWMiOiIyYTQ4OTJmZmUxZGMwMjhmNzQ5MzNmMTZiMDQ2MTIzMDE4OWNmNGQ5OTEwM2IwNTRlNTBiMTFkMTZhMGUzOTUzIiwidGFnIjoiIn0%3D',
    'Postman-Token': '<calculated when request is sent>',
    'Accept': 'application/json'
  };
}
