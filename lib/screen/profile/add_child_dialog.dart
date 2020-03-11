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
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // title
              Container(
                height: 40,
                decoration:
                    setBorder("bottom", Color.fromRGBO(204, 204, 204, 1), 0.5),
                child: Center(
                  child: Text(
                    S.of(context).addChild,
                    style: TextStyle(
                        color: ColorUtil.primaryColor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 12.0),
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
                color: Color.fromRGBO(255, 176, 11, 1),
              )),
              Center(
                child: Text(
                  S.of(context).uploadChildAvatar,
                  style: TextStyle(color: Color.fromRGBO(255, 176, 11, 1)),
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
          padding: EdgeInsets.only(top: 12, left: 12, right: 12),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                MyTextField(
                  borderColor: Color.fromRGBO(255, 176, 11, 1),
                  borderRadius: 6,
                  borderWidth: 0.5,
                  labelText: input['title'],
                  labelStyle: TextStyle(
                      color: Color.fromRGBO(51, 51, 51, 1), fontSize: 12),
                  textEditingController: null,
                ),
              ]),
        );
      }).toList());
}

Widget dialogBtn(context) {
  return Padding(
    padding: const EdgeInsets.only(left: 23, right: 23, top: 23, bottom: 37),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        ButtonTheme(
          minWidth: 90,
          height: 40,
          child: RaisedButton(
            shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(6.0),
            ),
            color: Color.fromRGBO(255, 176, 11, 1),
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text(
              S.of(context).addChild.toUpperCase(),
              style: TextStyle(fontSize: 12.0, color: Colors.white),
            ),
          ),
        ),
        SizedBox(
          width: 50,
        ),
        ButtonTheme(
          minWidth: 90,
          height: 40,
          child: RaisedButton(
            shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(6.0),
            ),
            color: Color.fromRGBO(10, 133, 158, 1),
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text(
              S.of(context).back.toUpperCase(),
              style: TextStyle(fontSize: 12.0, color: Colors.white),
            ),
          ),
        )
      ],
    ),
  );
}
