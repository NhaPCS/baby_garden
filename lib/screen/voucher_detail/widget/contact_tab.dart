import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:baby_garden_flutter/widget/image/my_cached_image.dart';
import 'package:baby_garden_flutter/widget/text/my_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ContactTab extends StatelessWidget {
  final dynamic voucher;

  const ContactTab({Key key, this.voucher}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        MyCachedImage(
          url: voucher['img'],
        ),
        Padding(
          padding: SizeUtil.smallPadding,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                MyText(
                  voucher['info'],
                  style: TextStyle(
                      fontSize: SizeUtil.textSizeDefault,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: SizeUtil.smallSpace,
                ),
                Text(
                  S.of(context).providerInfo,
                  style: TextStyle(
                      fontSize: SizeUtil.textSizeDefault,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: SizeUtil.smallSpace,
                ),
                RichText(
                    text: TextSpan(
                        text: '',
                        style: TextStyle(color: Colors.black),
                        children: [
                      TextSpan(
                        text: S.of(context).address,
                        style: TextStyle(
                            fontSize: SizeUtil.textSizeDefault,
                            fontWeight: FontWeight.bold),
                      ),
                      TextSpan(
                        text:
                            ': Tập đoàn Vingroup số 7 Đường Bằng Lăng 1, Việt Hưng, Quận Long Biên, Hà Nội.',
                      )
                    ])),
                Padding(
                  padding: EdgeInsets.only(bottom: SizeUtil.midSmallSpace),
                  child: RichText(
                      text: TextSpan(
                          text: '',
                          style: TextStyle(color: Colors.black),
                          children: [
                        TextSpan(
                          text: S.of(context).email,
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
                          text: S.of(context).telePhone,
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
                SizedBox(
                  child: GoogleMap(
                      markers: Set<Marker>.of([
                        Marker(
                            markerId: MarkerId("id"),
                            position: LatLng(double.parse(voucher['lat']),
                                double.parse(voucher['lng'])))
                      ]),
                      initialCameraPosition: CameraPosition(
                        target: LatLng(double.parse(voucher['lat']),
                            double.parse(voucher['lng'])),
                        zoom: 14.4746,
                      )),
                  height: 300,
                )
              ]),
        ),
      ],
    );
  }
}
