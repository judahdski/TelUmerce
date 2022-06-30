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
const getAllCategoriesURL = baseURL + '/products/category';
String getProductDetailURL (int id) {
  return '$baseURL/products/$id';
}

// o r d e r
const createOrderURL = baseURL + '/order/create';
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

/*
  base image url
 */
const baseImageURL = 'https://telyu-ecommerce.herokuapp.com/img_produk/';
