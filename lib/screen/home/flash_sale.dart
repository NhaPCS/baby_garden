import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/item/item_flashsale_product.dart';
import 'package:baby_garden_flutter/screen/list_product/list_product_screen.dart';
import 'package:baby_garden_flutter/screen/product_detail/product_detail_screen.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/button/my_raised_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FlashSale extends StatelessWidget {
  final double flashSaleHeight;
  final double flashSaleWidth;

  const FlashSale({Key key, this.flashSaleHeight, this.flashSaleWidth})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SizedBox(
              width: SizeUtil.smallSpace,
            ),
            Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: SizeUtil.smallSpace),
                  child: Image.asset(
                    'photo/lb_flashsale.png',
                    fit: BoxFit.fitHeight,
                    height: flashSaleHeight * 0.2,
                  ),
                ),
                Expanded(child: SizedBox()),
                Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    SvgPicture.asset('photo/svg/bg_triangle.svg'),
                    Text(
                      S.of(context).view_more.toUpperCase(),
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(
                  top: SizeUtil.smallSpace, bottom: SizeUtil.defaultSpace),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.all(Radius.circular(SizeUtil.smallRadius))),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      SizedBox(
                        width: SizeUtil.smallSpace,
                      ),
                      MyRaisedButton(
                        onPressed: () {
                          RouteUtil.push(context, ListProductScreen());
                        },
                        text: S.of(context).happening,
                        color: ColorUtil.red,
                        textStyle: TextStyle(color: Colors.white),
                      ),
                      SizedBox(
                        width: SizeUtil.smallSpace,
                      ),
                      MyRaisedButton(
                        onPressed: () {
                          RouteUtil.push(context, ListProductScreen());
                        },
                        text: S.of(context).happened,
                        color: Colors.white,
                        textStyle: TextStyle(color: ColorUtil.red),
                      )
                    ],
                  ),
                  SizedBox(
                    height: flashSaleHeight,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 10,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          child: ItemFlashSaleProduct(
                            imageSize: flashSaleWidth,
                            imageUrl: StringUtil.dummyImageList[
                                index % StringUtil.dummyImageList.length],
                          ),
                          onTap: () {
                            RouteUtil.push(context, ProductDetailScreen());
                          },
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: SizeUtil.tinySpace,
                  )
                ],
              ),
            )
          ],
        ),
        color: ColorUtil.flashSaleColor,
      ),
      onTap: () {
        RouteUtil.push(context, ListProductScreen());
      },
    );
  }
}
