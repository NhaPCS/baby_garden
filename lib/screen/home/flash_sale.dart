import 'package:baby_garden_flutter/data/model/section.dart';
import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/item/item_flashsale_product.dart';
import 'package:baby_garden_flutter/provider/app_provider.dart';
import 'package:baby_garden_flutter/provider/change_flashsale_mode_provider.dart';
import 'package:baby_garden_flutter/provider/get_list_product_provider.dart';
import 'package:baby_garden_flutter/screen/base_state.dart';
import 'package:baby_garden_flutter/screen/list_product/list_product_screen.dart';
import 'package:baby_garden_flutter/screen/product_detail/product_detail_screen.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/button/my_raised_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nested/nested.dart';
import 'package:provider/provider.dart';

class FlashSale extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _FlashSaleState();
  }
}

class _FlashSaleState extends BaseState<FlashSale> {
  final GetListProductProvider _getListProductProvider =
      GetListProductProvider();
  final ChangeFlashSaleModeProvider _changeFlashSaleModeProvider =
      ChangeFlashSaleModeProvider();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_getListProductProvider.products == null ||
        _getListProductProvider.products.isEmpty) {
      _loadData();
    }
  }

  void _loadData() {
    //TODO
//    _getListProductProvider.getData(
//        context, isPending ? "flashSalesPending" : "flashSales");
    _getListProductProvider.getData(context,
        _changeFlashSaleModeProvider.isPending ? "newProduct" : "newProduct",
        numberPosts: 10, index: 1);
  }

  @override
  Widget buildWidget(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SizedBox(
              width: SizeUtil.smallSpace,
            ),
            SizedBox(
              height:
                  Provider.of<AppProvider>(context).flashSaleItemHeight * 0.2,
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: SizeUtil.smallPadding,
                    child: Image.asset(
                      'photo/lb_flashsale.png',
                      fit: BoxFit.fitHeight,
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
            ),
            Container(
              margin: EdgeInsets.only(bottom: SizeUtil.midSmallSpace),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.all(Radius.circular(SizeUtil.smallRadius))),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Consumer<ChangeFlashSaleModeProvider>(
                    builder: (BuildContext context,
                        ChangeFlashSaleModeProvider value, Widget child) {
                      return Row(
                        children: <Widget>[
                          SizedBox(
                            width: SizeUtil.smallSpace,
                          ),
                          _getModeButton(false),
                          SizedBox(
                            width: SizeUtil.smallSpace,
                          ),
                          _getModeButton(true)
                        ],
                      );
                    },
                  ),
                  SizedBox(
                    height:
                        Provider.of<AppProvider>(context).flashSaleItemHeight,
                    child: Consumer<GetListProductProvider>(
                      builder: (BuildContext context,
                          GetListProductProvider value, Widget child) {
                        return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: value.products.length,
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(
                              child: ItemFlashSaleProduct(
                                product: value.products[index],
                              ),
                              onTap: () {
                                RouteUtil.push(
                                    context,
                                    ProductDetailScreen(
                                      productId: value.products[index]['id'],
                                    ));
                              },
                            );
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
        RouteUtil.push(
            context,
            ListProductScreen(
              section: Section(title: S.of(context).happening),
            ));
      },
    );
  }

  Widget _getModeButton(bool isPending) {
    return MyRaisedButton(
      onPressed: () {
        _changeFlashSaleModeProvider.changeMode(isPending);
        _loadData();
      },
      text: isPending ? S.of(context).pending : S.of(context).happening,
      color: _changeFlashSaleModeProvider.isPending == isPending
          ? ColorUtil.red
          : Colors.white,
      textStyle: TextStyle(
          color: _changeFlashSaleModeProvider.isPending == isPending
              ? Colors.white
              : ColorUtil.red),
    );
  }

  @override
  List<SingleChildWidget> providers() {
    return [
      ChangeNotifierProvider.value(value: _getListProductProvider),
      ChangeNotifierProvider.value(value: _changeFlashSaleModeProvider),
    ];
  }
}
