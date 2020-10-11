import 'dart:convert';
import 'dart:io';

import 'package:baby_garden_flutter/data/response.dart';
import 'package:baby_garden_flutter/data/shared_value.dart';
import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Map<String, String> _headers;

const String BASE_URL = "chap.com.vn";
const String SUB_URL = "/vcb/api/";

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
    print("REQ $url \n ${request.fields}  ${request.files.toString()} ");
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
    res.data = null;
    if (context != null && showErrorDialog) {
      if(res.errorId!=null){
        WidgetUtil.showErrorDialog(context, res.message);
      } else{
        WidgetUtil.showMessageDialog(context, message: res.message, title: "Thông báo");
      }
    }

  } else {
    if (hasAccessToken) {
      if (res.data != null && res.data['id'] != null) {
        ShareValueProvider.shareValueProvider.saveUserId(res.data['id']);
      }
    }
  }
  return res;
}
