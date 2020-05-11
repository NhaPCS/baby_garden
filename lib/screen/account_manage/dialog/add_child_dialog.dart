import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/util/resource.dart';
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
              labelText: S.of(context).nameOfChild,
              labelStyle: TextStyle(
                  color: ColorUtil.black33, fontSize: SizeUtil.textSizeSmall),
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
                  WidgetUtil.showGenderSelectorDialog(context, (gender){

                  });
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
                  WidgetUtil.showBirthdaySelectorDialog(context, (birthday){

                  });
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
          dialogBtn(context)
        ],
      ),
    );
  }
}

Widget dialogBtn(context) {
  return Padding(
    padding: const EdgeInsets.only(
        left: SizeUtil.defaultSpace,
        right: SizeUtil.defaultSpace,
        top: SizeUtil.defaultSpace,
        bottom: SizeUtil.biggerSpace),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        // TODO-QAnh: dung MyRaisedButton
        ButtonTheme(
          minWidth: 90,
          height: SizeUtil.biggerSpace,
          child: RaisedButton(
            shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(SizeUtil.tinyRadius),
            ),
            color: ColorUtil.colorAccent,
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text(
              S.of(context).addChild.toUpperCase(),
              style: TextStyle(
                  fontSize: SizeUtil.textSizeSmall, color: Colors.white),
            ),
          ),
        ),
        SizedBox(
          width: SizeUtil.hugSpace,
        ),
        // TODO-QAnh: dung MyRaisedButton
        ButtonTheme(
          minWidth: 90,
          height: SizeUtil.biggerSpace,
          child: RaisedButton(
            shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(SizeUtil.tinyRadius),
            ),
            color: Color.fromRGBO(10, 133, 158, 1),
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text(
              S.of(context).comeBack.toUpperCase(),
              style: TextStyle(
                  fontSize: SizeUtil.textSizeSmall, color: Colors.white),
            ),
          ),
        )
      ],
    ),
  );
}
