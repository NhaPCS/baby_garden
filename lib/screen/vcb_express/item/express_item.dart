import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/text/my_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../widget/image/svg_icon.dart';

class ExpressItem extends StatelessWidget {
  dynamic data;
  ExpressItem({this.data}) : super();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: SizeUtil.midSmallSpace, right: SizeUtil.midSmallSpace, top: SizeUtil.midSmallSpace),
      padding: EdgeInsets.all(SizeUtil.normalSpace),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(SizeUtil.tinyRadius))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            data['title'],
            style: TextStyle(
                fontSize: SizeUtil.textSizeExpressTitle,
                color: ColorUtil.textColor,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(height: SizeUtil.tinySpace,),
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            direction: Axis.horizontal,
            alignment: WrapAlignment.start,
            children: <Widget>[
              SvgIcon(
                'express_seemore_svg.svg',
                padding: EdgeInsets.only(right: SizeUtil.midSmallSpace),
                color: ColorUtil.primaryColor,
                onPressed: () {
                  //TODO
                },
              ),
              MyText(
                data['category_name'],
                style: TextStyle(color: ColorUtil.primaryColor,fontSize: SizeUtil.textSizeSmall),
              ),
            ],
          ),
          SizedBox(height: SizeUtil.tinySpace,),
          Container(
            height: MediaQuery.of(context).size.width*3 / 16 +2,
            child: Row(
              children: <Widget>[
                CachedNetworkImage(
                  imageUrl: data['img'],
                  width: MediaQuery.of(context).size.width*3 / 16,height: MediaQuery.of(context).size.width*3 / 16,fit: BoxFit.cover,
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(left: SizeUtil.tinySpace),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        MyText(
                          StringUtil.removeHtml(data['content']),
                          style: TextStyle(fontSize: SizeUtil.textSizeSmall),
                          textAlign: TextAlign.start,
                          maxLines: 4,
                        ),
                        Spacer(),
                        Wrap(
                          crossAxisAlignment: WrapCrossAlignment.center,
                          direction: Axis.horizontal,
                          alignment: WrapAlignment.start,
                          children: <Widget>[
                            Icon(
                              Icons.access_alarm,
                              color: ColorUtil.textHint,
                              size: SizeUtil.iconSizeSmall,
                            ),
                            Text(
                              data['date'],
                              style: TextStyle(
                                  color: ColorUtil.textHint,
                                  fontSize: SizeUtil.textSizeSmall),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
