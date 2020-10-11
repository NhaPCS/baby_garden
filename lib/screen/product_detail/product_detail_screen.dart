import 'package:baby_garden_flutter/data/model/section.dart';
import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/provider/cart_provider.dart';
import 'package:baby_garden_flutter/provider/change_index_provider.dart';
import 'package:baby_garden_flutter/provider/get_list_product_provider.dart';
import 'package:baby_garden_flutter/provider/user_provider.dart';
import 'package:baby_garden_flutter/screen/base_state_model.dart';
import 'package:baby_garden_flutter/screen/category_product/category_product_screen.dart';
import 'package:baby_garden_flutter/screen/list_product/list_product_screen.dart';
import 'package:baby_garden_flutter/screen/main/main_screen.dart';
import 'package:baby_garden_flutter/screen/product_detail/dialog/add_to_cart_bottom_dialog.dart';
import 'package:baby_garden_flutter/screen/product_detail/provider/get_product_detail_provider.dart';
import 'package:baby_garden_flutter/screen/product_detail/view_model/product_detail_view_model.dart';
import 'package:baby_garden_flutter/screen/product_detail/widget/cart_icon.dart';
import 'package:baby_garden_flutter/screen/product_detail/widget/content_view_moreable.dart';
import 'package:baby_garden_flutter/screen/product_detail/widget/favorite_product_button.dart';
import 'package:baby_garden_flutter/screen/product_detail/widget/store_info.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/button/button_icon.dart';
import 'package:baby_garden_flutter/widget/button/my_flat_button.dart';
import 'package:baby_garden_flutter/widget/image/svg_icon.dart';
import 'package:baby_garden_flutter/widget/loading/loading_view.dart';
import 'package:baby_garden_flutter/widget/product/list_horizontal_product.dart';
import 'package:baby_garden_flutter/widget/text/my_text.dart';
import 'package:flutter/material.dart';
import 'package:nested/nested.dart';
import 'package:provider/provider.dart';

import 'widget/product_header.dart';

class ProductDetailScreen extends StatefulWidget {
  final String productId;

  const ProductDetailScreen({Key key, this.productId}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ProductScreenState();
  }
}

