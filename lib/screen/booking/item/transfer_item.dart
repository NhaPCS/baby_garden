import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/checkbox/custom_radio_button.dart';
import 'package:baby_garden_flutter/widget/line/dot_line_separator.dart';
import 'package:baby_garden_flutter/widget/text/my_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class TransferItem extends StatelessWidget {
  final dynamic transfer;
  final String transferCode;
  final String selectedTransferCode;
  final VoidCallback onSelected;
  final dynamic coupon;

  const TransferItem(
      {Key key,
      @required this.transfer,
      @required this.transferCode,
      @required this.selectedTransferCode,
      @required this.onSelected,
      this.coupon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        CustomRadioButton(
          crossAxisAlignment: CrossAxisAlignment.center,
          titleContent: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              CachedNetworkImage(
                imageUrl: transfer['image'] ?? '',
                width: 40,
                height: 16,
              ),
              SizedBox(
                width: SizeUtil.tinySpace,
              ),
              MyText(
                transfer['name'],
                style: TextStyle(fontSize: SizeUtil.textSizeExpressDetail),
              ),
            ],
          ),
          subTitle: MyText(
            "${transfer['deliveryTime']} ${transfer['time_unit']}",
            style: TextStyle(
                fontSize: SizeUtil.textSizeNoticeTime, color: ColorUtil.gray),
          ),
          padding: const EdgeInsets.only(
              left: SizeUtil.bigSpaceHigher,
              top: SizeUtil.smallSpace,
              bottom: SizeUtil.smallSpace,
              right: SizeUtil.normalSpace),
          value: transferCode,
          groupValue: selectedTransferCode,
          onChanged: (val) {
            onSelected();
          },
          trailing: (coupon != null && coupon['code'] == transferCode)
              ? Row(
                  children: <Widget>[
                    MyText(
                      StringUtil.getPriceText(
                          transfer['fee']['total_fee'].toString()),
                      style: TextStyle(
                        fontSize: SizeUtil.textSizeTiny,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                    SizedBox(
                      width: SizeUtil.tinySpace,
                    ),
                    Text(
                      StringUtil.getPriceText(
                          (coupon['total_discount_fee']['total_fee'] ?? 0)
                              .toString()),
                      style: TextStyle(
                        fontSize: SizeUtil.textSizeSmall,
                      ),
                    ),
                  ],
                )
              : MyText(
                  StringUtil.getPriceText(
                      (transfer['fee']['total_fee'] ?? 0).toString()),
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
    );
  }
}
