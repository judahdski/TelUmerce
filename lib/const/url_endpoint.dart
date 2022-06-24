const baseURL = "http://telyu-ecommerce.herokuapp.com/api";
// baseurl for emu = http://10.0.2.2:8000/api
// baseurl for other = http://localhost:8000/api
// baseurl for other = http://127.0.0.1:8000/api
// baseurl = http://telyu-ecommerce.herokuapp.com/api/

// a u t h
const loginURL = baseURL + '/login';
const registerURL = baseURL + '/register';
const logoutURL = baseURL + '/logout';

// p r o f i l e
const getUserURL = baseURL + '/user';
const updateUserURL = baseURL + '/user/edit';
const updatePasswordUserURL = baseURL + '/user/edit_password';

// p r o d u c t
const getAllProductsURL = baseURL + '/products';
String getProductDetailURL (int id) {
  return '$baseURL/products/$id';
}

// o r d e r
const createOrderURL = baseURL + '/order';
const getAllOrdersURL = baseURL + '/order';
String orderPaymentURL(int id) {
  return '$baseURL/order/pembayaran/$id';
}
String cancelledOrderURL(int id) {
  return '$baseURL/order/dibatalkan/$id';
}
String orderTimeOutURL(int id) {
  return '$baseURL/order/waktu_abis/$id';
}
String getOrderDetailURL(int id) {
  return '$baseURL/order/detail/$id';
}

// w i s h l i s t
const getAllWishlistURL = baseURL +'/wishlist';
String addWishlistURL(int id) {
  return '$baseURL/wishlist/$id';
}
String deleteWishlistURL(int id) {
  return '$baseURL/wishlist/delete/$id';
}

// c a r t
const getAllUserCartURL = baseURL + '/cart';
const addCartURL = baseURL + '/cart/store';
String deleteCartURL(int id) {
  return '$baseURL/cart/delete/$id';
}

// p a y m e n t
const paymentURL = baseURL + '/payment';

// e r r o r  m e s s a g e
const getError = "Terjadi kesalahan saat mengambil data.";
const postError = "Terjadi kesalahan saat mengirim data.";
const putError = "Terjadi kesalahan saat mengubah data.";
const deleteError = "Terjadi kesalahan saat menghapus data.";
const unauthorized = "Data invalid";
const notFound = "404 tidak ketemu";


/*
  h e a d e r s
 */
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


/*
  shared preferences const
 */
const tokenConst = 'token';