import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/image/svg_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// TODO-Hung: widget là chỗ để custom widget, không phải để item, để vào folder item
class ExpressItem extends StatelessWidget {
  const ExpressItem({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      elevation: 0,
      // TODO-Hung: k dùng elevation thì bỏ mịa đi cho rồi
      child: Padding(
        padding: EdgeInsets.all(SizeUtil.normalSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              S.of(context).express_title,
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
                Text(
                  S.of(context).express_descrip,
                  style: TextStyle(color: ColorUtil.primaryColor,fontSize: SizeUtil.textSizeSmall),
                ),
              ],
            ),
            SizedBox(height: SizeUtil.tinySpace,),
            Container(
              height: MediaQuery.of(context).size.width*3 / 16 +2,
              child: Row(
                children: <Widget>[
                  // TODO-Hung: xoa het anh test trong asset di
                  Image.asset("photo/express_item_img.png",
                      width: MediaQuery.of(context).size.width*3 / 16,height: MediaQuery.of(context).size.width*3 / 16,fit: BoxFit.cover,),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(left: SizeUtil.tinySpace),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            S.of(context).express_short_content,
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
                                S.of(context).express_time,
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
      ),
    );
  }
}
