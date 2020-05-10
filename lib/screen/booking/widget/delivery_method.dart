import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/screen/base_state.dart';
import 'package:baby_garden_flutter/screen/booking/provider/delivery_method_provider.dart';
import 'package:baby_garden_flutter/screen/booking/provider/shop_location_provider.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/checkbox/custom_radio_button.dart';
import 'package:baby_garden_flutter/widget/loading/loading_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:nested/nested.dart';
import 'package:provider/provider.dart';

class DeliveryMethod extends StatefulWidget {
  final ValueNotifier<int> deliveryMethod;
  final String shopId;
  final ValueChanged<String> inShopAddressValueChanged;
  const DeliveryMethod({this.deliveryMethod, this.shopId = "0", this.inShopAddressValueChanged}) : super();

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _DeliveryMethodState();
  }
}

class _DeliveryMethodState extends BaseState<DeliveryMethod> {
  final ShopLocationProvider _shopLocationProvider = new ShopLocationProvider();

  @override
  void initState() {
    // TODO: implement initState
    if (_shopLocationProvider.locations.length == 0) {
      _shopLocationProvider.getShopId(widget.shopId);
    }
    super.initState();
  }

  @override
  Widget buildWidget(BuildContext context) {
    // TODO: implement buildWidget
    return ValueListenableBuilder<int>(
      valueListenable: widget.deliveryMethod,
      builder: (BuildContext context, int value, Widget child) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            CustomRadioButton(
              titleContent: Text(S.of(context).delivery_in_shop),
              padding: const EdgeInsets.only(
                  left: SizeUtil.bigSpaceHigher,
                  top: SizeUtil.smallSpace,
                  bottom: SizeUtil.smallSpace),
              value: 1,
              groupValue: value,
              onChanged: (val) {
                widget.deliveryMethod.value = val;
              },
            ),
            //todo shop location
            value == 1
                ? Consumer<ShopLocationProvider>(
                    builder: (BuildContext context, ShopLocationProvider value,
                        Widget child) {
                      if (value.locations == null || value.locations.isEmpty)
                        return LoadingView(
                          isNoData: value.locations != null,
                          onReload: (){
                            _shopLocationProvider.getShopId(widget.shopId);
                          },
                        );
                      return Column(
                        children: value.locations
                            .map((e) => CustomRadioButton(
                                  titleContent: Text(e['address']),
                                  padding: const EdgeInsets.only(
                                      left: SizeUtil.hugSpace,
                                      bottom: SizeUtil.tinySpace),
                                  value: value.locations.indexOf(e),
                                  groupValue: value.shopLocation,
                                  iconSize: SizeUtil.iconSize,
                                  titleSize: SizeUtil.textSizeSmall,
                                  onChanged: (val) {
                                    if(widget.inShopAddressValueChanged!=null){
                                      widget.inShopAddressValueChanged(e['address']);
                                    }
                                    _shopLocationProvider.onChange(val);
                                  },
                                ))
                            .toList(),
                      );
                    },
                  )
                : SizedBox(),
            CustomRadioButton(
              titleContent: Text(S.of(context).delivery_to_address),
              padding: const EdgeInsets.only(
                  left: SizeUtil.bigSpaceHigher,
                  top: SizeUtil.smallSpace,
                  bottom: SizeUtil.smallSpace),
              value: 2,
              groupValue: value,
              onChanged: (val) {
                widget.deliveryMethod.value = val;
              },
            ),
          ],
        );
      },
    );
  }

  @override
  List<SingleChildWidget> providers() {
    // TODO: implement providers
    return [ChangeNotifierProvider.value(value: _shopLocationProvider)];
  }
}
