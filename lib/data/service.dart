import 'dart:convert';
import 'dart:io';

import 'package:baby_garden_flutter/data/model/remind_calendar.dart';
import 'package:baby_garden_flutter/data/response.dart';
import 'package:baby_garden_flutter/data/shared_value.dart';
import 'package:baby_garden_flutter/provider/user_provider.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'base_service.dart';

const int START_PAGE = 0;
const int PAGE_SIZE = 20;

//TODO require LOGIN
Future<dynamic> login(BuildContext context,
    {String phone, String password}) async {
  Response response = await get(context,
      path: 'login',
      param: {'phone': phone, 'password': password},
      hasAccessToken: true);
  if (response.isSuccess()) return response.data;
  return null;
}

//TODO require REGISTER
Future<dynamic> register(BuildContext context,
    {String phone,
    String name,
    String password,
    String refCode,
    String code}) async {
  Response response =
      await post(context, path: 'register', hasAccessToken: true, param: {
    'phone': phone,
    'name': name,
    'password': password,
    'ref_code': refCode,
    'code_verify': code
  });
  if (response.isSuccess()) return response.data;
  return null;
}

//TODO require VERIFY CODE
Future<dynamic> verifyCode(
    {BuildContext context,
    String phone,
    String name,
    String password,
    String refCode}) async {
  Response response = await post(context, path: "verifyCode", param: {
    'phone': phone,
    'name': name,
    'password': password,
    'ref_code': refCode,
  });
  if (response.isSuccess()) {
    return response.data;
  }
  return null;
}

//TODO require FORGET PASSWORD
Future<dynamic> forgetPassword(BuildContext context, {String phone}) async {
  Response response =
      await post(context, path: "forgetPassword", param: {'phone': phone});
  if (response.isSuccess()) {
    return response.data;
  } else {
    return null;
  }
}

//TODO require FORGET PASSWORD
Future<dynamic> changePassword(BuildContext context,
    {String phone, String password}) async {
  Response response = await post(context,
      path: "changePassword", param: {'phone': phone, 'password': password});
  if (response.isSuccess()) return response.data;
  return null;
}

Future<dynamic> updatePassword(BuildContext context,
    {String oldPass, String newPass}) async {
  String userId = await ShareValueProvider.shareValueProvider.getUserId();
  Response response = await post(context,
      path: "updatePassword",
      param: {"user_id": userId, 'old_pass': oldPass, 'new_pass': newPass});
  if (response.isSuccess()) return response;
  return null;
}

//TODO require favouriteShop
Future<bool> favouriteShop({String shopID}) async {
  String userId = await ShareValueProvider.shareValueProvider.getUserId();
  Response response = await post(null,
      path: "favouriteShop", param: {'user_id': userId, 'shop_id': shopID});
  if (response.isSuccess()) {
    return true;
  }
  return false;
}

//TODO require unFavouriteShop
Future<bool> unFavouriteShop({String shopID}) async {
  String userId = await ShareValueProvider.shareValueProvider.getUserId();
  Response response = await post(null,
      path: "unFavouriteShop", param: {'user_id': userId, 'shop_id': shopID});
  if (response.isSuccess()) {
    return true;
  }
  return false;
}

//TODO require unFavouriteShop
Future<dynamic> addComment(BuildContext context,
    {String newsId, String content}) async {
  String userId = await ShareValueProvider.shareValueProvider.getUserId();
  Response response = await post(context,
      path: "comment",
      param: {'user_id': userId, 'news_id': newsId, "content": content});
  if (response.isSuccess()) return response.data;
  return null;
}

//TODO require unFavouriteShop
Future<dynamic> listComment({String newsId}) async {
  Response response =
      await get(null, path: "listComment", param: {'news_id': newsId});
  if (response.isSuccess()) return response.data;
  return null;
}

/*todo bookingService
user_id: id người dùng
shop_id: id shop
date_booking: ngày đặt
time_booking: giờ đặt
service_id: id dịch vụ
address: địa chỉ
 */
Future<dynamic> bookingService(
    {String userID,
    String shopID,
    String dateBooking,
    String timeBooking,
    String serviceID,
    String address}) async {
  dynamic params = {
    'user_id': userID,
    'shop_id': shopID,
    'date_booking': dateBooking,
    'time_booking': timeBooking,
    'address': address
  };
  if (serviceID != null) {
    params['service_id'] = serviceID;
  }
  Response response = await post(null, path: "bookingService", param: params);
  if (response.isSuccess()) return response.data;
  return null;
}

Future<dynamic> shopDetail({BuildContext context, String shopID}) async {
  String userId = await ShareValueProvider.shareValueProvider.getUserId();
  Response response = await get(context,
      path: "shopDetail", param: {'user_id': userId, 'shop_id': shopID});
  if (response.isSuccess()) return response.data;
  return null;
}

