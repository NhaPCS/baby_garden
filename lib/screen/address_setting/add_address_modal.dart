import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShowAddAddressDialog extends StatefulWidget {
  @override
  _ShowAddAddressDialogState createState() => _ShowAddAddressDialogState();
}

class _ShowAddAddressDialogState extends State<ShowAddAddressDialog> {
  var checkDefaultAdd = false;

  Widget build(BuildContext context) {
    List<Map<String, String>> listInput = [
      {
        'title': S.of(context).addressDetail,
        'hint': S.of(context).addressDetailHint
      },
      {'title': S.of(context).province, 'hint': S.of(context).choose_province},
      {'title': S.of(context).district, 'hint': S.of(context).choose_district},
      {
        'title': S.of(context).sub_district,
        'hint': S.of(context).choose_sub_district
      }
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
                    S.of(context).addAddress,
                    style: TextStyle(
                        color: ColorUtil.primaryColor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),

              listInputView(listInput),
              Row(
                children: <Widget>[
                  Checkbox(
                      value: this.checkDefaultAdd,
                      onChanged: (bool value) {
                        setState(() {
                          this.checkDefaultAdd = !this.checkDefaultAdd;
                        });
                      }),
                  Text(
                    S.of(context).set_delivery_address,
                    style: TextStyle(color: ColorUtil.black33, fontSize: 12),
                  ),
                ],
              ),

              dialogBtn(context)
            ],
          ),
        ),
      ),
    );
  }
}

Widget listInputView(List<Map<String, String>> listInput) {
  var index = 0;
  return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: listInput.map((input) {
        index += 1;
        return Container(
          decoration:
              setBorder("bottom", Color.fromRGBO(204, 204, 204, 1), 0.5),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(
                      left: SizeUtil.midSmallSpace,
                      top: SizeUtil.midSmallSpace),
                  child: Text(input['title'],
                      style: TextStyle(
                          color: Color.fromRGBO(51, 51, 51, 1), fontSize: 12)),
                ),
                Container(
                  height: 28,
                  child: TextField(
                    decoration: InputDecoration(
                      suffixIcon: Icon(
                        Icons.expand_more,
                        color: index == 1 ? Colors.white : ColorUtil.black33,
                      ),
                      contentPadding:
                          EdgeInsets.only(left: SizeUtil.midSmallSpace),
                      hintText: input['hint'],
                      hintStyle: TextStyle(
                          fontSize: 9.0,
                          color: Color.fromRGBO(100, 100, 100, 1)),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ]),
        );
      }).toList());
}

Widget dialogBtn(context) {
  return Padding(
    padding: const EdgeInsets.only(left: 35, right: 35),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        ButtonTheme(
          minWidth: 90,
          height: 23,
          child: RaisedButton(
            shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(5.0),
            ),
            color: ColorUtil.primaryColor,
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text(
              S.of(context).cancel,
              style: TextStyle(fontSize: 12.0, color: Colors.white),
            ),
          ),
        ),
        SizedBox(
          width: 50,
        ),
        ButtonTheme(
          minWidth: 90,
          height: 23,
          child: RaisedButton(
            shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(5.0),
            ),
            color: ColorUtil.primaryColor,
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text(
              S.of(context).addNew,
              style: TextStyle(fontSize: 12.0, color: Colors.white),
            ),
          ),
        )
      ],
    ),
  );
}
