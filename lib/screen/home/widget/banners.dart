import 'package:baby_garden_flutter/provider/get_banners_provider.dart';
import 'package:baby_garden_flutter/screen/partner_book_schedule/partner_book_schedule_screen.dart';
import 'package:baby_garden_flutter/screen/photo_view/photo_view_screen.dart';
import 'package:baby_garden_flutter/screen/product_detail/product_detail_screen.dart';
import 'package:baby_garden_flutter/screen/vcb_express_detail/vcb_express_detail_screen.dart';
import 'package:baby_garden_flutter/screen/voucher_detail/voucher_detail_screen.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/my_carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Banners extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<GetBannersProvider>(
      builder: (BuildContext context, GetBannersProvider value, Widget child) {
        if (value.banners == null || value.banners.isEmpty) return SizedBox();
        return MyCarouselSlider(
          hasShadow: true,
          autoPlay: true,
          images: value.banners,
          imageAttrName: "img",
          onItemPressed: (index) {
            dynamic banner = value.banners[index];
            if (banner == null || banner['type'] == null) return;
            switch (banner['type']) {
              case "1":
                RouteUtil.push(
                    context, VCBExpressDetailScreen(banner['link_id']));
                break;
              case "2":
                RouteUtil.push(
                    context,
                    VoucherDetailScreen(
                      voucher: {"id": banner['link_id']},
                    ));
                break;
              case "3":
                RouteUtil.push(
                    context,
                    ProductDetailScreen(
                      productId: banner['link_id'],
                    ));
                break;
              case "4":
                RouteUtil.push(context,
                    PartnerBookScheduleScreen(shopID: banner['link_id']));
                break;
            }
          },
        );
      },
    );
  }
}
