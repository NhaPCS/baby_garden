import 'package:baby_garden_flutter/data/shared_value.dart';
import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/screen/partner_book_schedule/partner_book_schedule_screen.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/button/my_raised_button.dart';
import 'package:baby_garden_flutter/widget/image/circle_image.dart';
import 'package:baby_garden_flutter/widget/rating_bar.dart';
import 'package:flutter/material.dart';

class StoreInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        CircleImage(
          imageUrl: StringUtil.dummyImage,
          borderRadius: SizeUtil.smallRadius,
          width: SizeUtil.iconSizeLarge,
          height: SizeUtil.iconSizeLarge,
        ),
        SizedBox(
          width: SizeUtil.smallSpace,
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
              "Vườn của bé",
              style: TextStyle(
                  color: ColorUtil.primaryColor, fontWeight: FontWeight.bold),
            ),
            RatingBar()
          ],
        ),
        Expanded(child: SizedBox()),
        MyRaisedButton(
          onPressed: () async {
            String userId =
                await ShareValueProvider.shareValueProvider.getUserId();
            if (userId == null || userId.isEmpty) {
              if (context != null) {
                WidgetUtil.showRequireLoginDialog(context);
              }
              return null;
            } else {
              RouteUtil.push(
                  context,
                  PartnerBookScheduleScreen(
                      shopID: "1",
                      category: "Thời trang"));
            }
          },
          borderColor: ColorUtil.primaryColor,
          borderWidth: 2,
          text: S.of(context).view_shop,
          color: Colors.white,
          borderRadius: 20,
          textStyle: TextStyle(color: ColorUtil.primaryColor),
        ),
        SizedBox(
          width: SizeUtil.smallSpace,
        )
      ],
    );
  }
}
