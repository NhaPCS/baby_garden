import 'dart:convert';

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

Future<dynamic> productCategory() async {
  Response response = await get(null, path: "category", showLoading: false);
  if (response.isSuccess()) return response.data;
  return null;
}

Future<dynamic> banners() async {
  Response response = await get(null, path: "banner", showLoading: false);
  if (response.isSuccess()) return response.data;
  return null;
}

Future<dynamic> listProducts(BuildContext context, String path,
    {String categoryId, int index = START_PAGE, int numberPosts = PAGE_SIZE}) async {
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

Future<Response> post(BuildContext context,
    {String path,
    dynamic param,
    bool hasAccessToken = false,
    bool showErrorDialog = true,
    bool showLoading = true}) async {
  Response response = await execute(context,
      path: path,
      param: param,
      hasAccessToken: hasAccessToken,
      showErrorDialog: showErrorDialog,
      showLoading: showLoading,
      isPost: true);
  return response;
}

Future<Response> get(
  BuildContext context, {
  String path,
  dynamic param,
  bool showErrorDialog = true,
  bool hasAccessToken = false,
  bool showLoading = true,
}) async {
  Response response = await execute(context,
      path: path,
      param: param,
      hasAccessToken: hasAccessToken,
      showErrorDialog: showErrorDialog,
      showLoading: showLoading,
      isPost: false);
  return response;
}

Future<Response> execute(BuildContext context,
    {String path,
    dynamic param,
    bool hasAccessToken = false,
    bool showErrorDialog = true,
    bool showLoading = true,
    bool isPost = true}) async {
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

Future<dynamic> getUserInfo(BuildContext context,
    {@required String userId}) async {
  Response response = await post(context, path: "", param: {'user_id': userId});
  if (response.isSuccess()) return response.data;
  return null;
}
