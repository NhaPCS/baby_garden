import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContactTab extends StatelessWidget {
  final BuildContext context;

  const ContactTab({Key key, this.context}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        // TODO-QAnh: khong add anh test vao asset, xoa het anh test di
        Image.asset(
          'photo/voucherViettel.png',
        ),
        Padding(
          padding: SizeUtil.smallPadding,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(bottom: SizeUtil.smallSpace),
                  child: Text(
                    '[Deal giảm linh đình] Gói ưu đãi trị giá 200.000 đ chỉ với 1000 đ',
                    style: TextStyle(
                        fontSize: SizeUtil.textSizeDefault,
                        color: Color(0xff444444),
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: SizeUtil.midSmallSpace),
                  child: Text(
                    S.of(this.context).providerInfo,
                    style: TextStyle(
                        fontSize: SizeUtil.textSizeDefault,
                        color: Color(0xff444444),
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: SizeUtil.midSmallSpace),
                  child: RichText(
                      text: TextSpan(
                          text: '',
                          style: TextStyle(color: Colors.black),
                          children: [
                        TextSpan(
                          text: S.of(this.context).address,
                          style: TextStyle(
                              fontSize: SizeUtil.textSizeDefault,
                              color: Color(0xff444444),
                              fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                          text:
                              ': Tập đoàn Vingroup số 7 Đường Bằng Lăng 1, Việt Hưng, Quận Long Biên, Hà Nội.',
                        )
                      ])),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: SizeUtil.midSmallSpace),
                  child: RichText(
                      text: TextSpan(
                          text: '',
                          style: TextStyle(color: Colors.black),
                          children: [
                        TextSpan(
                          text: S.of(this.context).email,
                          style: TextStyle(
                              fontSize: SizeUtil.textSizeDefault,
                              color: Color(0xff444444),
                              fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                          text: ': anhnq@deptrai.hust.vn',
                        )
                      ])),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: SizeUtil.midSmallSpace),
                  child: RichText(
                      text: TextSpan(
                          text: '',
                          style: TextStyle(color: Colors.black),
                          children: [
                        TextSpan(
                          text: S.of(this.context).telePhone,
                          style: TextStyle(
                              fontSize: SizeUtil.textSizeDefault,
                              color: Color(0xff444444),
                              fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                          text: ': 19001789',
                        )
                      ])),
                ),
                // TODO-QAnh: khong add anh test vao asset, xoa het anh test di
                Image.asset('photo/google_map.png')
              ]),
        ),
      ],
    );
  }
}
