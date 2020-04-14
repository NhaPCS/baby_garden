import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// TODO-QAnh: sửa lại tất cả số liệu fix cứng của kích thước và text
class ShowAddAddressDialog extends StatefulWidget {
  @override
  _ShowAddAddressDialogState createState() => _ShowAddAddressDialogState();
}

// TODO-QAnh: Không dùng setState ở đây, nên dùng provider vì khi setState nó sẽ build lại cả dialog
class _ShowAddAddressDialogState extends State<ShowAddAddressDialog> {
  var checkDefaultAdd = false;

  Widget build(BuildContext context) {
    // TODO-QAnh: bo phan nay di, nó chỉ có 4 mục, anh có thể tạo 1 hàm chung để lấy widget gồm 1 label và 1 text input. anh làm như thế này lồng view rất nhiều, render sẽ mất công hơn
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
    // TODO-QAnh: nên để dialog bao bên ngoài, SingleChildScrollView chỉ nên dùng bao ngoài COlumn
    return SingleChildScrollView(
      child: Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        //
        // TODO-QAnh: container này không có tác dụng gì thì bỏ đi
        child: Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // title
              // TODO-QAnh: không fix cứng height của Container ở đây, để padding là nó sẽ wrap
              Container(
                height: 40,
                decoration:
                    setBorder("bottom", Color.fromRGBO(204, 204, 204, 1), 0.5),
                // TODO-QAnh: không cần center ở đây, trong Conatiner đã có alignment
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
                  // TODO-QAnh: có thể dùng CircleCheckbox
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

// TODO-QAnh: hàm này chuyển thành trả về 1 widget bao gồm 1 label và 1 input. không generate từ list nữa, gây nhiều column lồng
Widget listInputView(List<Map<String, String>> listInput) {
  var index = 0;
  // TODO-QAnh: sẽ không có column này nữa
  return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: listInput.map((input) {
        // TODO-QAnh: không lấy index = cách này,
        index += 1;
        // TODO-QAnh: thực tết cái container này để hiển thị 1 cái line, bỏ đi thay bằng 1 widget line trong column phía
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
                // TODO-QAnh: bỏ set height
                Container(
                  height: 28,
                  // TODO-QAnh: dùng MyTextField
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
        // TODO-QAnh: dùng MyRaisedButton
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
        Spacer(),
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
