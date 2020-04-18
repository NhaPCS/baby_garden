import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/screen/remind_edit/remind_edit_screen.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/button/button_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// TODO-QAnh: item thi phải có chữ Item ở cuối
class RemindCardItem extends StatelessWidget {
  // TODO-QAnh: truyen vao Object, không truyền từng giá trị thế này
  final id;
  final image;
  final description;
  final price;
  final datetime;
  final remindType;
  final bool displayIcon;

  RemindCardItem(
      {Key key,
      this.image,
      this.description,
      this.price,
      this.datetime,
      this.remindType,
      this.id,
      this.displayIcon = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: setBorder('bottom', Color.fromRGBO(197, 193, 193, 1), 1),
      width: double.infinity,
      // TODO-QAnh: k fix height, để wrap
      height: 110,
      child: Card(
        margin: EdgeInsets.only(top: 0),
        child: Row(children: <Widget>[
          ClipRRect(
            child: Image.asset(
              this.image,
              width: 76.0,
              height: 76.0,
            ),
          ),
          Expanded(
            child: Container(
              // TODO-QAnh: sao expand rồi mà vân cần set height?
                height: 100,
                // TODO-QAnh: k dung ListView, dung Column
                child: ListView(
                    padding: const EdgeInsets.all(SizeUtil.midSmallSpace),
                    physics: NeverScrollableScrollPhysics(),
                    children: <Widget>[
                      RichText(
                          text: TextSpan(
                              style: TextStyle(
                                  fontSize: SizeUtil.textSizeDefault,
                                  color: Colors.black),
                              children: <TextSpan>[
                            TextSpan(
                                text: this.remindType == RemindType.remindBuy
                                    ? "[${S.of(context).remindBuy}] "
                                        .toUpperCase()
                                    : "[${S.of(context).remindUse}] "
                                        .toUpperCase(),
                                style: TextStyle(
                                    fontSize: 13,
                                    color:
                                        this.remindType == RemindType.remindBuy
                                            ? Colors.blue
                                            : Colors.orange)),
                            TextSpan(
                                text: this.description,
                                style: TextStyle(fontSize: 13))
                          ])),
                      Padding(
                        padding: const EdgeInsets.only(top: SizeUtil.tinySpace),
                        child: Text(
                          this.price,
                          style: TextStyle(
                              color: Colors.red,
                              fontSize: SizeUtil.textSizeBigger,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: SizeUtil.tinySpace),
                        child: Row(children: [
                          Icon(
                            Icons.alarm,
                            color: Colors.orange,
                            size: SizeUtil.iconMidSize,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: SizeUtil.midSmallSpace),
                            child: Text(this.datetime,
                                style: TextStyle(
                                    color: ColorUtil.grayLine,
                                    fontSize: SizeUtil.textSizeSmall)),
                          ),
                        ]),
                      )
                    ])),
          ),
          Padding(
            padding:
                const EdgeInsets.only(top: 36, right: SizeUtil.midSmallSpace),
            child: Visibility(
              visible: displayIcon,
              child: Column(
                children: <Widget>[
                  ButtonIcon(
                    icon: Icon(Icons.delete,
                        size: SizeUtil.iconMidSize, color: ColorUtil.darkGray),
                    onPressed: () {
                      //remove reminder
                    },
                  ),
                  ButtonIcon(
                    icon: Icon(
                      Icons.edit,
                      size: SizeUtil.iconMidSize,
                      color: ColorUtil.darkGray,
                    ),
                    onPressed: () {
                      RouteUtil.push(context, RemindEditScreen());
                    },
                  )
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }
}

enum RemindType { remindBuy, remindUse }