Future<dynamic> shopReceiveTime({BuildContext context, String shopID}) async {
  Response response =
      await get(context, path: "getTime", param: {'shop_id': shopID});
  if (response.isSuccess()) return response.data;
  return null;
}

//todo listProductShop
Future<dynamic> listProductShop({String shopID, String categoryId}) async {
  String userId = await ShareValueProvider.shareValueProvider.getUserId();
  dynamic params = {'user_id': userId, 'shop_id': shopID};
  if (categoryId != null) {
    params['category_id'] = categoryId;
  }
  Response response = await get(null, path: "listProductShop", param: params);
  if (response.isSuccess()) return response.data;
  return null;
}

/*todo bookingProduct
user_id: id người dùng
shop_id: id shop
date_booking: ngày đặt
time_booking: giờ đặt
promotion_code: mã khuyến mại
is_receive: 1: nhận hàng tại shop, 0: giao hàng tận nơi
payment: 1: tiền mặt, 2: chuyển khoản, 3: dùng điểm
note: ghi chú
ship_id: id đơn vị giao hàng
address: địa chỉ nhận hàng
ship_code: mã khuyến mại ship
user_name: tên người nhận
user_phone:sđt
user_address: địa chỉ
city_id: id thành phố
district_id: id quận huyện
*/
Future<dynamic> bookingProduct({
  @required String timeId,
  @required String userID,
  @required String shopID,
  @required String promoteCode,
  @required String isReceiveInShop,
  @required String paymentMethod,
  @required String note,
  @required String address,
  @required String userName,
  @required String userPhone,
  @required String userAddress,
  @required String cityID,
  @required String point,
  @required String districtID,
  @required String wardId,
  @required String shipCode,
  @required String shipCoupon,
}) async {
  Response response = await post(null, path: "bookingProduct", param: {
    'point': point,
    'user_id': userID,
    'shop_id': shopID,
    'promotion_code': promoteCode,
    'is_receive': isReceiveInShop,
    'payment': paymentMethod,
    'note': note,
    'address': address,
    'user_name': userName,
    'user_phone': userPhone,
    'user_address': userAddress,
    'city_id': cityID,
    'district_id': districtID,
    'ward_id': wardId,
    'time_id': timeId,
    'code': shipCode,
    'coupon': shipCoupon
  });
  if (response.isSuccess()) return response.data;
  return null;
}

Future<dynamic> listVoucher({int index, String categoryId}) async {
  String userId = await ShareValueProvider.shareValueProvider.getUserId();
  dynamic param = {
    'user_id': userId,
    'index': index.toString(),
    'number_post': PAGE_SIZE.toString(),
  };
  if (categoryId != null) {
    param['category_id'] = categoryId;
  }
  Response response = await get(null, path: "listVoucher", param: param);
  if (response.isSuccess()) return response.data;
  return null;
}

Future<dynamic> listVoucherShop(String shopId) async {
  dynamic param = {
    'shop_id': shopId,
  };
  Response response = await get(null, path: "listVoucherShop", param: param);
  if (response.isSuccess()) return response.data;
  return null;
}

Future<dynamic> cancelBooking(BuildContext context,
    {int index, String bookingId}) async {
  String userId = await ShareValueProvider.shareValueProvider.getUserId();
  dynamic param = {
    'user_id': userId,
    'booking_id': bookingId,
  };
  Response response = await post(null, path: "cancelBooking", param: param);
  if (response.isSuccess()) return response.data;
  return null;
}

Future<dynamic> listVoucherUser(int type) async {
  String userId = await ShareValueProvider.shareValueProvider.getUserId();
  Response response = await get(null,
      path: "listVoucherUser",
      param: {'user_id': userId, 'type': type.toString()});
  if (response.isSuccess()) return response.data;
  return null;
}

Future<dynamic> voucherDetail({String voucherId}) async {
  String userId = await ShareValueProvider.shareValueProvider.getUserId();
  Response response = await get(null,
      path: "voucherDetail",
      param: {'user_id': userId, 'voucher_id': voucherId});
  if (response.isSuccess()) return response.data;
  return null;
}

Future<Response> getCodeVoucher(BuildContext context,
    {String voucherId}) async {
  String userId = await ShareValueProvider.shareValueProvider.getUserId();
  Response response = await get(null,
      path: "getCodeVoucher",
      param: {'user_id': userId, 'voucher_id': voucherId});
  if (response.isSuccess()) return response;
  return null;
}

//todo notification
Future<dynamic> notification() async {
  String userId = await ShareValueProvider.shareValueProvider.getUserId();
  Response response =
      await get(null, path: "notification", param: {'user_id': userId});
  if (response.isSuccess()) return response.data;
  return null;
}

