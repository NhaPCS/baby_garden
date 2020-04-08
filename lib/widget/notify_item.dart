import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/image/svg_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// TODO-Hung: widget là chỗ để custom widget, không phải để item, để vào folder item
class NotifyItem extends StatelessWidget {
  final TextEditingController searchTextController;

  const NotifyItem({Key key, this.searchTextController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      elevation: SizeUtil.smallElevation,
      margin: EdgeInsets.only(top: 2,bottom: 2,left: 2,right: 2),
      child: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(5))),
            margin: EdgeInsets.only(
                top: SizeUtil.tinySpace,
                left: SizeUtil.tinySpace,
                right: SizeUtil.tinySpace),
            padding: EdgeInsets.only(
                left: 0,
                right: SizeUtil.tinySpace,
                top: SizeUtil.tinySpace,
                bottom: SizeUtil.smallSpace),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // TODO-Hung: dùng CircleImage, custom lại để hiển thị đc ImageAsset
                Card(
                  child: Image.asset("photo/logo.png",
                      width: MediaQuery.of(context).size.width / 6),
                  color: ColorUtil.logoBgColor,
                  shape: RoundedRectangleBorder(
                    //TODO set radius
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  elevation: 3.0,
                ),
                Expanded(
                  // TODO-Hung: thay Conatiner bằng Padding
                    child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        S.of(context).notify_title,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontSize: SizeUtil.textSizeBigger,
                            fontWeight: FontWeight.bold,
                            color: ColorUtil.textHint),
                      ),
                      SizedBox(
                        height: SizeUtil.tinySpace,
                      ),
                      Text(
                        S.of(context).notify_booking_success,
                        style: TextStyle(
                            fontSize: SizeUtil.textSizeSmall,
                            color: ColorUtil.textHint),
                      ),
                      SizedBox(
                        height: SizeUtil.tinySpace,
                      ),
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: Text(
                              S.of(context).notice_time("10:30 15/09/2020"),
                              style: TextStyle(
                                  fontSize: SizeUtil.textSizeNotiTime,
                                  color: ColorUtil.textHint),
                            ),
                          ),
                          Text(
                            S.of(context).send_by("Vườn của bé"),
                            style: TextStyle(
                                color: ColorUtil.primaryColor,
                                fontSize: SizeUtil.textSizeNotiTime),
                          ),
                        ],
                      )
                    ],
                  ),
                  padding: EdgeInsets.only(left: SizeUtil.tinySpace),
                ))
              ],
            ),
          ),
          Positioned(
            child: SvgIcon(
              'ic_delete.svg',
              width: SizeUtil.iconSize,
              color: ColorUtil.textHint,
            ),
            right: SizeUtil.smallSpace,
            top: SizeUtil.smallSpace,
          ),
        ],
      ),
    );
  }
}
