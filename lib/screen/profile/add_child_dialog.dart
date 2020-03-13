import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/my_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddChildDialog extends StatefulWidget {
  @override
  _ShowAddAddressDialogState createState() => _ShowAddAddressDialogState();
}

class _ShowAddAddressDialogState extends State<AddChildDialog> {
  var checkDefaultAdd = false;

  Widget build(BuildContext context) {
    List<Map<String, String>> listInput = [
      {'title': S.of(context).nameOfChild},
      {'title': S.of(context).gender},
      {'title': S.of(context).dateOfBirth}
    ];

    return SingleChildScrollView(
      child: Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(SizeUtil.bigRadius),
        ),
        child: Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // title
              Container(
                height: SizeUtil.biggerSpace,
                decoration:
                    setBorder("bottom", Color.fromRGBO(204, 204, 204, 1), 0.5),
                child: Center(
                  child: Text(
                    S.of(context).addChild,
                    style: TextStyle(
                        color: ColorUtil.primaryColor,
                        fontSize: SizeUtil.textSizeBigger,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
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
                  style: TextStyle(color: ColorUtil.colorAccent),
                ),
              ),

              listInputView(listInput),
              dialogBtn(context)
            ],
          ),
        ),
      ),
    );
  }
}

Widget listInputView(List<Map<String, String>> listInput) {
  return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: listInput.map((input) {
        return Padding(
          padding: EdgeInsets.only(
              top: SizeUtil.midSpace,
              left: SizeUtil.midSpace,
              right: SizeUtil.midSpace),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(SizeUtil.tinyRadius),
                      color: Colors.white,
                      boxShadow: WidgetUtil.getShadow()),
                  child: MyTextField(
                    borderColor: ColorUtil.colorAccent,
                    borderRadius: SizeUtil.tinyRadius,
                    borderWidth: 0.5,
                    labelText: input['title'],
                    labelStyle: TextStyle(
                        color: ColorUtil.black33,
                        fontSize: SizeUtil.textSizeSmall),
                    textEditingController: null,
                  ),
                ),
              ]),
        );
      }).toList());
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