//todo notificationDetail
Future<dynamic> notificationDetail({String notifyID}) async {
  String userId = await ShareValueProvider.shareValueProvider.getUserId();
  Response response = await get(null,
      path: "notificationDetail",
      param: {'user_id': userId, 'noty_id': notifyID});
  if (response.isSuccess()) return response.data;
  return null;
}

//todo deleteNoty
Future<dynamic> deleteNoty({String notifyID}) async {
  String userId = await ShareValueProvider.shareValueProvider.getUserId();
  Response response = await post(null,
      path: "deleteNoty", param: {'user_id': userId, 'noty_id': notifyID});
  if (response.isSuccess()) return response.data;
  return null;
}

//todo news
Future<dynamic> news(
    {String index, String numberPost, String categoryId}) async {
  dynamic params = {
    'index': index,
    'number_post': numberPost,
  };
  if (categoryId != null && categoryId.isNotEmpty) {
    params['category_id'] = categoryId;
  }
  Response response = await get(null, path: "news", param: params);
  if (response.isSuccess()) return response.data;
  return null;
}

Future<dynamic> newsCategories() async {
  Response response = await get(null, path: "news-category");
  if (response.isSuccess()) return response.data;
  return null;
}

//todo newsDetail
Future<dynamic> newsDetail({String newID}) async {
  Response response =
      await get(null, path: "newsDetail", param: {'news_id': newID});
  if (response.isSuccess()) return response.data;
  return null;
}

//todo bookingDetail
Future<dynamic> bookingDetail({var bookingID}) async {
  String userId = await ShareValueProvider.shareValueProvider.getUserId();
  Response response = await get(null,
      path: "bookingDetail",
      param: {'user_id': userId, 'booking_id': bookingID.toString()});
  if (response.isSuccess()) return response.data;
  return null;
}

//todo district
Future<dynamic> district({String id}) async {
  Response response = await get(null, path: "district", param: {'city_id': id});
  if (response.isSuccess()) return response.data;
  return null;
}

//todo ward
Future<dynamic> ward({String id}) async {
  Response response = await get(null, path: "ward", param: {'district_id': id});
  if (response.isSuccess()) return response.data;
  return null;
}

//todo listShiper
Future<dynamic> feeShipping(
    {String shopId,
    String districtId,
    String wardId,
    String userAddress}) async {
  String userId = await ShareValueProvider.shareValueProvider.getUserId();
  dynamic params = {
    'user_id': userId,
    'shop_id': shopId,
    'district_id': districtId,
    'ward_id': wardId,
    'user_address': userAddress
  };
  Response response = await post(null, path: "feeShipping", param: params);
  if (response.isSuccess()) return response.data;
  return null;
}

Future<dynamic> feeDiscountShipping(
    {String shopId,
    String districtId,
    String wardId,
    String userAddress,
    String transferCode,
    String coupon}) async {
  String userId = await ShareValueProvider.shareValueProvider.getUserId();
  dynamic params = {
    'user_id': userId,
    'shop_id': shopId,
    'district_id': districtId,
    'ward_id': wardId,
    'user_address': userAddress,
    'code': transferCode ?? '',
    'coupon': coupon ?? ''
  };
  Response response =
      await post(null, path: "feeDiscountShipping", param: params);
  if (response.isSuccess()) return response.data;
  return null;
}

//todo city
Future<dynamic> city() async {
  Response response = await get(null, path: "city");
  if (response.isSuccess()) return response.data;
  return null;
}

//todo rateBooking
Future<dynamic> rateBooking(BuildContext context,
    {String bookingID, String star, String content, File img}) async {
  String userId = await ShareValueProvider.shareValueProvider.getUserId();
  dynamic files = {"img": img};
  dynamic param = {
    'user_id': userId,
    'booking_id': bookingID,
    'star': star.toString(),
    'content': content.toLowerCase()
  };
  Response response;
  if (img.path == "") {
    response = await post(context,
        path: "rateBooking", param: param, requireLogin: true);
  } else {
    response = await postMultiPart(context,
        path: "rateBooking", param: param, files: files, requireLogin: true);
  }
  if (response.isSuccess()) return response.data;
  return null;
}

Future<dynamic> configureUserNotify(BuildContext context,
    {String isNoti, String type}) async {
  String userId = await ShareValueProvider.shareValueProvider.getUserId();
  dynamic param = {
    'user_id': userId,
    'is_noti': isNoti,
    'type': type,
  };
  Response response =
      await post(context, path: "configNoti", param: param, requireLogin: true);
  if (response.isSuccess()) return response.data;
  return null;
}

