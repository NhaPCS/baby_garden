import 'dart:convert';

import 'package:baby_garden_flutter/data/response.dart';
import 'package:baby_garden_flutter/data/shared_value.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Map<String, String> _headers;

const String BASE_URL = "http://chap.com.vn/vcb/api/";
const int START_PAGE = 1;
const int PAGE_SIZE = 20;

//TODO require LOGIN
Future<dynamic> login(BuildContext context, {String phone, String password})async {
  Response response=await get(context, path: 'login', param: {
    'phone': phone,
    'password': password
  });
  if(response.isSuccess()) return response.data;
  return null;
}

//TODO require REGISTER
Future<dynamic> register(BuildContext context, {String phone,  String name,String password,String ref_code})async {
  Response response=await get(context, path: 'register', param: {
    'phone': phone,
    'phone': name,
    'password': password,
    'ref_code': ref_code
  });
  if(response.isSuccess()) return response.data;
  return null;
}

//TODO require VERIFY CODE
Future<dynamic> verifyCode(BuildContext context,{String phone}) async{
  Response response = await get(context,path: "verifyCode",param: {
    'phone':phone
  });
  if(response.isSuccess()) return response.data;
  return null;
}

//TODO require FORGET PASSWORD
Future<dynamic> forgetPassword(BuildContext context,{String phone}) async{
  Response response = await post(context,path: "forgetPassword",param: {
    'phone':phone
  });
  if(response.isSuccess()) return response.data;
  return null;
}

//TODO require FORGET PASSWORD
Future<dynamic> changePassword(BuildContext context,{String phone,String password}) async{
  Response response = await post(context,path: "changePassword",param: {
    'phone':phone,
    'password': password
  });
  if(response.isSuccess()) return response.data;
  return null;
}

Future<Response> post(BuildContext context,
    {String path,
    dynamic param,
    bool hasAccessToken = false,
    bool showErrorDialog = true}) async {
  Response response = await execute(context,
      path: path,
      param: path,
      hasAccessToken: hasAccessToken,
      showErrorDialog: showErrorDialog,
      isPost: true);
  return response;
}

Future<Response> get(BuildContext context,
    {String path,
      dynamic param,
      bool showErrorDialog = true}) async {
  Response response = await execute(context,
      path: path,
      param: path,
      hasAccessToken: false,
      showErrorDialog: showErrorDialog,
      isPost: false);
  return response;
}

Future<Response> execute(BuildContext context,
    {String path,
    dynamic param,
    bool hasAccessToken = false,
    bool showErrorDialog = true,
    bool isPost = true}) async {
  if (_headers == null || _headers.isEmpty) {
    _headers = {};
  }
  var url = '$BASE_URL$path';
  if (context != null && showErrorDialog) WidgetUtil.showLoading(context);
  var response = isPost
      ? await http.post(url, body: param, headers: _headers)
      : await http.get(Uri.http(BASE_URL, path, param), headers: _headers);
  print("REQ: ${response.request}");
  print("RES: ${response.body}");
  if (context != null && showErrorDialog) Navigator.of(context).pop();
  Response res =
      parseResponse(context, response.body, hasAccessToken: hasAccessToken);
  return res;
}

Response parseResponse(BuildContext context, String responseBody,
    {bool hasAccessToken}) {
  dynamic body = jsonDecode(responseBody);
  Response res = Response(
      message: body == null ? 0 : body['message'],
      errorId: body == null ? null : body['errorId'],
      data: body == null ? null : body['data']);

  if (!res.isSuccess()) {
    WidgetUtil.showErrorDialog(context, res.message);
  } else {
    if (hasAccessToken) {
      String rawCookie = res.data['access_token'];
      if (rawCookie != null && rawCookie.isNotEmpty) {
        ShareValueProvider.shareValueProvider.saveAccessToken(rawCookie);
      }
    }
  }
  return res;
}