class _ProductScreenState
    extends BaseStateModel<ProductDetailScreen, ProductDetailViewModel> {
  final ChangeIndexProvider _changeIndexProvider = ChangeIndexProvider();
  final GetListProductProvider _getListProductProvider =
      GetListProductProvider();
  final GetProductDetailProvider _getProductDetailProvider =
      GetProductDetailProvider();

  @override
  void initState() {
    _getListProductProvider.getData(null, "getProduct",
        productId: widget.productId);
    _getProductDetailProvider.getProduct(null, widget.productId);
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (_getProductDetailProvider.DETAIL_INFO == null ||
        _getProductDetailProvider.DETAIL_INFO.isEmpty)
      _getProductDetailProvider.getDetailInfoKey(context);
    super.didChangeDependencies();
  }

  @override
  Widget buildWidget(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(
        title: S.of(context).product_detail,
        actions: [CartIcon()],
      ),
      body: Consumer<GetProductDetailProvider>(
        builder: (BuildContext context,
            GetProductDetailProvider productProvider, Widget child) {
          if (productProvider.product == null) return LoadingView();
          return ListView(
            children: <Widget>[
              ProductHeader(
                product: productProvider.product,
                onCarouselItemSelected: (index) {
                  _changeIndexProvider.changeIndex(index);
                },
                onFavoriteClicked: () {
                  _getProductDetailProvider.favorite(context,
                      product: productProvider.product);
                },
              ),
              paddingContainer(Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  FavoriteProductButton(
                    product: productProvider.product,
                  ),
                  SizedBox(
                    width: SizeUtil.smallSpace,
                  ),
                  Expanded(
                      child: MyText(
                    productProvider.product['name'],
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ))
                ],
              )),
              paddingContainer(MyText(
                productProvider.product['promotion_info'],
                style: TextStyle(color: ColorUtil.textGray),
              )),
              paddingContainer(Row(
                children: <Widget>[
                  MyText(
                    StringUtil.getPriceText(
                        productProvider.product['price_discount']),
                    style: TextStyle(
                        color: ColorUtil.red,
                        fontWeight: FontWeight.bold,
                        fontSize: SizeUtil.textSizeBigger),
                  ),
                  SizedBox(
                    width: SizeUtil.smallSpace,
                  ),
                  MyText(
                    StringUtil.getPriceText(productProvider.product['price']),
                    style: TextStyle(
                        color: ColorUtil.textGray,
                        decoration: TextDecoration.lineThrough),
                  ),
                  Expanded(child: SizedBox()),
                  Text(
                    productProvider.isOutStock()
                        ? S.of(context).product_out_stock
                        : S.of(context).product_existing,
                    style: TextStyle(
                        color: ColorUtil.blue,
                        fontSize: SizeUtil.textSizeSmall),
                  )
                ],
              )),
              WidgetUtil.getLine(width: 2),
              StoreInfo(
                shop: productProvider.product['shop'],
              ),
              WidgetUtil.getLine(width: 2),
              paddingContainer(Text(
                S.of(context).detail_info,
                style: TextStyle(fontWeight: FontWeight.bold),
              )),
              SizedBox(
                height: SizeUtil.smallSpace,
              ),
              Column(
                children: List.generate(
                    _getProductDetailProvider.DETAIL_INFO.length,
                    (index) => infoRow(
                        _getProductDetailProvider.DETAIL_INFO[index], index)),
              ),
              WidgetUtil.getLine(width: 2),
              paddingContainer(Text(
                S.of(context).product_description,
                style: TextStyle(fontWeight: FontWeight.bold),
              )),
              ContentViewMoreable(
                content: productProvider.product['content'],
              ),
              WidgetUtil.getLine(width: 2, margin: EdgeInsets.all(0)),
              Consumer<GetListProductProvider>(
                builder: (BuildContext context,
                    GetListProductProvider listProductProvider, Widget child) {
                  if (listProductProvider.products == null ||
                      listProductProvider.products.isEmpty) return SizedBox();
                  return Row(
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
                            section: Section(
                                title: S.of(context).same_product,
                                path: "getProduct"),
                            productId: productProvider.product['id'],
                          ));
                        },
                      )
                    ],
                  );
                },
              ),
              // Sp tuong tu
              Consumer<GetListProductProvider>(
                builder: (BuildContext context,
                    GetListProductProvider listProductProvider, Widget child) {
                  if (listProductProvider.products == null ||
                      listProductProvider.products.isEmpty) return SizedBox();
                  return ListHorizontalProduct(
                    products: listProductProvider.products,
                    padding: EdgeInsets.only(top: SizeUtil.tinySpace),
                  );
                },
              )
            ],
          );
        },
      ),
      bottomNavigationBar: Consumer<GetProductDetailProvider>(
        builder: (BuildContext context,
            GetProductDetailProvider productProvider, Widget child) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              productProvider.isOutStock()
                  ? SizedBox()
                  : MyFlatButton(
                      onPressed: () {
                        if (!Provider.of<UserProvider>(context, listen: false)
                            .isLogin) {
                          WidgetUtil.showRequireLoginDialog(context);
                          return;
                        }
                        Provider.of<CartProvider>(context, listen: false)
                            .addProduct(productProvider.product);
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
                    if (!Provider.of<UserProvider>(context, listen: false)
                        .isLogin) {
                      WidgetUtil.showRequireLoginDialog(context);
                      return;
                    }
                    showModalBottomSheet(
                        isScrollControlled: true,
                        context: context,
                        builder: (_) => AddToCartBottomDialog(
                              product: productProvider.product,
                              onSelectedIsOutOfStock: () {
                                getViewModel().receiveNotify(
                                    productId: productProvider.product['id'],
                                    number:
                                        productProvider.product['quantity'] ??
                                            1);
                              },
                            ));
                  },
                  text: productProvider.isOutStock()
                      ? S.of(context).get_notify_when_stocking
                      : S.of(context).add_to_cart,
                  textStyle: TextStyle(color: Colors.white),
                  borderRadius: 0,
                  padding: SizeUtil.normalPadding,
                  color: ColorUtil.blueLight,
                  icon: productProvider.isOutStock()
                      ? Icon(
                          Icons.notifications_active,
                          color: Colors.white,
                          size: SizeUtil.iconSize,
                        )
                      : SvgIcon(
                          'ic_add_cart.svg',
                          height: SizeUtil.iconSize,
                        ),
                ),
              )
            ],
          );
        },
      ),
    );
  }

  Widget infoRow(dynamic e, int index) {
    return Container(
      padding: SizeUtil.smallPadding,
      child: Row(
        children: <Widget>[
          Expanded(
            child: MyText(
              "${e['title']}",
              style: TextStyle(color: ColorUtil.textGray),
            ),
          ),
          Expanded(
            child: InkWell(
              child: MyText(
                _getProductDetailProvider.getValueByKey(context, e['key']),
                style: TextStyle(
                    color: e['valueColor'] == null
                        ? ColorUtil.textColor
                        : e['valueColor']),
              ),
              onTap: () {
                if (e['key'] == 'category_id') {
                  push(CategoryProductScreen(
                    selectedParentId:
                        _getProductDetailProvider.product['parent_id'],
                    selectedCategoryId:
                        _getProductDetailProvider.product['category_id'],
                  ));
                }
              },
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
    return [
      ChangeNotifierProvider.value(value: _changeIndexProvider),
      ChangeNotifierProvider.value(value: _getProductDetailProvider),
      ChangeNotifierProvider.value(value: _getListProductProvider),
    ];
  }

  @override
  ProductDetailViewModel initViewModel() {
    return ProductDetailViewModel(context);
  }
}
