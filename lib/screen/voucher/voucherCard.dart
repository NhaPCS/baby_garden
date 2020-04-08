import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// TODO-QAnh: nếu là item viết phải kết thúc bằng Item
class VoucherCard extends StatelessWidget {
  // TODO-QAnh: data truyền vào object, không để chi tiết các thuộc tính của object
  final image;
  final description;
  final partner;
  final timeRemain;
  final context;

  VoucherCard(
      {Key key,
      this.image,
      this.description,
      this.partner,
      this.timeRemain,
      this.context})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // TODO-QAnh: cai nay để tạo shadow à? Card cũng có elevation rồi
      margin: EdgeInsets.only(
        top: SizeUtil.midSmallSpace,
      ),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            blurRadius: 6,
            color: Color.fromRGBO(0, 0, 0, 0.16),
            offset: Offset(0.0, 3.0),
          )
        ],
      ),
      width: double.infinity,
      // TODO-QAnh: để wrap, k fix height
      height: 90,
      child: Card(
        shape: RoundedRectangleBorder(
          side: BorderSide(color: ColorUtil.darkGray, width: 0.1),
          borderRadius: BorderRadius.circular(0),
        ),
        margin: EdgeInsets.only(top: 0),
        child: Row(children: <Widget>[
          Container(
            margin: EdgeInsets.only(left: SizeUtil.defaultSpace),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(SizeUtil.smallRadius),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.16),
                    offset: Offset(-3.0, 3.0),
                  )
                ],
                border: Border.all(color: ColorUtil.darkGray, width: 0.3)),
            // TODO-QAnh: dung CircleImage
            child: ClipRRect(
              child: Image.asset(
                this.image,
                width: 55.0,
                height: 55.0,
              ),
            ),
          ),
          Expanded(
            child: Container(
              // TODO-QAnh: k fix height, mà đã Expand rồi sao cần fix height? Container này bỏ đi cũng đc
                height: 90,
                padding: EdgeInsets.only(top: SizeUtil.tinySpace, left: 35),
                // TODO-QAnh: dung Column
                child: ListView(
                    padding: const EdgeInsets.all(SizeUtil.midSmallSpace),
                    physics: NeverScrollableScrollPhysics(),
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: SizeUtil.tinySpace),
                        child: Text(
                          this.description,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                          padding:
                              const EdgeInsets.only(top: SizeUtil.smallSpace),
                          child: Row(children: <Widget>[
                            Text(S.of(this.context).partner + ': ',
                                style: TextStyle(
                                    color: Color.fromRGBO(8, 105, 145, 1),
                                    fontWeight: FontWeight.bold)),
                            Text(this.partner,
                                style: TextStyle(
                                  color: Color.fromRGBO(8, 105, 145, 1),
                                ))
                          ])),
                      Padding(
                        padding: const EdgeInsets.only(top: SizeUtil.tinySpace),
                        child: Text(
                          timeRemain != null ? this.timeRemain : '',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.red),
                        ),
                      )
                    ])),
          ),
        ]),
      ),
    );
  }
}