//todo rateBooking
Future<dynamic> rateProduct(BuildContext context,
    {String productId,
    String bookingID,
    String star,
    String content,
    File img}) async {
  String userId = await ShareValueProvider.shareValueProvider.getUserId();
  dynamic files = {"img": img};
  dynamic param = {
    'user_id': userId,
    'product_id': productId,
    'booking_id': bookingID.toString(),
    'star': star.toString(),
    'content': content.toLowerCase()
  };
  Response response;
  if (img.path == "") {
    response = await post(context,
        path: "rateProduct", param: param, requireLogin: true);
  } else {
    response = await postMultiPart(context,
        path: "rateProduct", param: param, files: files, requireLogin: true);
  }
  if (response.isSuccess()) return response.data;
  return null;
}

//todo listBookingService
Future<dynamic> listBookingService({int type}) async {
  String userId = await ShareValueProvider.shareValueProvider.getUserId();
  Response response = await get(null,
      path: "listBookingService",
      param: {'user_id': userId, 'type': type.toString()});
  if (response.isSuccess()) return response.data;
  return null;
}

//todo listBookingProduct
Future<dynamic> listBookingProduct({int type}) async {
  String userId = await ShareValueProvider.shareValueProvider.getUserId();
  Response response = await get(null,
      path: "listBookingProduct",
      param: {'user_id': userId, 'type': type.toString()});
  if (response.isSuccess()) return response.data;
  return null;
}

//TODO paymentInfo
Future<dynamic> paymentInfo() async {
  Response response = await get(null, path: "paymentInfo");
  if (response.isSuccess()) return response.data;
  return null;
}

//TODO PAYMENT
Future<dynamic> payment(BuildContext context,
    {String userID,
    String bookingId,
    double money,
    String content,
    String note,
    File img}) async {
  dynamic files = {"img": img};
  dynamic param = {
    'user_id': userID,
    'booking_id': bookingId,
    'money': money.toString(),
    'content': content,
    'note': note.toLowerCase(),
  };
  Response response;
  if (img == null || img.path == null || img.path.isEmpty) {
    response =
        await post(context, path: "payment", param: param, requireLogin: true);
  } else {
    response = await postMultiPart(context,
        path: "payment", param: param, files: files, requireLogin: true);
  }
  if (response.isSuccess()) return response.data;
  return null;
}

Future<dynamic> productCategory({String parentId}) async {
  dynamic params;
  if (parentId != null) {
    params = {'parent_id': parentId};
  }
  Response response =
      await get(null, path: "category", showLoading: false, param: params);
  if (response.isSuccess()) return response.data;
  return null;
}

Future<dynamic> voucherCategory() async {
  Response response =
      await get(null, path: "voucherCategory", showLoading: false);
  if (response.isSuccess()) return response.data;
  return null;
}

Future<dynamic> serviceCategory() async {
  Response response =
      await get(null, path: "serviceCategory", showLoading: false);
  if (response.isSuccess()) return response.data;
  return null;
}

Future<dynamic> banners() async {
  Response response = await get(null, path: "banner", showLoading: false);
  if (response.isSuccess()) return response.data;
  return null;
}

Future<dynamic> listShop(BuildContext context,
    {String categoryId,
    int index = START_PAGE,
    int numberPosts = PAGE_SIZE}) async {
  String userId = await ShareValueProvider.shareValueProvider.getUserId();
  dynamic params = {
    "user_id": userId,
    "index": index.toString(),
    "number_post": numberPosts.toString()
  };
  if (categoryId != null && categoryId.isNotEmpty) {
    params['category_id'] = categoryId;
  }
  Response response =
      await get(null, path: "listShop", param: params, showLoading: true);
  if (response.isSuccess()) return response.data;
  return null;
}

Future<dynamic> listRating({String shopId, int type = 1}) async {
  dynamic params = {
    "shop_id": shopId,
    "type": type.toString(),
  };
  Response response =
      await get(null, path: "listRating", param: params, showLoading: true);
  if (response.isSuccess()) return response.data;
  return null;
}

Future<dynamic> listProducts(BuildContext context, String path,
    {String categoryId,
    String parentId,
    String productId,
    int index = START_PAGE,
    int numberPosts = PAGE_SIZE}) async {
  String userId = await ShareValueProvider.shareValueProvider.getUserId();

  dynamic params = {
    "user_id": userId,
    "index": index.toString(),
    "number_post": numberPosts.toString()
  };
  if (categoryId != null && categoryId.isNotEmpty) {
    params['category_id'] = categoryId;
  }
  if (parentId != null && parentId.isNotEmpty) {
    params['parent_id'] = parentId;
  }
  if (productId != null && productId.isNotEmpty) {
    params['product_id'] = productId;
  }
  Response response =
      await get(null, path: path, param: params, showLoading: false);
  if (response.isSuccess()) return response.data;
  return null;
}

