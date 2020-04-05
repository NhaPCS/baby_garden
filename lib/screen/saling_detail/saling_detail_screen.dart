import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/item/item_product.dart';
import 'package:baby_garden_flutter/provider/app_provider.dart';
import 'package:baby_garden_flutter/screen/base_state.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/loadmore/loadmore_gridview.dart';
import 'package:baby_garden_flutter/widget/my_carousel_slider.dart';
import 'package:baby_garden_flutter/widget/product/image_count.dart';
import 'package:baby_garden_flutter/widget/product/list_horizontal_product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nested/nested.dart';
import 'package:provider/provider.dart';

class SalingDetailScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SalingDetailScreenState();
  }
}

class _SalingDetailScreenState extends BaseState<SalingDetailScreen> {
  @override
  Widget buildWidget(BuildContext context) {
    // TODO: implement buildWidget
    return Scaffold(
      appBar: getAppBar(
        title: S.of(context).saling_detail,
      ),
      body: ListView(
        children: <Widget>[
          Stack(
            children: <Widget>[
              MyCarouselSlider(
                height: Provider.of<AppProvider>(context).saleDetailSlideHeight,
                borderRadius: 0,
                margin: EdgeInsets.all(0),
                images: [
                  StringUtil.dummyImage,
                  StringUtil.dummyImage,
                  StringUtil.dummyImage,
                  StringUtil.dummyImage
                ],
              ),
              ImageCount(
                backgroundColor: Colors.white,
                borderColor: Colors.white,
                textColor: ColorUtil.textColor,
                text: "1/4",
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(SizeUtil.smallSpace),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  S.of(context).saling_detail_title(
                      "Vườn của bé - Tưng bừng khuyến mãi"),
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: SizeUtil.textSizeDefault),
                ),
                SizedBox(
                  height: SizeUtil.superTinySpace,
                ),
                Text(
                  S.of(context).saling_detail_time("12.12.2019 đến 31.01.2020"),
                  style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: SizeUtil.textSizeSmall),
                ),
                SizedBox(
                  height: SizeUtil.superTinySpace,
                ),
                Text(
                  "Khuyến mãi chương trình dịp khai trương shop cơ sở mới",
                  style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: SizeUtil.textSizeExpressDetail),
                ),
                SizedBox(
                  height: SizeUtil.superTinySpace,
                ),
                Text(
                  "Khuyến mãi siêu hot dịp tết nguyễn đán 2019\ndành cho 100 khách hàng đầu tiên thanh toán bang\nthẻ tín dung nội địa Teckcombank đặt hàng online ngay",
                  style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: SizeUtil.textSizeExpressDetail),
                ),
                SizedBox(
                  height: SizeUtil.superTinySpace,
                ),
                Text(
                  "Theo dõi Vườn Của Bé qua Website: http://vuoncuabe.com.vn",
                  style: TextStyle(fontWeight: FontWeight.normal, fontSize: 12),
                ),
                SizedBox(
                  height: SizeUtil.superTinySpace,
                ),
                Image.asset(
                  "photo/saling_detail_img.png.png",
                  width: MediaQuery.of(context).size.width,
                ),
              ],
            ),
          ),
          Container(
            color: ColorUtil.lineColor,
            height: SizeUtil.smallSpace,
            width: MediaQuery.of(context).size.width,
          ),
          Container(
            decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                // BoxShape.circle or BoxShape.retangle
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 5.0,
                  ),
                ]),
            padding: EdgeInsets.all(SizeUtil.smallSpace),
            child: Row(
              children: <Widget>[
                Text(
                  S.of(context).product_for_sale,
                  style: TextStyle(
                      fontSize: SizeUtil.textSizeDefault,
                      color: ColorUtil.textColor,
                      fontWeight: FontWeight.bold),
                ),
                Expanded(
                  child: SizedBox(),
                ),
                Text(
                  S.of(context).see_more,
                  style: TextStyle(
                      color: ColorUtil.primaryColor,
                      fontSize: SizeUtil.textSizeSmall),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: ColorUtil.primaryColor,
                  size: SizeUtil.iconSize,
                )
              ],
            ),
          ),
          Container(
            color: ColorUtil.lineColor,
            height: SizeUtil.smallSpace,
            width: MediaQuery.of(context).size.width,
          ),
          Container(
            height: MediaQuery.of(context).size.height*0.78,
            color: ColorUtil.lineColor,
            child: GridView.builder(
              scrollDirection: Axis.horizontal,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, childAspectRatio: 1.42),
              padding: EdgeInsets.only(
                  left: SizeUtil.tinySpace, right: SizeUtil.tinySpace),
              itemBuilder: (context, index) {
                return ItemProduct(
                  width: MediaQuery.of(context).size.width * 0.5,
                  borderRadius: SizeUtil.tinyRadius,
                  showSoldCount: false,
                  nameStyle: TextStyle(fontSize: SizeUtil.textSizeDefault),
                  showTime: false,
                  padding: EdgeInsets.only(
                      left: SizeUtil.smallSpace,
                      right: SizeUtil.smallSpace,
                      top: 0),
                );
              },
            ),
          )
        ],
      ),
    );
  }

  @override
  List<SingleChildWidget> providers() {
    // TODO: implement providers
    return null;
  }
}
