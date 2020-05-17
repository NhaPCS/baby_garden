import 'dart:convert';
import 'dart:io';

import 'package:baby_garden_flutter/data/model/remind_calendar.dart';
import 'package:baby_garden_flutter/data/response.dart';
import 'package:baby_garden_flutter/data/shared_value.dart';
import 'package:baby_garden_flutter/provider/user_provider.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

Map<String, String> _headers;

const String BASE_URL = "chap.com.vn";
const String SUB_URL = "/vcb/api/";
const int START_PAGE = 1;
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

//TODO require favouriteShop
Future<dynamic> favouriteShop({String shopID}) async {
  String userId = await ShareValueProvider.shareValueProvider.getUserId();
  Response response = await post(null,
      path: "favouriteShop", param: {'user_id': userId, 'shop_id': shopID});
  if (response.isSuccess()) return response.data;
  return null;
}

//TODO require unFavouriteShop
Future<dynamic> unFavouriteShop({String shopID}) async {
  String userId = await ShareValueProvider.shareValueProvider.getUserId();
  Response response = await post(null,
      path: "unFavouriteShop", param: {'user_id': userId, 'shop_id': shopID});
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
  Response response = await post(null, path: "bookingService", param: {
    'user_id': userID,
    'shop_id': shopID,
    'date_booking': dateBooking,
    'time_booking': timeBooking,
    'service_id': serviceID,
    'address': address
  });
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
Future<dynamic> listProductShop({String shopID}) async {
  String userId = await ShareValueProvider.shareValueProvider.getUserId();
  Response response = await get(null,
      path: "listProductShop", param: {'user_id': userId, 'shop_id': shopID});
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
Future<dynamic> bookingProduct(
    {String userID,
    String shopID,
    String bookingDate,
    String bookingTime,
    String promoteCode,
    String isReceiveInShop,
    String paymentMethod,
    String note,
    String shipID,
    String address,
    String shipCode,
    String userName,
    String userPhone,
    String userAddress,
    String cityID,
    String districtID}) async {
  Response response = await post(null, path: "bookingProduct", param: {
    'user_id': userID.toString(),
    'shop_id': shopID.toString(),
    'date_booking': bookingDate,
    'time_booking': bookingTime,
    'promotion_code': promoteCode,
    'is_receive': isReceiveInShop,
    'payment': paymentMethod,
    'note': note,
    'ship_id': shipID,
    'address': address,
    'ship_code': shipCode,
    'user_name': userName,
    'user_phone': userPhone,
    'city_id': cityID,
    'district_id': districtID
  });
  if (response.isSuccess()) return response.data;
  return null;
}

Future<dynamic> listVoucher({int index, String categoryId}) async {
  dynamic param = {
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

Future<dynamic> listVoucherUser() async {
  String userId = await ShareValueProvider.shareValueProvider.getUserId();
  Response response =
      await get(null, path: "listVoucherUser", param: {'user_id': userId});
  if (response.isSuccess()) return response.data;
  return null;
}

Future<dynamic> listVoucherShop({String shopID}) async {
  Response response =
      await get(null, path: "listVoucherShop", param: {'shop_id': shopID});
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
Future<dynamic> news({String index, String numberPost}) async {
  Response response = await get(null,
      path: "news", param: {'index': index, 'number_post': numberPost});
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

//todo listShiper
Future<dynamic> listShiper() async {
  String userId = await ShareValueProvider.shareValueProvider.getUserId();
  Response response =
      await get(null, path: "listShiper", param: {'user_id': userId});
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
Future<dynamic> rateBooking(
    {int bookingID, double star, String content}) async {
  String userId = await ShareValueProvider.shareValueProvider.getUserId();
  Response response = await post(null, path: "rateBooking", param: {
    'user_id': userId,
    'booking_id': bookingID.toString(),
    'star': star.toString(),
    'content': content.toLowerCase()
  });
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
Future<dynamic> payment(
    {String userID,
    String bookingId,
    double money,
    String content,
    String note}) async {
  Response response = await post(null, path: "payment", param: {
    'user_id': userID,
    'booking_id': bookingId,
    'money': money.toString(),
    'content': content,
    'note': note.toLowerCase(),
  });
  if (response.isSuccess()) return response.data;
  return null;
}

Future<dynamic> productCategory() async {
  Response response = await get(null, path: "category", showLoading: false);
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

Future<dynamic> flashSales() async {
  return await listProducts(null, "flashSales");
}

Future<dynamic> flashSalesPending() async {
  return await listProducts(null, "flashSalesPending");
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

Future<dynamic> listProducts(BuildContext context, String path,
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
    ps.add({
      'product_id': p['id'],
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

Future<void> editProductCart({String productId, int number}) async {
  String userId = await ShareValueProvider.shareValueProvider.getUserId();
  dynamic params = {
    "user_id": userId,
    "product_id": productId,
    "number": number.toString(),
  };
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
  if (response.isSuccess()) return response.data;
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
    "title": title,
    "content": content,
    "titleId": titleId
  };
  dynamic files = {"img": img};
  Response response = await postMultiPart(context,
      path: 'reportProduct', param: params, files: files, requireLogin: true);
  if (response.isSuccess()) return response;
  return null;
}

Future<Response> receiveNotify(BuildContext context, {String productId}) async {
  String userId = await ShareValueProvider.shareValueProvider.getUserId();
  dynamic params = {
    "user_id": userId,
    "product_id": productId,
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
    {String address, int isMain}) async {
  String userId = await ShareValueProvider.shareValueProvider.getUserId();
  dynamic params = {
    "user_id": userId,
    "address": address,
    "is_main": isMain.toString(),
  };

  Response response = await post(context,
      path: "addAddress", param: params, requireLogin: true, showLoading: true);
  if (response.isSuccess()) return response;
  return null;
}

Future<Response> editUserAddress(BuildContext context,
    {String address, int isMain, String addressId}) async {
  String userId = await ShareValueProvider.shareValueProvider.getUserId();
  dynamic params = {
    "user_id": userId,
    "address": address,
    "is_main": isMain.toString(),
    "address_id": addressId
  };

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
  print('address id ' + addressId);
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
    "birthday": birthday,
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
    "birthday": birthday,
  };
  dynamic files = {"img": img};
  Response response = await postMultiPart(context,
      path: 'editBaby', param: params, files: files, requireLogin: true);
  if (response.isSuccess()) return response;
  return null;
}

Future<dynamic> verifyCodeVoucher(BuildContext context,
    {String voucherId, String code}) async {
  String userId = await ShareValueProvider.shareValueProvider.getUserId();
  dynamic params = {"user_id": userId, "voucher_id": voucherId, "code": code};

  Response response = await get(null,
      path: 'verifyCodeVoucher', param: params, requireLogin: true);
  if (response.isSuccess()) return response.data;
  return null;
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
  Response response =
  await get(null, path: 'promotionDetail', param: params, requireLogin: true);
  if (response.isSuccess()) return response.data;
  return null;
}

Future<Response> post(BuildContext context,
    {String path,
    dynamic param,
    bool hasAccessToken = false,
    bool showErrorDialog = true,
    bool showLoading = true,
    bool requireLogin = false}) async {
  Response response = await execute(context,
      path: path,
      param: param,
      hasAccessToken: hasAccessToken,
      showErrorDialog: showErrorDialog,
      showLoading: showLoading,
      isPost: true,
      requireLogin: requireLogin);
  return response;
}

Future<Response> get(BuildContext context,
    {String path,
    dynamic param,
    bool showErrorDialog = true,
    bool hasAccessToken = false,
    bool showLoading = true,
    bool requireLogin = false}) async {
  Response response = await execute(context,
      path: path,
      param: param,
      hasAccessToken: hasAccessToken,
      showErrorDialog: showErrorDialog,
      showLoading: showLoading,
      isPost: false,
      requireLogin: requireLogin);
  return response;
}

Future<Response> execute(BuildContext context,
    {String path,
    dynamic param,
    bool hasAccessToken = false,
    bool showErrorDialog = true,
    bool showLoading = true,
    bool isPost = true,
    bool requireLogin = false}) async {
  if (requireLogin) {
    String userId = await ShareValueProvider.shareValueProvider.getUserId();
    if (userId == null || userId.isEmpty) {
      if (context != null) {
        WidgetUtil.showRequireLoginDialog(context);
      }
      return null;
    }
  }
  if (_headers == null || _headers.isEmpty) {
    _headers = {};
  }
  try {
    //TODO post url must has http:// get: url generate by Url.http require param1: host param2: route param3: map parameter
    var url = 'http://$BASE_URL$SUB_URL$path';
    print('$param');
    if (context != null && showLoading) WidgetUtil.showLoading(context);
    var response = isPost
        ? await http.post(url, body: param, headers: _headers)
        : await http.get(Uri.http(BASE_URL, '$SUB_URL$path', param),
            headers: _headers);
    print("REQ: ${response.request}");
    print("RES: ${response.body}");
    if (context != null && showLoading) Navigator.of(context).pop();
    Response res = parseResponse(context, response.body,
        hasAccessToken: hasAccessToken, showErrorDialog: showErrorDialog);
    return res;
  } on Exception catch (e) {
    print(e);
    if (context != null && showLoading) Navigator.of(context).pop();
  }
  return Response();
}

Future<Response> postMultiPart(BuildContext context,
    {String path,
    Map<String, String> param,
    Map<String, File> files,
    bool showErrorDialog = true,
    bool showLoading = true,
    bool requireLogin = false}) async {
  if (requireLogin) {
    String userId = await ShareValueProvider.shareValueProvider.getUserId();
    if (userId == null || userId.isEmpty) {
      if (context != null) {
        WidgetUtil.showRequireLoginDialog(context);
      }
      return null;
    }
  }
  try {
    var url = 'http://$BASE_URL$SUB_URL$path';

    http.MultipartRequest request =
        new http.MultipartRequest('POST', Uri.parse(url));

    files.forEach((key, value) async {
      if (value != null)
        request.files.add(await http.MultipartFile.fromPath(key, value.path));
    });
    request.fields.addAll(param);
    request.headers.addAll(_headers);

    if (context != null && showLoading) WidgetUtil.showLoading(context);
    http.StreamedResponse response = await request.send();
    print("REQ ${request.fields}  ${request.files.toString()}");
    String res = await response.stream.bytesToString();

    if (context != null && showLoading) Navigator.pop(context);
    print("RES $res");

    Response responseData = parseResponse(context, res,
        hasAccessToken: false, showErrorDialog: showErrorDialog);
    return responseData;
  } on Exception catch (e) {
    print(e);
    if (context != null && showLoading) Navigator.pop(context);
  }
  return Response();
}

Response parseResponse(BuildContext context, String responseBody,
    {bool hasAccessToken, bool showErrorDialog = true}) {
  dynamic body = jsonDecode(responseBody);
  Response res = Response(
      message: body == null ? 0 : body['message'],
      errorId: body == null ? null : body['errorId'],
      data: body == null ? null : body['data']);

  if (!res.isSuccess()) {
    if (context != null && showErrorDialog)
      WidgetUtil.showErrorDialog(context, res.message);
  } else {
    if (hasAccessToken) {
      if (res.data != null && res.data['id'] != null) {
        ShareValueProvider.shareValueProvider.saveUserId(res.data['id']);
      }
    }
  }
  return res;
}

Future<dynamic> getListRemindCalendar(BuildContext context) async {
  String userId = await ShareValueProvider.shareValueProvider.getUserId();
  dynamic params = {"user_id": userId};

  Response response = await get(context, path: "listCalendar", param: params);
  print(response);
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
      showLoading: true);
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

Future<dynamic> updateProfile(BuildContext context,
    {String name, String gender, String birthday}) async {
  String userId = await ShareValueProvider.shareValueProvider.getUserId();
  Map<String, dynamic> params = {
    'user_id': userId,
    'name': name,
    'birthday': birthday,
    'gender': gender,
  };

  String path = 'updateProfile';

  Response response = await post(context,
          path: path, param: params, requireLogin: true, showLoading: true)
      .then((value) {
    print(value);
    if (value.isSuccess()) return value;
    return null;
  }).catchError((onError) {
    print(onError);
    return null;
  });

  return response;
}
