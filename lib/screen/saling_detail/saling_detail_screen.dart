import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/provider/app_provider.dart';
import 'package:baby_garden_flutter/screen/base_state.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/my_carousel_slider.dart';
import 'package:baby_garden_flutter/widget/product/image_count.dart';
import 'package:baby_garden_flutter/widget/product/list_product.dart';
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
        title: S
            .of(context)
            .saling_detail,
      ),
      body: ListView(
        children: <Widget>[
          Stack(
            children: <Widget>[
              MyCarouselSlider(
                height: Provider
                    .of<AppProvider>(context)
                    .saleDetailSlideHeight,
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
                backgroundColor: Colors.white, borderColor: Colors.white,
                textColor: ColorUtil.textColor,
                text: "1/4",
              ),
            ],
          ),
          SizedBox(
            height: SizeUtil.smallSpace,
          ),
          Text(S.of(context).saling_detail_title(
              "Vườn của bé - Tưng bừng khuyến mãi"), style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: SizeUtil.textSizeDefault),),
          Text(S.of(context).saling_detail_time(
              "12.12.2019 đến 31.01.2020"), style: TextStyle(
              fontWeight: FontWeight.normal, fontSize: SizeUtil.textSizeSmall),),
          Text("Khuyến mãi chương trình dịp khai trương shop cơ sở mới", style: TextStyle(
              fontWeight: FontWeight.normal, fontSize: SizeUtil.textSizeSmall),),
          Text("Khuyến mãi siêu hot dịp tết nguyễn đán 2019\ndành cho 100 khách hàng đầu tiên thanh toán bang\nthẻ tín dung nội địa Teckcombank đặt hàng online ngay", style: TextStyle(
              fontWeight: FontWeight.normal, fontSize: SizeUtil.textSizeSmall),),
          Text("Theo dõi Vườn Của Bé qua Website: http://vuoncuabe.com.vn", style: TextStyle(
              fontWeight: FontWeight.normal, fontSize: SizeUtil.textSizeSmall),),
          Image.asset("photo/saling_detail_img.png",width: MediaQuery.of(context).size.width,),
          ListProduct(
            padding: EdgeInsets.only(top: SizeUtil.smallSpace),
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