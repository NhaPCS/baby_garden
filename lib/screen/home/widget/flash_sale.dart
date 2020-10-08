import 'package:baby_garden_flutter/data/model/section.dart';
import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/provider/app_provider.dart';
import 'package:baby_garden_flutter/screen/base_state.dart';
import 'package:baby_garden_flutter/screen/home/item/flashsale_product_item.dart';
import 'package:baby_garden_flutter/screen/home/provider/change_flashsale_mode_provider.dart';
import 'package:baby_garden_flutter/screen/home/provider/flashsale_provider.dart';
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
  final int reload;

  const FlashSale({Key key, this.reload})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _FlashSaleState();
  }
}

class _FlashSaleState extends BaseState<FlashSale> {
  final FlashSaleProvider _getFlashSaleProvider = FlashSaleProvider();
  final ChangeFlashSaleModeProvider _changeFlashSaleModeProvider =
      ChangeFlashSaleModeProvider();
  int _reload = -1;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget buildWidget(BuildContext context) {
    if (widget.reload != null && widget.reload != _reload) {
      _getFlashSaleProvider.getData();
    }
    return Consumer<FlashSaleProvider>(
      builder: (BuildContext context, FlashSaleProvider flashSaleProvider,
          Widget child) {
        if (flashSaleProvider.flashSalesPending.isEmpty &&
            flashSaleProvider.flashSales.isEmpty) return SizedBox();
        final List<dynamic> list = _changeFlashSaleModeProvider.isPending ||
                flashSaleProvider.flashSales.isEmpty
            ? flashSaleProvider.flashSalesPending
            : flashSaleProvider.flashSales;
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
                      Provider.of<AppProvider>(context).flashSaleItemHeight *
                          0.2,
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
                      borderRadius: BorderRadius.all(
                          Radius.circular(SizeUtil.smallRadius))),
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
                              flashSaleProvider.flashSales.isNotEmpty
                                  ? _getModeButton(false)
                                  : SizedBox(),
                              SizedBox(
                                width: SizeUtil.smallSpace,
                              ),
                              flashSaleProvider.flashSalesPending.isNotEmpty
                                  ? _getModeButton(true)
                                  : SizedBox()
                            ],
                          );
                        },
                      ),
                      SizedBox(
                        height: Provider.of<AppProvider>(context)
                            .flashSaleItemHeight,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: list.length,
                          itemBuilder: (BuildContext context, int index) {
                            dynamic productDetail =
                                list[index]['product_detail'] != null
                                    ? list[index]['product_detail']
                                    : list[index];
                            return GestureDetector(
                              child: FlashSaleProductItem(
                                product: list[index],
                                isPending:
                                    _changeFlashSaleModeProvider.isPending,
                                onNotifyMePress: () {
                                  _getFlashSaleProvider.notifyFlashSale(context, list[index]);
                                },
                              ),
                              onTap: () {
                                RouteUtil.push(
                                    context,
                                    ProductDetailScreen(
                                      productId: productDetail['id'],
                                    ));
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
                  isFlashSalePending: _changeFlashSaleModeProvider.isPending,
                  section: Section(
                      title: _changeFlashSaleModeProvider.isPending
                          ? S.of(context).pending
                          : S.of(context).happening,
                      path: _changeFlashSaleModeProvider.isPending
                          ? "flashSalesPending"
                          : "flashSales"),
                ));
          },
        );
      },
    );
  }

  Widget _getModeButton(bool isPending) {
    return MyRaisedButton(
      onPressed: () {
        _changeFlashSaleModeProvider.changeMode(isPending);
        _getFlashSaleProvider.getData();
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
      ChangeNotifierProvider.value(value: _getFlashSaleProvider),
      ChangeNotifierProvider.value(value: _changeFlashSaleModeProvider),
    ];
  }
}
