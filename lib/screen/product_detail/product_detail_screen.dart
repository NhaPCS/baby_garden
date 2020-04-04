import 'package:baby_garden_flutter/data/model/section.dart';
import 'package:baby_garden_flutter/dialog/add_to_cart_bottom_dialog.dart';
import 'package:baby_garden_flutter/dialog/report_product_dialog.dart';
import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/provider/app_provider.dart';
import 'package:baby_garden_flutter/provider/change_index_provider.dart';
import 'package:baby_garden_flutter/screen/base_state.dart';
import 'package:baby_garden_flutter/screen/list_product/list_product_screen.dart';
import 'package:baby_garden_flutter/screen/main/main_screen.dart';
import 'package:baby_garden_flutter/screen/photo_view/photo_view_screen.dart';
import 'package:baby_garden_flutter/screen/product_detail/store_info.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/button/button_icon.dart';
import 'package:baby_garden_flutter/widget/button/my_flat_button.dart';
import 'package:baby_garden_flutter/widget/my_carousel_slider.dart';
import 'package:baby_garden_flutter/widget/product/cart_icon.dart';
import 'package:baby_garden_flutter/widget/product/discount_widget.dart';
import 'package:baby_garden_flutter/widget/product/favorite_tag.dart';
import 'package:baby_garden_flutter/widget/product/image_count.dart';
import 'package:baby_garden_flutter/widget/product/list_product.dart';
import 'package:baby_garden_flutter/widget/svg_icon.dart';
import 'package:flutter/material.dart';
import 'package:nested/nested.dart';
import 'package:provider/provider.dart';

class ProductDetailScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ProductScreenState();
  }
}

