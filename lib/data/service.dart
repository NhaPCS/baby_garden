import 'dart:convert';
import 'dart:io';

import 'package:baby_garden_flutter/data/response.dart';
import 'package:baby_garden_flutter/data/shared_value.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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
Future<dynamic> verifyCode(BuildContext context,
    {String phone, String name, String password, String refCode}) async {
  Response response = await post(context, path: "verifyCode", param: {
    'phone': phone,
    'name': name,
    'password': password,
    'ref_code': refCode,
  });
  if (response.isSuccess()) return response.data;
  return null;
}

//TODO require FORGET PASSWORD
Future<dynamic> forgetPassword(BuildContext context, {String phone}) async {
  Response response =
      await post(context, path: "forgetPassword", param: {'phone': phone});
  if (response.isSuccess()) return response.data;
  return null;
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
Future<dynamic> favouriteShop({ String shopID}) async {
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
Future<dynamic> bookingService({String userID, String shopID,String dateBooking, String timeBooking, String serviceID, String address }) async {
  Response response = await post(null,
      path: "bookingService", param: {'user_id': userID, 'shop_id': shopID,'date_booking':dateBooking,'time_booking':timeBooking,'service_id':serviceID,'address':address});
  if (response.isSuccess()) return response.data;
  return null;
}

Future<dynamic> shopDetail({String userID, String shopID }) async {
  Response response = await get(null,
      path: "shopDetail", param: {'user_id': userID, 'shop_id': shopID});
  if (response.isSuccess()) return response.data;
  return null;
}

//todo listProductShop
Future<dynamic> listProductShop({String userID, String shopID }) async {
  Response response = await get(null,
      path: "listProductShop", param: {'user_id': userID, 'shop_id': shopID});
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
Future<dynamic> bookingProduct({String userID, String shopID,String bookingDate,String bookingTime, String promoteCode, String isReceiveInShop,
      String paymentMethod, String note, String shipID, String address, String shipCode,String userName,
      String userPhone,String userAddress,String cityID,String districtID
    }) async {
  Response response = await post(null,
      path: "bookingProduct",
      param: {'user_id': userID.toString(),
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
        'district_id': districtID});
  if (response.isSuccess()) return response.data;
  return null;
}

Future<dynamic> listVoucher({String index, String numberPost,String category }) async {
  Response response = await get(null,
      path: "listVoucher", param: {'index': index, 'number_post': numberPost,'category_id':category});
  if (response.isSuccess()) return response.data;
  return null;
}

Future<dynamic> listVoucherUser({String userID}) async {
  Response response = await get(null,
      path: "listVoucherUser", param: {'user_id': userID});
  if (response.isSuccess()) return response.data;
  return null;
}

Future<dynamic> listVoucherShop({ String shopID }) async {
  Response response = await get(null,
      path: "listVoucherShop", param: { 'shop_id': shopID});
  if (response.isSuccess()) return response.data;
  return null;
}

Future<dynamic> voucherDetail({String userID, String shopID }) async {
  Response response = await get(null,
      path: "voucherDetail", param: {'user_id': userID, 'shop_id': shopID});
  if (response.isSuccess()) return response.data;
  return null;
}

//todo notification
Future<dynamic> notification({String userID}) async{
  Response response  = await get(null,path: "notification",param: {'user_id':userID});
  if (response.isSuccess()) return response.data;
  return null;
}

//todo notificationDetail
Future<dynamic> notificationDetail({String userID,String notifyID}) async{
  Response response  = await get(null,path: "notificationDetail",param: {'index':userID,'noty_id':notifyID});
  if (response.isSuccess()) return response.data;
  return null;
}
//todo deleteNoty
Future<dynamic> deleteNoty({String userID,String notifyID}) async{
  Response response  = await post(null,path: "deleteNoty",param: {'index':userID,'noty_id':notifyID});
  if (response.isSuccess()) return response.data;
  return null;
}

//todo news
Future<dynamic> news({String index,String numberPost}) async{
  Response response  = await get(null,path: "news",param: {'index':index,'number_post':numberPost});
  if (response.isSuccess()) return response.data;
  return null;
}

//todo newsDetail
Future<dynamic> newsDetail({String newID}) async{
  Response response  = await get(null,path: "newsDetail",param: {'news_id':newID});
  if (response.isSuccess()) return response.data;
  return null;
}

//todo bookingDetail
Future<dynamic> bookingDetail({String userId, var bookingID}) async {
  Response response = await get(null,
      path: "bookingDetail", param: {'user_id':userId,'booking_id':bookingID.toString()});
  if (response.isSuccess()) return response.data;
  return null;
}
//todo district
Future<dynamic> district({String id}) async {
  Response response = await get(null,
      path: "district", param: {'city_id': id});
  if (response.isSuccess()) return response.data;
  return null;
}




//todo listShiper
Future<dynamic> listShiper({int userId}) async {
  Response response = await get(null, path: "listShiper",param: {'user_id':userId.toString()});
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
Future<dynamic> rateBooking({String userID, int bookingID, double star , String content }) async {
  Response response = await post(null,
      path: "rateBooking", param: {'user_id': userID,
        'booking_id': bookingID.toString(),'star':star.toString(),'content':content.toLowerCase()});
  if (response.isSuccess()) return response.data;
  return null;
}

//todo listBookingService
Future<dynamic> listBookingService({String userId, int type}) async {
  Response response = await get(null,
      path: "listBookingService", param: {'user_id':userId.toString(),'type':type.toString()});
  if (response.isSuccess()) return response.data;
  return null;
}

//todo listBookingProduct
Future<dynamic> listBookingProduct({String userId, int type}) async {
  Response response = await get(null,
      path: "listBookingProduct", param: {'user_id':userId,'type':type.toString()});
  if (response.isSuccess()) return response.data;
  return null;
}

//TODO paymentInfo
Future<dynamic> paymentInfo() async {
  Response response = await get(null,
      path: "paymentInfo");
  if (response.isSuccess()) return response.data;
  return null;
}

//TODO PAYMENT
Future<dynamic> payment( {String userID,int bookingId,double money, String content, String note}) async{
  Response response  = await post(null,path: "payment",param: {
    'user_id': userID.toString(),
    'booking_id': bookingId.toString(),
    'money': money.toString(),
    'content': content.toString(),
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
  Response response = await get(null, path: "serviceCategory", showLoading: false);
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

Future<void> editProductCart({dynamic product, int number}) async {
  String userId = await ShareValueProvider.shareValueProvider.getUserId();
  dynamic params = {
    "user_id": userId,
    "product_id": product['id'],
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

Future<void> deleteProductCart(dynamic product) async {
  String userId = await ShareValueProvider.shareValueProvider.getUserId();
  dynamic params = {
    "user_id": userId,
    "product_id": product['id'],
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

Future<dynamic> listFavouriteShop(BuildContext context,
    {int index = START_PAGE,
      int numberPosts = PAGE_SIZE}) async {
  String userId = await ShareValueProvider.shareValueProvider.getUserId();
  dynamic params = {
    "user_id": userId,
    "index": index.toString(),
    "number_post": numberPosts.toString()
  };
  Response response =
  await get(null, path: "listFavouriteShop", param: params);
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