Future<dynamic> favoriteProduct(BuildContext context,
    {String productId}) async {
  String userId = await ShareValueProvider.shareValueProvider.getUserId();

  dynamic params = {
    "user_id": userId,
    "product_id": productId,
  };
  Response response = await post(context,
      path: 'favouriteProduct', param: params, requireLogin: true);
  if (response.isSuccess()) return response.data;
  return null;
}

Future<dynamic> unFavoriteProduct(BuildContext context,
    {String productId}) async {
  String userId = await ShareValueProvider.shareValueProvider.getUserId();
  dynamic params = {
    "user_id": userId,
    "product_id": productId,
  };
  Response response = await post(context,
      path: 'unFavouriteProduct', param: params, requireLogin: true);
  if (response.isSuccess()) return response.data;
  return null;
}

Future<dynamic> productDetail(BuildContext context, {String productId}) async {
  String userId = await ShareValueProvider.shareValueProvider.getUserId();
  Response response = await get(context,
      path: 'productDetail',
      param: {'user_id': userId, 'product_id': productId},
      showLoading: true);
  if (response.isSuccess()) return response.data;
  return null;
}

Future<void> addProductCart({List<dynamic> products}) async {
  String userId = await ShareValueProvider.shareValueProvider.getUserId();
  List<dynamic> ps = new List();
  for (dynamic p in products) {
    if (p['quantity'] != null && p['quantity'] > 0)
      ps.add({
        'product_id': p['product_id'] ?? p['id'],
        'number': p['quantity'],
        'color_id': p['color_id'],
        'size_id': p['size_id'],
      });
  }
  dynamic params = {
    "user_id": userId,
    "list_product": jsonEncode(ps),
  };
  Response response = await post(null,
      path: 'addProductCart',
      param: params,
      requireLogin: true,
      showLoading: false);
  if (response.isSuccess()) return response.data;
  return null;
}

Future<void> editProductCart(
    {String productId, int number, String sizeId, String colorId}) async {
  String userId = await ShareValueProvider.shareValueProvider.getUserId();
  dynamic params = {
    "user_id": userId,
    "product_id": productId,
    "number": number.toString(),
  };
  if (sizeId != null) {
    params['size_id'] = sizeId;
  }
  if (colorId != null) {
    params['color_id'] = colorId;
  }
  Response response = await post(null,
      path: 'editProduct',
      param: params,
      requireLogin: true,
      showLoading: false);
  if (response.isSuccess()) return response.data;
  return null;
}

Future<void> deleteProductCart(String productId) async {
  String userId = await ShareValueProvider.shareValueProvider.getUserId();
  dynamic params = {
    "user_id": userId,
    "product_id": productId,
  };
  Response response = await post(null,
      path: 'deleteProduct',
      param: params,
      requireLogin: true,
      showLoading: false);
  if (response.isSuccess()) return response.data;
  return null;
}

Future<dynamic> myCart() async {
  String userId = await ShareValueProvider.shareValueProvider.getUserId();
  dynamic params = {"user_id": userId};
  Response response = await get(null,
      path: 'cartInfo', param: params, requireLogin: true, showLoading: false);
  if (response != null && response.isSuccess()) return response.data;
  return null;
}

Future<dynamic> reportTitle() async {
  Response response = await get(null, path: 'reportTitle', showLoading: false);
  if (response.isSuccess()) return response.data;
  return null;
}

Future<Response> reportProduct(BuildContext context,
    {String productId,
    String title,
    String content,
    String titleId,
    File img}) async {
  String userId = await ShareValueProvider.shareValueProvider.getUserId();
  dynamic params = {
    "user_id": userId,
    "product_id": productId,
    "title": title ?? '',
    "content": content ?? '',
    "titleId": titleId ?? ''
  };
  dynamic files = {"img": img};
  Response response = await postMultiPart(context,
      path: 'reportProduct', param: params, files: files, requireLogin: true);
  if (response.isSuccess()) return response;
  return null;
}

Future<Response> receiveNotify(BuildContext context,
    {String productId, int number}) async {
  String userId = await ShareValueProvider.shareValueProvider.getUserId();
  dynamic params = {
    "user_id": userId,
    "product_id": productId,
    "number": number.toString()
  };
  Response response = await post(context,
      path: 'receiveNoty', param: params, requireLogin: true);
  if (response.isSuccess()) return response;
  return null;
}

Future<Response> registerPartner(BuildContext context,
    {String shopName, String phone, String address, String job}) async {
  String userId = await ShareValueProvider.shareValueProvider.getUserId();
  dynamic params = {
    "user_id": userId,
    "name": shopName,
    "phone": phone,
    "address": address,
    "job": job,
  };
  Response response = await post(context,
      path: 'registerPartner',
      param: params,
      requireLogin: true,
      showLoading: true);
  if (response.isSuccess()) return response;
  return null;
}