class _ProductScreenState extends BaseState<ProductDetailScreen> {
  List<dynamic> DETAIL_INFO;
  final ChangeIndexProvider _changeIndexProvider = ChangeIndexProvider();

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    DETAIL_INFO = [
      {
        'title': S.of(context).category,
        'value': 'Thời trang trẻ em',
        'valueColor': ColorUtil.blueLight
      },
      {
        'title': S.of(context).sku_code,
        'value': '49253225212525',
      },
      {
        'title': S.of(context).brand,
        'value': 'Adidas',
      },
      {
        'title': S.of(context).origin,
        'value': 'Việt Nam',
      },
      {
        'title': S.of(context).size,
        'value': 'Size 2, 3, 4 5',
      },
      {
        'title': S.of(context).customer_target,
        'value': 'Trẻ em từ 2 đến 3 tuổi',
      },
    ];
    super.didChangeDependencies();
  }

  @override
  Widget buildWidget(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(
        title: S.of(context).product_detail,
        actions: [CartIcon()],
      ),
      body: ListView(
        children: <Widget>[
          Stack(
            children: <Widget>[
              MyCarouselSlider(
                height: Provider.of<AppProvider>(context).productImageHeight,
                borderRadius: 0,
                margin: EdgeInsets.all(0),
                images: StringUtil.dummyImageList,
                onItemSelected: (index) {
                  _changeIndexProvider.changeIndex(index);
                },
                onItemPressed: (index) {
                  push(PhotoViewScreen(images: StringUtil.dummyImageList));
                },
              ),
              Positioned(
                child: DiscountWidget(
                  discount: 33,
                  textSizeMax: SizeUtil.textSizeDefault,
                  size: 50,
                ),
                right: 0,
                top: SizeUtil.smallSpace,
              ),
              Consumer<ChangeIndexProvider>(
                builder: (BuildContext context, ChangeIndexProvider value,
                    Widget child) {
                  return ImageCount(
                    text:
                        "${value.index + 1}/${StringUtil.dummyImageList.length}",
                  );
                },
              ),
              Positioned(
                  right: SizeUtil.smallSpace,
                  bottom: SizeUtil.tinySpace,
                  child: Row(
                    children: <Widget>[
                      ButtonIcon(
                        padding: EdgeInsets.only(
                            left: SizeUtil.smallSpace,
                            right: SizeUtil.smallSpace,
                            top: SizeUtil.tinySpace,
                            bottom: SizeUtil.tinySpace),
                        icon: Row(
                          children: <Widget>[
                            Icon(
                              Icons.favorite,
                              color: ColorUtil.red,
                              size: SizeUtil.iconSize,
                            ),
                            Text(
                              "112",
                              style: TextStyle(color: ColorUtil.primaryColor),
                            )
                          ],
                        ),
                        borderRadius: SizeUtil.iconSize,
                        onPressed: () {
                          //TODO
                        },
                      ),
                      ButtonIcon(
                        padding: SizeUtil.tinyPadding,
                        icon: Icon(
                          Icons.share,
                          color: ColorUtil.primaryColor,
                          size: SizeUtil.iconSize,
                        ),
                        borderRadius: SizeUtil.iconSize,
                        onPressed: () {
                          //TODO
                        },
                      ),
                      ButtonIcon(
                        padding: SizeUtil.tinyPadding,
                        icon: Icon(
                          Icons.priority_high,
                          color: ColorUtil.primaryColor,
                          size: SizeUtil.iconSize,
                        ),
                        borderRadius: SizeUtil.iconSize,
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (_) => ReportProductDialog(context));
                        },
                      )
                    ],
                  ))
            ],
          ),
          paddingContainer(Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              FavoriteTag(),
              SizedBox(
                width: SizeUtil.smallSpace,
              ),
              Expanded(
                  child: Text(
                "Giày thời trang trẻ em style Hàn Quốc",
                style: TextStyle(fontWeight: FontWeight.bold),
              ))
            ],
          )),
          paddingContainer(Text(
            "Nhập mã VCB2020 để được giảm thêm 5% khi mua sản phẩm",
            style: TextStyle(color: ColorUtil.textGray),
          )),
          paddingContainer(Row(
            children: <Widget>[
              Text(
                "800.000 đ",
                style: TextStyle(
                    color: ColorUtil.red,
                    fontWeight: FontWeight.bold,
                    fontSize: SizeUtil.textSizeBigger),
              ),
              SizedBox(
                width: SizeUtil.smallSpace,
              ),
              Text(
                "800.000 đ",
                style: TextStyle(
                    color: ColorUtil.textGray,
                    decoration: TextDecoration.lineThrough),
              ),
              Expanded(child: SizedBox()),
              Text(
                S.of(context).product_existing,
                style: TextStyle(
                    color: ColorUtil.blue, fontSize: SizeUtil.textSizeSmall),
              )
            ],
          )),
          WidgetUtil.getLine(width: 2),
          StoreInfo(),
          WidgetUtil.getLine(width: 2),
          paddingContainer(Text(
            S.of(context).detail_info,
            style: TextStyle(fontWeight: FontWeight.bold),
          )),
          SizedBox(
            height: SizeUtil.smallSpace,
          ),
          Column(
            children: DETAIL_INFO
                .map((e) => infoRow(e, DETAIL_INFO.indexOf(e)))
                .toList(),
          ),
          WidgetUtil.getLine(width: 2),
          paddingContainer(Text(
            S.of(context).product_description,
            style: TextStyle(fontWeight: FontWeight.bold),
          )),
          paddingContainer(
              Text(
                StringUtil.dummyText,
                style: TextStyle(color: ColorUtil.textGray),
              ),
              padding: SizeUtil.smallPadding),
          Center(
            child: ButtonIcon(
              icon: Text(
                S.of(context).view_more,
                style: TextStyle(
                    color: ColorUtil.primaryColor,
                    fontSize: SizeUtil.textSizeSmall),
              ),
              borderRadius: SizeUtil.bigRadius,
              padding: EdgeInsets.only(
                  left: SizeUtil.smallSpace,
                  right: SizeUtil.smallSpace,
                  top: SizeUtil.tinySpace,
                  bottom: SizeUtil.tinySpace),
              backgroundColor: Colors.transparent,
            ),
          ),
          WidgetUtil.getLine(width: 2),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                  child: paddingContainer(
                Text(
                  S.of(context).same_product,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                padding: SizeUtil.smallPadding,
              )),
              ButtonIcon(
                icon: Wrap(
                  alignment: WrapAlignment.center,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  spacing: SizeUtil.tinySpace,
                  children: <Widget>[
                    Text(
                      S.of(context).view_more,
                      style: TextStyle(
                          color: ColorUtil.primaryColor,
                          fontSize: SizeUtil.textSizeSmall),
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: ColorUtil.primaryColor,
                      size: SizeUtil.iconSizeSmall,
                    )
                  ],
                ),
                onPressed: () {
                  push(ListProductScreen(
                    section: Section(title: S.of(context).same_product),
                  ));
                },
              )
            ],
          ),
          ListProduct(
            padding: EdgeInsets.only(top: SizeUtil.tinySpace),
          )
        ],
      ),
      bottomNavigationBar: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          MyFlatButton(
            onPressed: () {
              //TODO
              pushAndReplaceAll(
                  MainScreen(
                    index: 2,
                  ),
                  "/main_screen");
            },
            height: 50,
            text: S.of(context).buy_now,
            textStyle: TextStyle(color: Colors.white),
            borderRadius: 0,
            padding: EdgeInsets.only(
                left: SizeUtil.bigSpace,
                right: SizeUtil.bigSpace,
                top: SizeUtil.normalSpace,
                bottom: SizeUtil.normalSpace),
            color: ColorUtil.primaryColor,
          ),
          Expanded(
            child: MyFlatButton(
              height: 50,
              onPressed: () {
                showModalBottomSheet(
                    isScrollControlled: true,
                    context: context,
                    builder: (_) => AddToCartBottomDialog());
              },
              text: S.of(context).add_to_cart,
              textStyle: TextStyle(color: Colors.white),
              borderRadius: 0,
              padding: SizeUtil.normalPadding,
              color: ColorUtil.blueLight,
              icon: SvgIcon(
                'ic_add_cart.svg',
                height: SizeUtil.iconSize,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget infoRow(dynamic e, int index) {
    return Container(
      padding: SizeUtil.smallPadding,
      child: Row(
        children: <Widget>[
          Expanded(
            child: Text(
              e['title'],
              style: TextStyle(color: ColorUtil.textGray),
            ),
          ),
          Expanded(
            child: Text(
              e['value'],
              style: TextStyle(
                  color: e['valueColor'] == null
                      ? ColorUtil.textColor
                      : e['valueColor']),
            ),
          )
        ],
      ),
      color: index % 2 == 1 ? Color(0xffFBF9F9).withOpacity(0.7) : Colors.white,
    );
  }

  Widget paddingContainer(Widget widget,
      {EdgeInsets padding = const EdgeInsets.only(
          left: SizeUtil.smallSpace,
          right: SizeUtil.smallSpace,
          top: SizeUtil.smallSpace)}) {
    return Padding(
      padding: padding,
      child: widget,
    );
  }

  @override
  List<SingleChildWidget> providers() {
    return [ChangeNotifierProvider.value(value: _changeIndexProvider)];
  }
}
