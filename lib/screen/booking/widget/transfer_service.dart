import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/item/added_promo_item.dart';
import 'package:baby_garden_flutter/screen/base_state.dart';
import 'package:baby_garden_flutter/screen/booking/provider/transfer_method_provider.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/checkbox/custom_radio_button.dart';
import 'package:baby_garden_flutter/widget/line/dot_line_separator.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nested/nested.dart';
import 'package:provider/provider.dart';

class TransferService extends StatefulWidget {
  final TransferMethodProvider transferMethodProvider;
  final TextEditingController promoteShipCodeController;

  const TransferService(
      {this.transferMethodProvider, this.promoteShipCodeController})
      : super();

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _TransferServiceState();
  }
}

class _TransferServiceState extends BaseState<TransferService> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget buildWidget(BuildContext context) {
    // TODO: implement buildWidget
    return Consumer<TransferMethodProvider>(
      builder:
          (BuildContext context, TransferMethodProvider value, Widget child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Column(
                children: value.ships
                    .map((e) => Column(
                          children: <Widget>[
                            CustomRadioButton(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              titleContent: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  CachedNetworkImage(
                                    imageUrl: e['img'],
                                    width: 40,
                                    height: 16,
                                  ),
                                  SizedBox(
                                    width: SizeUtil.tinySpace,
                                  ),
                                  Text(
                                    e['name'],
                                    style: TextStyle(
                                        fontSize:
                                            SizeUtil.textSizeExpressDetail),
                                  ),
                                ],
                              ),
                              subTitle: Text(
                                e['note'],
                                style: TextStyle(
                                    fontSize: SizeUtil.textSizeNoticeTime,
                                    color: ColorUtil.gray),
                              ),
                              padding: const EdgeInsets.only(
                                  left: SizeUtil.bigSpaceHigher,
                                  top: SizeUtil.smallSpace,
                                  bottom: SizeUtil.smallSpace,
                                  right: SizeUtil.normalSpace),
                              value: value.ships.indexOf(e),
                              groupValue: value.transferMethod,
                              onChanged: (val) {
                                widget.transferMethodProvider.onChange(val);
                              },
                              trailing: (value.isActiveCode &&
                                      value.transferMethod ==
                                          value.ships.indexOf(e))
                                  ? Row(
                                      children: <Widget>[
                                        Text(
                                          e['price'],
                                          style: TextStyle(
                                            fontSize: SizeUtil.textSizeTiny,
                                            decoration:
                                                TextDecoration.lineThrough,
                                          ),
                                        ),
                                        SizedBox(
                                          width: SizeUtil.tinySpace,
                                        ),
                                        Text(
                                          e['price_discount'],
                                          style: TextStyle(
                                            fontSize: SizeUtil.textSizeSmall,
                                          ),
                                        ),
                                      ],
                                    )
                                  : Text(
                                      e['price'],
                                      style: TextStyle(
                                        fontSize: SizeUtil.textSizeSmall,
                                      ),
                                    ),
                            ),
                            Container(
                                margin: EdgeInsets.only(
                                  left: SizeUtil.notifyHintSpace,
                                ),
                                child: DotLineSeparator(
                                  color: ColorUtil.lineColor,
                                  paddingLeft: SizeUtil.largeSpace,
                                ))
                          ],
                        ))
                    .toList()),
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
                            controller: widget.promoteShipCodeController,
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
                            if (widget.promoteShipCodeController.text
                                    .toString()
                                    .trim()
                                    .length >
                                0) {
                              var correct = widget.transferMethodProvider
                                  .checkPromoteCode(
                                      widget.promoteShipCodeController.text);
                              WidgetUtil.showMessageDialog(context,
                                  message: correct
                                      ? S.of(context).correct_code
                                      : S.of(context).incorrect_code,
                                  title: S.of(context).notify);
                              if (correct) {
                                widget.transferMethodProvider.setIsActive();
                              }
                            }

                            //TODO booking
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
                  value.isActiveCode
                      ? AddedPromoItem(
                          onRemoved: () {
                            widget.transferMethodProvider.removePromote();
                          },
                          promotion: {
                            'code': value.promoteCode,
                            "title": "Giảm giá"
                          },
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

  @override
  List<SingleChildWidget> providers() {
    // TODO: implement providers
    return [];
  }
}