Future<dynamic> getUserInfo(BuildContext context,
    {@required String userId}) async {
  Response response = await post(context, path: "", param: {'user_id': userId});
  if (response.isSuccess()) return response.data;
  return null;
}

Future<dynamic> listAddress() async {
  String userId = await ShareValueProvider.shareValueProvider.getUserId();

  dynamic params = {"user_id": userId};

  Response response =
      await get(null, path: "listAddress", param: params, showLoading: false);
  if (response.isSuccess()) return response.data;
  return null;
}

Future<dynamic> listFavouriteShop(
    {int index = START_PAGE, int numberPosts = PAGE_SIZE}) async {
  String userId = await ShareValueProvider.shareValueProvider.getUserId();
  dynamic params = {
    "user_id": userId,
    "index": index.toString(),
    "number_post": numberPosts.toString()
  };
  Response response = await get(null, path: "listFavouriteShop", param: params);
  if (response.isSuccess()) return response.data;
  return null;
}

Future<dynamic> listPromotion() async {
  String userId = await ShareValueProvider.shareValueProvider.getUserId();
  dynamic params = {
    "user_id": userId,
  };
  Response response =
      await get(null, path: "listPromotion", param: params, requireLogin: true);
  if (response.isSuccess()) return response.data;
  return null;
}

Future<Response> addUserAddress(BuildContext context,
    {String address,
    int isMain,
    String cityId,
    String districtId,
    String wardId,
    String phone,
    String name}) async {
  String userId = await ShareValueProvider.shareValueProvider.getUserId();
  dynamic params = {
    "user_id": userId,
    "address": address,
    "is_main": isMain.toString(),
  };
  if (cityId != null) {
    params['city_id'] = cityId.toString();
  }
  if (districtId != null) {
    params['district_id'] = districtId.toString();
  }
  if (wardId != null) {
    params['ward_id'] = wardId.toString();
  }
  if (phone != null) {
    params['phone'] = phone.toString();
  }
  if (name != null) {
    params['name'] = name.toString();
  }

  Response response = await post(context,
      path: "addAddress", param: params, requireLogin: true, showLoading: true);
  if (response.isSuccess()) return response;
  return null;
}

Future<Response> editUserAddress(BuildContext context,
    {String address,
    int isMain,
    String addressId,
    String cityId,
    String districtId,
    String wardId,
    String phone,
    String name}) async {
  String userId = await ShareValueProvider.shareValueProvider.getUserId();
  dynamic params = {
    "user_id": userId,
    "address": address,
    "is_main": isMain.toString(),
    "address_id": addressId
  };

  if (cityId != null) {
    params['city_id'] = cityId.toString();
  }
  if (cityId != null) {
    params['district_id'] = districtId.toString();
  }
  if (cityId != null) {
    params['ward_id'] = wardId.toString();
  }
  if (cityId != null) {
    params['phone'] = phone.toString();
  }
  if (cityId != null) {
    params['name'] = name.toString();
  }
  Response response = await post(context,
      path: "editAddress",
      param: params,
      requireLogin: true,
      showLoading: true);
  if (response.isSuccess()) return response;
  return null;
}

Future<Response> updateAvatar(BuildContext context, {File img}) async {
  String userId = await ShareValueProvider.shareValueProvider.getUserId();
  dynamic params = {
    "user_id": userId,
  };
  dynamic files = {"img": img};
  Response response = await postMultiPart(context,
      path: 'updateAvatar', param: params, files: files, requireLogin: true);

  if (response.isSuccess()) {
    Provider.of<UserProvider>(context, listen: false)
        .updateAvatar(response.data);
    return response;
  }

  return null;
}

Future<Response> deleteAddress(BuildContext context,
    {@required String addressId}) async {
  String userId = await ShareValueProvider.shareValueProvider.getUserId();
  dynamic params = {"user_id": userId, 'address_id': addressId};

  Response response = await post(context,
      path: 'deleteAddress',
      param: params,
      requireLogin: true,
      showLoading: true);
  if (response.isSuccess()) return response;
  return null;
}

Future<dynamic> listBaby(BuildContext context) async {
  String userId = await ShareValueProvider.shareValueProvider.getUserId();
  dynamic params = {"user_id": userId};

  Response response =
      await get(context, path: 'listBaby', param: params, requireLogin: true);
  if (response.isSuccess()) return response.data;
  return null;
}

Future<dynamic> testResult({String babyId, int type}) async {
  String userId = await ShareValueProvider.shareValueProvider.getUserId();
  dynamic params = {
    "user_id": userId,
    "baby_id": babyId,
    "type": type.toString()
  };

  Response response =
      await get(null, path: 'testResult', param: params, requireLogin: true);
  if (response.isSuccess()) return response.data;
  return null;
}

