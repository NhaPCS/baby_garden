import 'package:baby_garden_flutter/screen/base_state.dart';
import 'package:baby_garden_flutter/screen/point_management/point_history_screen.dart';

import 'package:baby_garden_flutter/util/resource.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nested/nested.dart';

// TODO-QAnh: đây là item phải thêm chữ Item ở cuối tên và move vào folder item
class PointCard extends StatelessWidget {
  final image;
  final name;
  final point;

  PointCard({Key key, this.image, this.name, this.point}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: setBorder('bottom', Color(0xffC9C8C8), 1),
      margin: EdgeInsets.only(
          left: SizeUtil.smallSpace, right: SizeUtil.smallSpace),
      // TODO-QAnh: không set height như này, set height cho image và để wrap content
      height: 80,
      child: GestureDetector(
        onTap: () {
          RouteUtil.push(
              context,
              PointHistory(
                image: 'photo/voucherVCB.png',
                name: 'VCB',
                point: 200,
              ));
        },
        child: Row(children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              this.image,
              fit: BoxFit.cover,
              width: SizeUtil.iconSizeLarge,
              height: SizeUtil.iconSizeLarge,
            ),
          ),
          Expanded(
            // TODO-QAnh: thay Container bằng Padding
            child: Container(
                // height: 90,
                padding: EdgeInsets.only(top: SizeUtil.smallSpace),
                // TODO-QAnh: thay ListView bằng Column
                child: ListView(
                    padding: const EdgeInsets.all(SizeUtil.midSmallSpace),
                    physics: NeverScrollableScrollPhysics(),
                    children: <Widget>[
                      Text(this.name,
                          style: TextStyle(
                              fontSize: SizeUtil.textSizeBigger,
                              color: ColorUtil.primaryColor,
                              fontWeight: FontWeight.bold)),
                      Padding(
                          padding:
                              const EdgeInsets.only(top: SizeUtil.tinySpace),
                          // TODO-QAnh: chuyển sang file arb
                          child: Text(this.point.toString() + ' điểm',
                              style: TextStyle(
                                  color: ColorUtil.darkGray,
                                  fontSize: SizeUtil.textSizeBigger))),
                    ])),
          ),
          // TODO-QAnh: k dùng ảnh png, dùng Icon
          Image.asset(
            'photo/right.png',
            width: 10,
            height: 20,
          )
        ]),
      ),
    );
  }
}
