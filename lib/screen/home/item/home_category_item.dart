import 'package:auto_size_text/auto_size_text.dart';
import 'package:baby_garden_flutter/provider/app_provider.dart';
import 'package:baby_garden_flutter/screen/category_product/category_product_screen.dart';
import 'package:baby_garden_flutter/screen/child_heath/child_heath_screen.dart';
import 'package:baby_garden_flutter/screen/partner_list/partner_list_screen.dart';
import 'package:baby_garden_flutter/screen/vcb_express/vcb_express_screen.dart';
import 'package:baby_garden_flutter/screen/voucher/voucher_screen.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeCategoryItem extends StatelessWidget {
  final dynamic category;

  const HomeCategoryItem({Key key, @required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: GestureDetector(
      child: Container(
        width: Provider.of<AppProvider>(context).homeCategoryWidth,
        padding: EdgeInsets.only(
            top: SizeUtil.tinySpace, bottom: SizeUtil.tinySpace),
        child: Column(
          children: <Widget>[
            Image.asset(
              category['icon'],
              height: Provider.of<AppProvider>(context).homeCategoryIconHeight,
            ),
            SizedBox(
              height: SizeUtil.tinySpace,
            ),
            Expanded(
                child: AutoSizeText(
              category['title'],
              textAlign: TextAlign.center,
              maxFontSize: SizeUtil.textSizeSmall,
              minFontSize: SizeUtil.textSizeMini,
              maxLines: 2,
              style: TextStyle(
                  color: ColorUtil.primaryColor,
                  fontSize: SizeUtil.textSizeSmall),
            ))
          ],
        ),
      ),
      onTap: () {
        if (category['icon'].toString().contains('voucher')) {
          //TODO
          RouteUtil.push(context, VoucherScreen());
        } else if (category['icon'].toString().contains('partner')) {
          RouteUtil.push(context, PartnerListScreen());
        } else if (category['icon'].toString().contains('category')) {
          RouteUtil.push(context, CategoryProductScreen());
        } else if (category['icon'].toString().contains('ic_vcb_express')) {
          RouteUtil.push(context, VCBExpressScreen());
        } else if (category['icon'].toString().contains('health')) {
          RouteUtil.push(context, ChildHeathScreen());
        }
      },
    ));
  }
}
