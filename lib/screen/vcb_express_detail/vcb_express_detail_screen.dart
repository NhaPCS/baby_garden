import 'package:baby_garden_flutter/generated/l10n.dart';
import 'package:baby_garden_flutter/screen/base_state.dart';
import 'package:baby_garden_flutter/util/resource.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nested/nested.dart';

class VCBExpressDetailScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _VCBExpressDetailScreenState();
  }
}

class _VCBExpressDetailScreenState extends BaseState<VCBExpressDetailScreen> {
  @override
  Widget buildWidget(BuildContext context) {
    // TODO: implement buildWidget
    return Scaffold(
      backgroundColor: ColorUtil.lineColor,
      appBar: getAppBar(title: S.of(context).vcb_express.toUpperCase()),
      body: Padding(
        padding: const EdgeInsets.only(left: SizeUtil.smallSpace,right: SizeUtil.smallSpace,top: SizeUtil.smallSpace),
        child: ListView(children: <Widget>[
          Column(
            crossAxisAlignment:  CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                S.of(context).vcb_ex_detail_short_title,
                style: TextStyle(
                    fontSize: SizeUtil.textSizeBigger,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: SizeUtil.normalSpace,
              ),
              Text(
                S.of(context).vcb_ex_detail_post_time("09:37 - 19/09/2019"),
                style: TextStyle(
                    fontSize: SizeUtil.textSizeExpressDetail,
                    fontWeight: FontWeight.bold,
                    color: ColorUtil.textHint),
              ),
              Text(
                S.of(context).vcb_ex_detail_full_title,
                style: TextStyle(
                    fontSize: SizeUtil.textSizeExpressDetail,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                S.of(context).vcb_ex_detail_first_content,
                style: TextStyle(
                    fontSize: SizeUtil.textSizeExpressDetail,
                    fontWeight: FontWeight.normal),
              ),
              Card(
                child: Image.asset("photo/vcb_exp_detail_img.png",
                    width: MediaQuery.of(context).size.width),
              ),
              Text(
                S.of(context).vcb_ex_detail_second_content,
                style: TextStyle(
                    fontSize: SizeUtil.textSizeExpressDetail,
                    fontWeight: FontWeight.normal),
              ),
            ],
          ),
        ]),
      ),
    );
  }

  @override
  List<SingleChildWidget> providers() {
    // TODO: implement providers
    return null;
  }
}
