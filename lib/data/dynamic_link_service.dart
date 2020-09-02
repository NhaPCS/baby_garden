import 'package:baby_garden_flutter/screen/product_detail/product_detail_screen.dart';
import 'package:baby_garden_flutter/screen/vcb_express_detail/vcb_express_detail_screen.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';

class DynamicLinkService {
  Future handleDynamicLinks(BuildContext context) async {
    FirebaseDynamicLinks.instance.onLink(
        onSuccess: (PendingDynamicLinkData dynamicLink) async {
      if (dynamicLink != null) _handleDeepLink(context, dynamicLink.link);
    }, onError: (OnLinkErrorException e) async {
      print('onLinkError');
      print(e.message);
    });

    final PendingDynamicLinkData data =
        await FirebaseDynamicLinks.instance.getInitialLink();
    final Uri deepLink = data?.link;

    if (deepLink != null) {
      print("DEEP ${deepLink}");
      _handleDeepLink(context, deepLink);
    }
  }

  void _handleDeepLink(BuildContext context, Uri deepLink) {
    print("LINKKK ${deepLink.queryParameters}  ${deepLink.path}");
    if (deepLink != null) {
      if (deepLink.path.contains("/product")) {
        if (deepLink.queryParameters != null &&
            deepLink.queryParameters['id'] != null) {
          RouteUtil.push(
              context,
              ProductDetailScreen(
                productId: deepLink.queryParameters['id'].trim(),
              ));
        }
      }
      if (deepLink.path.contains("/news")) {
        if (deepLink.queryParameters != null &&
            deepLink.queryParameters['id'] != null) {
          RouteUtil.push(
              context,
              VCBExpressDetailScreen(
                deepLink.queryParameters['id'].trim(),
              ));
        }
      }
    }
  }

  static Future<void> createDynamicLink(
      {@required String title,
      @required String id,
      @required String suffix}) async {
    String appId = "com.vuoncuabe";
    var parameters = DynamicLinkParameters(
      uriPrefix: 'https://vcbapp.page.link',
      link: Uri.parse('https://vuoncuabe.com/${suffix}?id=${id}'),
      androidParameters: AndroidParameters(
          packageName: appId,
          fallbackUrl: Uri.parse(
              "https://play.google.com/store/apps/details?id=$appId")),
      iosParameters: IosParameters(
          bundleId: appId,
          appStoreId: '1498909115', //TODO update later
          fallbackUrl: Uri.parse(
              "https://play.google.com/store/apps/details?id=$appId") //TODO edit here
          ),
    );
    var shortLink = await parameters.buildShortLink();
    var shortUrl = shortLink.shortUrl;

    Share.share("${title} \n${shortUrl}");
  }
}
