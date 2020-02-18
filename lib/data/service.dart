import 'dart:convert';
import 'dart:io';

import 'package:baby_garden_flutter/data/response.dart';
import 'package:baby_garden_flutter/data/shared_value.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Map<String, String> _headers;

Future<Response> execute(BuildContext context,
    {String path,
    dynamic param,
    bool hasAccessToken = false,
    bool showErrorDialog = true,
    bool isPost = true}) async {
  if (_headers == null || _headers.isEmpty) {
    _headers = {
      'device-id': '',
      'device-os': Platform.isIOS ? "ios" : "android",
      'device-os-version': '10',
      'device-token': 'abc',
      'device-brand': 'google',
      'language': 'en'
    };
  }
  String key = await ShareValueProvider.shareValueProvider.getAccessToken();
  print("TOKEN $key");
  _headers['Authorization'] = 'Bearer $key';

  var url = 'http://api-moda.vrmaker.io/v1/$path';

  print("BODY: $path === $param");
  if (!isPost) {
    print("aaa ${Uri.http("api-moda.vrmaker.io", '/v1/$path', param)}");
  }
  if (context != null) WidgetUtil.showLoading(context);
  var response = isPost
      ? await http.post(url, body: param, headers: _headers)
      : await http.get(Uri.http("api-moda.vrmaker.io", '/v1/$path', param),
          headers: _headers);
  print("RES: ${response.body}");
  if (context != null) Navigator.pop(context);
  dynamic body = jsonDecode(response.body);
  Response res = Response(
      result: body == null ? 0 : body['result'],
      error: body == null ? null : body['error'],
      data: body == null ? null : body['data']);

  if (!res.isSuccess()) {
    if (res.error != null) {
      if (res.error['code'] == 401) {
        //TODO
      } else if (showErrorDialog && context != null)
        WidgetUtil.showErrorDialog(context, res.error['message']);
    }
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

void pushAndReplaceAll(
    BuildContext context, Widget nextPage, String routeName) {
  Navigator.pushAndRemoveUntil(
      context,
      CupertinoPageRoute(builder: (context) => nextPage),
      ModalRoute.withName(routeName));
}
