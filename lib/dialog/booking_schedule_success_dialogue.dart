import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/screen/partner/partner_book_schedule_success.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:flutter/material.dart';

class BookingScheduleSuccessDialogue extends Dialog{
  final BuildContext context;

  BookingScheduleSuccessDialogue(this.context);

  @override
  // TODO: implement shape
  ShapeBorder get shape => RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(15.0),
  );

  @override
  // TODO: implement child
  Widget get child => Container(
    //todo create round color
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15.0),
      color: Colors.white,
      border: Border(
        left: BorderSide(
          color: ColorUtil.primaryColor,
          width: 0.7,
        ),
        right: BorderSide(
          color: ColorUtil.primaryColor,
          width: 0.7,
        ),
        top: BorderSide(
          color: ColorUtil.primaryColor,
          width: 0.7,
        ),
        bottom: BorderSide(
          color: ColorUtil.primaryColor,
          width: 0.7,
        ),
      ),
    ),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: SizeUtil.midSmallSpace,bottom: SizeUtil.midSmallSpace),
          child: Text(S.of(context).booking_schedule_success,style: TextStyle(color: ColorUtil.primaryColor,fontSize: SizeUtil.textSizeDefault,fontWeight: FontWeight.bold),),
        ),
        RaisedButton(
          onPressed: () {
            Navigator.of(context).pop(true);
          },
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(SizeUtil.smallRadius),
              )),
          color: ColorUtil.primaryColor,
          child: Text(
            S.of(context).confirm,
            style: TextStyle(
                fontSize: SizeUtil.textSizeTiny,
                color: Colors.white,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.bold),
          ),
        ),
      ],
    ),
  );
}