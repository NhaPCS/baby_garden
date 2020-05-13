import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/screen/base_state.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/button/my_raised_button.dart';
import 'package:baby_garden_flutter/widget/input/my_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddChildDialog extends StatefulWidget {
  @override
  _ShowAddAddressDialogState createState() => _ShowAddAddressDialogState();
}

class _ShowAddAddressDialogState extends State<AddChildDialog> {
  final TextEditingController _nameController = TextEditingController();
  var checkDefaultAdd = false;

  Widget build(BuildContext context) {
    return AlertDialog(
      titlePadding: EdgeInsets.all(0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(SizeUtil.bigRadius),
      ),
      title: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        centerTitle: true,
        title: Text(
          S.of(context).addChild,
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: ColorUtil.primaryColor,
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // title
          Padding(
            padding: const EdgeInsets.only(top: SizeUtil.midSpace),
            child: Center(
              child: Image.asset(
                "photo/child_avatar.png",
                width: 80,
                height: 80,
              ),
            ),
          ),
          Center(
              child: Icon(
            Icons.photo_camera,
            color: ColorUtil.colorAccent,
          )),
          Center(
            child: Text(
              S.of(context).uploadChildAvatar,
              style: TextStyle(
                  color: ColorUtil.colorAccent,
                  fontSize: SizeUtil.textSizeSmall),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: SizeUtil.midSpace,
                left: SizeUtil.midSpace,
                right: SizeUtil.midSpace),
            child: MyTextField(
              borderColor: ColorUtil.colorAccent,
              borderRadius: SizeUtil.tinyRadius,
              borderWidth: 0.5,
              elevation: 3,
              contentPadding: EdgeInsets.symmetric(
                  horizontal: SizeUtil.midSpace, vertical: SizeUtil.smallSpace),
              hint: S.of(context).nameOfChild,
              hintStyle: TextStyle(
                  color: ColorUtil.black33, fontSize: SizeUtil.textSizeSmall),
              textStyle: TextStyle(
                  color: ColorUtil.black33,
                  fontSize: SizeUtil.textSizeExpressTitle),
              textEditingController: _nameController,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: SizeUtil.midSpace,
                left: SizeUtil.midSpace,
                right: SizeUtil.midSpace),
            child: ButtonTheme(
              child: RaisedButton(
                onPressed: () {
                  WidgetUtil.showGenderSelectorDialog(context, (gender) {});
                },
                elevation: 3,
                child: SizedBox(
                  child: Text(
                    S.of(context).gender,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontSize: SizeUtil.textSizeSmall,
                        color: ColorUtil.black33),
                  ),
                  width: double.infinity,
                ),
                shape: RoundedRectangleBorder(
                    side: BorderSide(color: ColorUtil.primaryColor, width: 0.5),
                    borderRadius:
                        BorderRadius.all(Radius.circular(SizeUtil.tinyRadius))),
                color: Colors.white,
              ),
              minWidth: double.infinity,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: SizeUtil.midSpace,
                left: SizeUtil.midSpace,
                right: SizeUtil.midSpace),
            child: ButtonTheme(
              child: RaisedButton(
                onPressed: () {
                  WidgetUtil.showBirthdaySelectorDialog(context, (birthday) {});
                },
                elevation: 3,
                child: SizedBox(
                  child: Text(
                    S.of(context).dateOfBirth,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontSize: SizeUtil.textSizeSmall,
                        color: ColorUtil.black33),
                  ),
                  width: double.infinity,
                ),
                shape: RoundedRectangleBorder(
                    side: BorderSide(color: ColorUtil.primaryColor, width: 0.5),
                    borderRadius:
                        BorderRadius.all(Radius.circular(SizeUtil.tinyRadius))),
                color: Colors.white,
              ),
              minWidth: double.infinity,
            ),
          ),
          SizedBox(height: SizeUtil.defaultSpace),
          dialogBtn(context)
        ],
      ),
    );
  }
}

Widget dialogBtn(context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.end,
    children: <Widget>[
      SizedBox(
        width: SizeUtil.smallSpace,
      ),
      Flexible(
        child: MyRaisedButton(
            matchParent: true,
            padding: EdgeInsets.only(
              top: SizeUtil.midSpace,
              bottom: SizeUtil.midSpace,
            ),
            text: S.of(context).addChild.toUpperCase(),
            textStyle: TextStyle(
                fontSize: SizeUtil.textSizeSmall, color: Colors.white),
            color: ColorUtil.colorAccent,
            borderRadius: SizeUtil.tinyRadius,
            onPressed: () {
              // TODO add api add child
              // http://chap.com.vn/vcb/api/addBaby
              Navigator.of(context).pop();
            }),
      ),
      SizedBox(
        width: SizeUtil.midSmallSpace,
      ),
      Flexible(
        child: MyRaisedButton(
            matchParent: true,
            padding: EdgeInsets.only(
              top: SizeUtil.midSpace,
              bottom: SizeUtil.midSpace,
            ),
            text: S.of(context).comeBack.toUpperCase(),
            textStyle: TextStyle(
                fontSize: SizeUtil.textSizeSmall, color: Colors.white),
            color: Color.fromRGBO(10, 133, 158, 1),
            borderRadius: SizeUtil.tinyRadius,
            onPressed: () {
              Navigator.of(context).pop();
            }),
      ),
      SizedBox(
        width: SizeUtil.smallSpace,
      ),
    ],
  );
}
