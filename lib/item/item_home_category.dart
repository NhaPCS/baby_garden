import 'package:baby_garden_flutter/screen/category_product/category_product_screen.dart';
import 'package:baby_garden_flutter/screen/partner/partner_list_screen.dart';
import 'package:baby_garden_flutter/screen/partner/partner_register_screen.dart';
import 'package:baby_garden_flutter/screen/vcb_express/vcb_express_screen.dart';
import 'package:baby_garden_flutter/screen/voucher/voucher_management_screen.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:flutter/material.dart';

class ItemHomeCategory extends StatelessWidget {
  final dynamic category;

  const ItemHomeCategory({Key key, @required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: GestureDetector(
      child: Column(
        children: <Widget>[
          Padding(
            child: Image.asset(
              category['icon'],
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            padding: EdgeInsets.only(
                top: SizeUtil.smallSpace,
                left: SizeUtil.normalSpace,
                right: SizeUtil.normalSpace),
          ),
          SizedBox(
            height: SizeUtil.smallSpace,
          ),
          Text(
            category['title'],
            textAlign: TextAlign.center,
            style: TextStyle(
                color: ColorUtil.primaryColor,
                fontSize: SizeUtil.textSizeSmall),
          ),
          SizedBox(
            height: SizeUtil.smallSpace,
          ),
        ],
      ),
      onTap: () {
        if (category['icon'].toString().contains('voucher')) {
          //TODO
          RouteUtil.push(context, VoucherManagement());
        } else if (category['icon'].toString().contains('partner')) {
          RouteUtil.push(context, PartnerListScreen());
        } else if (category['icon'].toString().contains('category')) {
          RouteUtil.push(context, CategoryProductScreen());
        } else if (category['icon'].toString().contains('ic_vcb_express')) {
          RouteUtil.push(context, VCBExpressScreen());
        }
      },
    ));
  }
}