Future<dynamic> addBabyTest(BuildContext context,
    {String babyId,
    String height,
    String weight,
    String note,
    File img}) async {
  dynamic params = {
    "baby_id": babyId,
    "height": height.toString(),
    "weight": weight.toString(),
    "note": note,
  };
  dynamic files = {"img": img};
  Response response = await postMultiPart(context,
      path: 'addTest', param: params, files: files, requireLogin: true);
  if (response.isSuccess()) return response;
  return null;
}

Future<dynamic> addBaby(BuildContext context,
    {String name, int gender, String birthday, File img}) async {
  String userId = await ShareValueProvider.shareValueProvider.getUserId();
  dynamic params = {
    "user_id": userId,
    "name": name,
    "gender": gender.toString(),
    "birthday": DateUtil.convertNormalToServerDate(birthday),
  };
  dynamic files = {"img": img};
  Response response = await postMultiPart(context,
      path: 'addBaby', param: params, files: files, requireLogin: true);
  if (response.isSuccess()) return response;
  return null;
}

Future<dynamic> editBaby(BuildContext context,
    {String babyId, String name, int gender, String birthday, File img}) async {
  String userId = await ShareValueProvider.shareValueProvider.getUserId();
  dynamic params = {
    "user_id": userId,
    "baby_id": babyId,
    "name": name,
    "gender": gender.toString(),
    "birthday": DateUtil.convertNormalToServerDate(birthday),
  };
  dynamic files = {"img": img};
  Response response = await postMultiPart(context,
      path: 'editBaby', param: params, files: files, requireLogin: true);
  if (response.isSuccess()) return response;
  return null;
}

Future<Response> verifyCodeVoucher(BuildContext context,
    {String voucherId, String code}) async {
  String userId = await ShareValueProvider.shareValueProvider.getUserId();
  dynamic params = {"user_id": userId, "voucher_id": voucherId, "code": code};

  Response response = await post(null,
      path: 'verifyCodeVoucher', param: params, requireLogin: true);
  return response;
}

Future<dynamic> useVoucher({String voucherId}) async {
  String userId = await ShareValueProvider.shareValueProvider.getUserId();
  dynamic params = {"user_id": userId, "voucher_id": voucherId};

  Response response =
      await post(null, path: 'useVoucher', param: params, requireLogin: true);
  if (response.isSuccess()) return response.data;
  return null;
}

Future<dynamic> promotionDetail({String code}) async {
  String userId = await ShareValueProvider.shareValueProvider.getUserId();
  dynamic params = {"user_id": userId, "code": code};
  Response response = await get(null,
      path: 'promotionDetail', param: params, requireLogin: true);
  if (response.isSuccess()) return response.data;
  return null;
}

Future<dynamic> getListRemindCalendar(BuildContext context) async {
  String userId = await ShareValueProvider.shareValueProvider.getUserId();
  dynamic params = {"user_id": userId};

  Response response = await get(context, path: "listCalendar", param: params);
  if (response.isSuccess()) return response.data;
  return null;
}

Future<dynamic> deleteRemindCalendar(BuildContext context,
    {@required String calendarId}) async {
  String userId = await ShareValueProvider.shareValueProvider.getUserId();
  dynamic params = {"user_id": userId, "calendar_id": calendarId};

  Response response = await post(context,
      path: 'deleteCalendar',
      param: params,
      requireLogin: true,
      showLoading: false);
  if (response.isSuccess()) return response;
  return null;
}

Future<dynamic> addRemindCalendar(BuildContext context,
    {@required RemindCalendar calendar}) async {
  String userId = await ShareValueProvider.shareValueProvider.getUserId();
  var params = calendar.toJson();
  params['user_id'] = userId;
  String path = 'addCalendar';

  if (calendar.id != null) {
    params['calendar_id'] = calendar.id;
    path = 'editCalendar';
  }

  Response response = await post(context,
      path: path, param: params, requireLogin: true, showLoading: true);
  if (response.isSuccess()) return response;
  return null;
}

Future<dynamic> listRemindProducts(String type) async {
  String userId = await ShareValueProvider.shareValueProvider.getUserId();
  dynamic params = {
    "user_id": userId,
    "type": type,
  };

  Response response = await get(null,
      path: 'productCalendar', param: params, showLoading: false);
  if (response.isSuccess()) return response.data;
  return null;
}

Future<dynamic> getListPoint(BuildContext context) async {
  String userId = await ShareValueProvider.shareValueProvider.getUserId();
  dynamic params = {"user_id": userId};

  Response response = await get(context, path: "managePoint", param: params);

  if (response.isSuccess()) return response.data;
  return null;
}

Future<dynamic> getPointDetail(BuildContext context, String shopId) async {
  String userId = await ShareValueProvider.shareValueProvider.getUserId();
  dynamic params = {"user_id": userId, "shop_id": shopId};

  Response response = await get(context, path: "pointDetail", param: params);

  if (response.isSuccess()) return response.data;
  return null;
}

