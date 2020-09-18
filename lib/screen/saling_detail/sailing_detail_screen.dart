import 'package:baby_garden_flutter/data/model/section.dart';
import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/item/product_item.dart';
import 'package:baby_garden_flutter/provider/app_provider.dart';
import 'package:baby_garden_flutter/screen/base_state.dart';
import 'package:baby_garden_flutter/screen/list_product/list_product_screen.dart';
import 'package:baby_garden_flutter/screen/notify/provider/discount_provider.dart';
import 'package:baby_garden_flutter/screen/saling_detail/provider/sailing_detail_provider.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/loading/loading_view.dart';
import 'package:baby_garden_flutter/widget/my_carousel_slider.dart';
import 'package:baby_garden_flutter/widget/text/my_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nested/nested.dart';
import 'package:provider/provider.dart';

class SailingDetailScreen extends StatefulWidget {
  final String notifyId;

  const SailingDetailScreen({this.notifyId}) : super();

  @override
  State<StatefulWidget> createState() {
    return _SailingDetailScreenState();
  }
}

class _SailingDetailScreenState extends BaseState<SailingDetailScreen> {
  final SailingDetailProvider _sailingDetailProvider = SailingDetailProvider();
  final DiscountProvider _discountProvider = DiscountProvider();

  @override
  void initState() {
    // TODO: implement initState
    _sailingDetailProvider.getNotifyDetail(notifyId: widget.notifyId);
    _discountProvider.getData();
    super.initState();
  }

  @override
  Widget buildWidget(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(
        title: S.of(context).saling_detail,
      ),
      body: Consumer<SailingDetailProvider>(
        builder:
            (BuildContext context, SailingDetailProvider value, Widget child) {
          return value.detail == null
              ? Container()
              : ListView(
                  children: <Widget>[
                    MyCarouselSlider(
                      height: Provider.of<AppProvider>(context)
                          .saleDetailSlideHeight,
                      borderRadius: 0,
                      margin: EdgeInsets.all(0),
                      images: value.detail['image']?? [],
                      isShowImageCount: true,
                    ),
                    Padding(
                      padding: EdgeInsets.all(SizeUtil.smallSpace),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            S
                                .of(context)
                                .saling_detail_title(value.detail['title']),
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: SizeUtil.textSizeDefault),
                          ),
                          SizedBox(
                            height: SizeUtil.superTinySpace,
                          ),
                          Text(
                            S
                                .of(context)
                                .saling_detail_time(value.detail["date"]),
                            style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: SizeUtil.textSizeSmall),
                          ),
                          SizedBox(
                            height: SizeUtil.superTinySpace,
                          ),
                          MyText(
                            value.detail["content"],
                            style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: SizeUtil.textSizeExpressDetail),
                          ),
                          SizedBox(
                            height: SizeUtil.superTinySpace,
                          ),
                        ],
                      ),
                    ),
                    WidgetUtil.getLine(
                      margin: EdgeInsets.all(0),
                      width: SizeUtil.smallSpace,
                    ),
                    GestureDetector(
                      onTap: () {
                        push(
                          ListProductScreen(
                              section: Section(
                                  title: S.of(context).home_discount_products,
                                  path: 'discountProduct')),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            // BoxShape.circle or BoxShape.rectangle
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
                    ),
                    WidgetUtil.getLine(
                      margin: EdgeInsets.all(0),
                      width: SizeUtil.smallSpace,
                    ),
                    Consumer<DiscountProvider>(
                      builder: (BuildContext context, DiscountProvider value,
                          Widget child) {
                        var products = value.products;
                        if (products == null || products.isEmpty)
                          return LoadingView(
                            isNoData: products != null,
                            onReload: () {
                              _discountProvider.getData();
                            },
                          );
                        return Container(
                          height: MediaQuery.of(context).size.height * 0.78,
                          color: ColorUtil.lineColor,
                          child: GridView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            itemCount: products.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2, childAspectRatio: 0.78),
                            padding: EdgeInsets.only(
                                left: SizeUtil.tinySpace,
                                right: SizeUtil.tinySpace),
                            itemBuilder: (context, index) {
                              return ProductItem(
                                product: products[index],
                                width: MediaQuery.of(context).size.width * 0.5,
                                borderRadius: SizeUtil.tinyRadius,
                                showSoldCount: false,
                                nameStyle: TextStyle(
                                    fontSize: SizeUtil.textSizeDefault),
                                showTime: false,
                                padding: EdgeInsets.only(
                                    left: SizeUtil.smallSpace,
                                    right: SizeUtil.smallSpace,
                                    top: 0),
                              );
                            },
                          ),
                        );
                      },
                    )
                  ],
                );
        },
      ),
    );
  }

  @override
  List<SingleChildWidget> providers() {
    return [
      ChangeNotifierProvider.value(value: _sailingDetailProvider),
      ChangeNotifierProvider.value(value: _discountProvider),
    ];
  }
}
