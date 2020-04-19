import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../widget/image/svg_icon.dart';

class NotifyItem extends StatelessWidget {
  final dynamic data;
  final Function deleteNotify;
  const NotifyItem({this.data,this.deleteNotify}) : super();

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
                Card(
                  child:CachedNetworkImage(imageUrl: data['shop_img'],width: MediaQuery.of(context).size.width / 6,
                    height: MediaQuery.of(context).size.width / 6,fit: BoxFit.cover,),
                  color: ColorUtil.logoBgColor,
                  shape: RoundedRectangleBorder(
                    //TODO set radius
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  elevation: 3.0,
                ),
                Expanded(
                    child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        data['title'],
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
                        data['content'],
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
                              data['date'],
                              style: TextStyle(
                                  fontSize: SizeUtil.textSizeNotiTime,
                                  color: ColorUtil.textHint),
                            ),
                          ),
                          Text(
                            S.of(context).send_by(data['shop_name']),
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
            child: GestureDetector(
              onTap: deleteNotify,
              child: SvgIcon(
                'ic_delete.svg',
                width: SizeUtil.iconSize,
                color: ColorUtil.textHint,
              ),
            ),
            right: SizeUtil.smallSpace,
            top: SizeUtil.smallSpace,
          ),
        ],
      ),
    );
  }
}