Future<dynamic> hotKey() async {
  Response response = await get(null, path: "hotKey");
  if (response.isSuccess()) return response.data;
  return null;
}

Future<dynamic> searchHistory() async {
  String userId = await ShareValueProvider.shareValueProvider.getUserId();
  dynamic params = {"user_id": userId};

  Response response = await get(null, path: "searchHistory", param: params);

  if (response.isSuccess()) return response.data;
  return null;
}

Future<dynamic> search(String key) async {
  String userId = await ShareValueProvider.shareValueProvider.getUserId();
  dynamic params = {"user_id": userId, "key": key};

  Response response = await get(null, path: "search", param: params);

  if (response.isSuccess()) return response.data;
  return null;
}

Future<dynamic> searchProduct({String key, String code, int index = 0}) async {
  String userId = await ShareValueProvider.shareValueProvider.getUserId();
  dynamic params = {
    "user_id": userId,
    "key": key,
    "index": index.toString(),
    "number_post": PAGE_SIZE.toString()
  };
  if (key != null) {
    params['key'] = key;
  }
  if (code != null) {
    params['code'] = code;
  }

  Response response = await get(null, path: "searchProduct", param: params);

  if (response.isSuccess()) return response.data;
  return null;
}

Future<dynamic> popup() async {
  Response response = await get(null, path: "popup");

  if (response.isSuccess()) return response.data;
  return null;
}

Future<dynamic> balloons() async {
  Response response = await get(null, path: "balloons");

  if (response.isSuccess()) return response.data;
  return null;
}

Future<dynamic> numberBooking() async {
  String userId = await ShareValueProvider.shareValueProvider.getUserId();
  dynamic params = {"user_id": userId};

  Response response = await get(null, path: "numberBooking", param: params);

  if (response.isSuccess()) return response.data;
  return null;
}

Future<dynamic> mainCategory() async {
  Response response = await get(null, path: "mainCategory");

  if (response.isSuccess()) return response.data;
  return null;
}

Future<dynamic> listQuestion() async {
  Response response = await get(null, path: "listQuestion");
  if (response.isSuccess()) return response.data;
  return null;
}

Future<dynamic> support() async {
  Response response = await get(null, path: "support");
  if (response.isSuccess()) return response.data;
  return null;
}

Future<Response> deleteSearch(BuildContext context) async {
  String userId = await ShareValueProvider.shareValueProvider.getUserId();
  dynamic params = {"user_id": userId};

  Response response = await post(context, path: "deleteSearch", param: params);

  if (response.isSuccess()) return response;
  return null;
}

Future<Response> updateToken({String token}) async {
  String userId = await ShareValueProvider.shareValueProvider.getUserId();
  ShareValueProvider.shareValueProvider.saveFcmToken(token);
  if (userId == null) return null;
  dynamic params = {"user_id": userId, "token_fcm": token};

  Response response = await post(null, path: "updateToken", param: params);

  if (response.isSuccess()) return response;
  return null;
}

Future<dynamic> updateProfile(BuildContext context,
    {String name, String gender, String birthday}) async {
  String userId = await ShareValueProvider.shareValueProvider.getUserId();
  Map<String, dynamic> params = {
    'user_id': userId,
    'name': name,
    'birthday': DateUtil.convertNormalToServerDate(birthday),
    'gender': gender,
  };

  Response response = await post(context,
      path: "updateProfile",
      param: params,
      requireLogin: true,
      showLoading: true);
  if (response.isSuccess()) return response.data;
  return response;
}

Future<dynamic> listIntroduction() async {
  Response response = await get(null, path: "listIntroduction");
  if (response.isSuccess()) return response.data;
  return null;
}

Future<dynamic> privacy() async {
  Response response = await get(null, path: "privacy");

  if (response.isSuccess()) return response.data;
  return null;
}

Future<dynamic> addNotifyFlashSales(BuildContext context,
    {String productId}) async {
  String userId = await ShareValueProvider.shareValueProvider.getUserId();
  Map<String, dynamic> params = {
    'user_id': userId,
    'id': productId,
  };

  Response response = await post(context,
      path: "addNotifyFlashSales",
      param: params,
      requireLogin: true,
      showLoading: true);
  if (response.isSuccess()) return response.data;
  return response;
}

Future<dynamic> deleteNotifyFlashSales(BuildContext context,
    {String productId}) async {
  String userId = await ShareValueProvider.shareValueProvider.getUserId();
  Map<String, dynamic> params = {
    'user_id': userId,
    'id': productId,
  };

  Response response = await post(context,
      path: "deleteNotifyFlashSales",
      param: params,
      requireLogin: true,
      showLoading: true);
  if (response.isSuccess()) return response.data;
  return response;
}
