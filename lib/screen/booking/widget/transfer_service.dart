import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/item/added_promo_item.dart';
import 'package:baby_garden_flutter/screen/base_state.dart';
import 'package:baby_garden_flutter/screen/booking/item/transfer_item.dart';
import 'package:baby_garden_flutter/screen/booking/provider/transfer_method_provider.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/checkbox/custom_radio_button.dart';
import 'package:baby_garden_flutter/widget/line/dot_line_separator.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nested/nested.dart';
import 'package:provider/provider.dart';

class TransferService extends StatelessWidget {
  final TransferMethodProvider transferMethodProvider;
  final TextEditingController promoteShipCodeController;

  const TransferService(
      {this.transferMethodProvider, this.promoteShipCodeController})
      : super();

  @override
  Widget build(BuildContext context) {
    return Consumer<TransferMethodProvider>(
      builder:
          (BuildContext context, TransferMethodProvider value, Widget child) {
        List<String> shipKeys =
            value.ships == null ? List() : value.ships.keys.toList();
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Column(
                children: shipKeys.map((e) {
              return TransferItem(
                transfer: value.ships[e],
                selectedTransferCode: transferMethodProvider.selectedTransfer,
                onSelected: () {
                  transferMethodProvider.onChange(e);
                },
                transferCode: e,
                coupon: transferMethodProvider.coupon,
              );
            }).toList()),
            Padding(
              padding: const EdgeInsets.only(
                  left: SizeUtil.bigSpaceHigher,
                  bottom: SizeUtil.smallSpace,
                  right: SizeUtil.tinySpace),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    S.of(context).enter_delivery_code,
                    style: TextStyle(
                        fontSize: SizeUtil.textSizeSmall,
                        color: ColorUtil.primaryColor,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: SizeUtil.tinySpace,
                  ),
                  Container(
                    height: SizeUtil.delivery_code_height,
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: TextField(
                            style: TextStyle(fontSize: SizeUtil.textSizeSmall),
                            obscureText: false,
                            controller: promoteShipCodeController,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(0)),
                                ),
                                hintText: S.of(context).delivery_code,
                                hintStyle:
                                    TextStyle(fontSize: SizeUtil.textSizeSmall),
                                contentPadding:
                                    EdgeInsets.only(left: 8, right: 4)),
                          ),
                        ),
                        SizedBox(
                          width: SizeUtil.smallSpace,
                        ),
                        RaisedButton(
                          onPressed: () {
                            if (promoteShipCodeController.text
                                .toString()
                                .trim()
                                .isNotEmpty) {
                              transferMethodProvider.getTransferPromotion(
                                  promoteShipCodeController.text);
                            }
                          },
                          color: ColorUtil.primaryColor,
                          shape: RoundedRectangleBorder(),
                          child: Container(
                            padding: EdgeInsets.all(SizeUtil.midSpace),
                            child: Text(
                              S.of(context).apply.toUpperCase(),
                              style: TextStyle(
                                  fontSize: SizeUtil.textSizeSmall,
                                  color: Colors.white,
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: SizeUtil.smallSpace,
                        ),
                      ],
                    ),
                  ),
                  value.coupon != null
                      ? AddedPromoItem(
                          onRemoved: () {
                            transferMethodProvider.removeCoupon();
                          },
                          promotion: value.coupon,
                          padding: EdgeInsets.only(
                              top: SizeUtil.tinySpace, bottom: 0),
                        )
                      : SizedBox(),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
