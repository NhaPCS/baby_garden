import 'package:baby_garden_flutter/util/resource.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GuideTab extends StatelessWidget {
  final steps = [
    'Khách hàng chọn " MUA QUA VÍ - 1.000 đ" để mua gói ưu đãi và hoàn thành giao dịch để sở hữu gói ưu đãi.',
    'Khách hàng chọn " MUA QUA VÍ - 1.000 đ" để mua gói ưu đãi và hoàn thành giao dịch để sở hữu gói ưu đãi.'
  ];
  final conditions = [
    'Khách hàng chọn " MUA QUA VÍ - 1.000 đ" để mua gói ưu đãi và hoàn thành giao dịch để sở hữu gói ưu đãi.',
    'Khách hàng chọn " MUA QUA VÍ - 1.000 đ" để mua gói ưu đãi và hoàn thành giao dịch để sở hữu gói ưu đãi.'
  ];

  @override
  Widget build(BuildContext context) {
    var stepIndex = 0;
    var conIndex = 0;
    return Padding(
      padding: const EdgeInsets.only(
          left: SizeUtil.midSpace,
          right: SizeUtil.midSmallSpace,
          top: SizeUtil.midSmallSpace),
      child: ListView(
        children: <Widget>[
          Text(
            '[Deal giảm linh đình] Gói ưu đãi trị giá 200.000 đ chỉ với 1000 đ',
            style: TextStyle(
                fontSize: 15,
                color: Color(0xff444444),
                fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: const EdgeInsets.only(top: SizeUtil.midSpace),
            child: Text(
              'Hướng dẫn cách sử dụng:',
              style: TextStyle(
                  color: Color(0xff444444), fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                top: SizeUtil.midSpace, right: SizeUtil.defaultSpace),
            child: Column(
                children: steps.map((step) {
              stepIndex += 1;
              return Padding(
                padding: const EdgeInsets.only(top: SizeUtil.smallSpace),
                child: RichText(
                    text: TextSpan(
                        style: TextStyle(
                          color: Colors.black,
                        ),
                        text: '',
                        children: [
                      TextSpan(
                          text: 'Bước $stepIndex: ',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(text: step)
                    ])),
              );
            }).toList()),
          ),
          Padding(
              padding: const EdgeInsets.only(top: SizeUtil.midSpace),
              child: Text(
                'Điều kiện áp dụng',
                style: TextStyle(
                    color: Color(0xff444444), fontWeight: FontWeight.bold),
              )),
          Padding(
            padding: const EdgeInsets.only(
                top: SizeUtil.midSpace, right: SizeUtil.defaultSpace),
            child: Column(
                children: steps.map((step) {
              conIndex += 1;
              return Padding(
                padding: const EdgeInsets.only(top: SizeUtil.smallSpace),
                child: RichText(
                    text: TextSpan(
                        style: TextStyle(
                          color: Colors.black,
                        ),
                        text: '',
                        children: [
                      TextSpan(
                          text: 'Bước $conIndex: ',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(text: step)
                    ])),
              );
            }).toList()),
          ),
        ],
      ),
    );
  }
}
